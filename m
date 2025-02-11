Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F041253F09
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291562; cv=none; b=CJ1GJ7eP80JNgRDyaxF1BWqZ/y027oDBQEs0I8j97sJmMM0zeiENvJk7Xv++l4yNWImvf28d6G/1aKBsr/UVHGYyddHue97APXrvV6UTxPzHPuSvTWx8bge2DXV0Hv93Pb0UbbuUQzEjMm61oxsaLG8w2grGRqUkNpNG3lq2/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291562; c=relaxed/simple;
	bh=xGw2GrLt5HRirrBR+IITfBJdBL94sQyznBM/kWIWQpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQ22CLCYNzUhB3msT3YDDHaLYm5JdaiEOUrXo+yTFC/pEtyclRW8l3hOCubke0aDrqdGRghxrvIeg5yNh93Prgg1IJ1Oy4yynbgjNo5fci4wpVuAVguPx6J3xFIXi0CtG6qGZB0FQgn8dEtBSWGuu6fcHx1Cnv8Y/99wZ3LMFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByJdMVUW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByJdMVUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739291557; x=1770827557;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xGw2GrLt5HRirrBR+IITfBJdBL94sQyznBM/kWIWQpQ=;
  b=ByJdMVUWDEvOx8RmhfjPrSwCozooCG0diSUBRdF1ck3oI+yXojZeVN1K
   DPkVmUHGmaZiGZefiOZxuZDh9VNE8sYjwGN0d2x7+wzvPIM1sTRtVxFFK
   TjLkydKkwL+9WmHar32e88a5KKuZ7nvdwfMxIzgVw/Rm0l9XFKGHuPD8G
   lZeJ5xEg8Zh17vGwa9Bg4jrRGhvsJbtzyQXV9FcuCP28uzjQEkkw3nfR1
   yai1fYqaSMTy4juC+dTS+CkUfFHo98sgEHL5juIZMrznrdZ9tAby+rmYJ
   sIzBkZDhkPIwbGJprxstJZjPvYFSwZdDavq54tyC47BgbYF0CQC+yVXnm
   g==;
X-CSE-ConnectionGUID: lvp8dZfsQwiBuwNr4ZBpGw==
X-CSE-MsgGUID: fSeYl63WRwmETiM/c69vOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43577368"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43577368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:32:35 -0800
X-CSE-ConnectionGUID: FnmD3+NVR7Gs5ZOEmLDRbg==
X-CSE-MsgGUID: Lvg531+qQeWnvsWKTlv49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117173620"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 08:32:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thtBX-0014Rm-0S;
	Tue, 11 Feb 2025 16:32:31 +0000
Date: Wed, 12 Feb 2025 00:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
Message-ID: <202502120026.WDulIihj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: devicetree@vger.kernel.org
TO: linuxppc-dev@lists.ozlabs.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: imx@lists.linux.dev
CC: Scott Wood <oss@buserror.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Naveen N Rao <naveen@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Niklas Cassel <cassel@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Lee Jones <lee@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Krzysztof Wilczyński" <kw@linux.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "J. Neuschäfer" <j.neuschaefer@gmx.net>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Mark Brown <broonie@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-kernel@vger.kernel.org
CC: linux-ide@vger.kernel.org

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-powerpc-Add-Freescale-NXP-MPC83xx-SoCs/20250208-053519
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250207-ppcyaml-v2-3-8137b0c42526%40posteo.net
patch subject: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to YAML
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-051-20250208 (https://download.01.org/0day-ci/archive/20250212/202502120026.WDulIihj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120026.WDulIihj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502120026.WDulIihj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8323-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8323-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8323-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400/gpio-controller@1448: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: $nodename:0: 'qe@e0100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000: compatible: ['fsl,qe'] does not contain items matching the given schema
--
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8360-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8360-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8360-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1418: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1418: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1460: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1460: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000: interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000: $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8378_rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8378-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8378-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8378-pcie', 'fsl,mpc8314-pcie']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8378-pcie', 'fsl,mpc8314-pcie']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8378-pcie', 'fsl,mpc8314-pcie']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8378-pcie', 'fsl,mpc8314-pcie']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: leds: 'hdd', 'pwr' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
--
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@1a000: 'cell-index' is a required property
--
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@c300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/turris1x.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/turris1x.dtb: localbus@ffe05000: nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xcalibur1501.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
>> arch/powerpc/boot/dts/xcalibur1501.dtb: crypto@30000: interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/xcalibur1501.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xcalibur1501.dtb: gpio-leds: 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xcalibur1501.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5301.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
>> arch/powerpc/boot/dts/xpedite5301.dtb: crypto@30000: interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/xpedite5301.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xpedite5301.dtb: gpio-leds: 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5301.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
>> arch/powerpc/boot/dts/xpedite5330.dtb: crypto@30000: interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/xpedite5330.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xpedite5330.dtb: gpio-leds: 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5330.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   	'fsl,ns16550' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5370.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/msi@41600: failed to match any schema with compatible: ['fsl,mpc8572-msi', 'fsl,mpic-msi']
>> arch/powerpc/boot/dts/xpedite5370.dtb: crypto@30000: interrupts: [[45, 2], [58, 2]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/xpedite5370.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/pic@40000: failed to match any schema with compatible: ['chrp,open-pic']
   arch/powerpc/boot/dts/xpedite5370.dtb: gpio-leds: 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/pme@10000: failed to match any schema with compatible: ['fsl,mpc8572-pme', 'pme8572']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@2f000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
   arch/powerpc/boot/dts/xpedite5370.dtb: /soc8572@ef000000/tlu@15000: failed to match any schema with compatible: ['fsl,mpc8572-tlu', 'fsl_tlu']
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /pci@ffe08000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /pci@fffe08000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
--
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8568-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: crypto@30000: Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8568mds.dtb: /soc8568@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
--
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8569-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000: failed to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ethernet@27000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/mdio@27520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000: Unevaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: localbus@ffe05000: serial@4,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000: compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
--
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
--
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000: compatible:0: 'fsl,p1022-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
--
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000: compatible:0: 'fsl,p1020-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: ptp_clock@24e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
