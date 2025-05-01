Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B248A8828
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746080062; cv=none; b=c1XkhXVZ7M5tFmBX7KRfXLRK9UFqSiTAj7kufw2Uu7qIh8iR7s7oNOMjAm1GPTh3buE1XKsS8Yw980VxgmAsOUaEY1SkkNiktAJfCRDTEfcHnBvo1n4Vptil6IgMITQmwNgGp6qFKgZyL+O4fZmrtG2nCEe8QIjKlz6mRi4bRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746080062; c=relaxed/simple;
	bh=KWf7uAhNYedZKsn+CY0Ja+5RDAkOW+5ofg6hDxIF6Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSANO6IaJeBkWj4UQ+RfX7B+i7g2mpPbiScAKBt34mk9t3qwEc7mC5iA+sVSC74BbUVOQoBSuUBc7696WEkDd1rOz0CeXzeOId5b8gJyWB5d378h0ycp92hAPgqj72RnVkJEv0sXw0aE80+nCAfva+WytLVkJqSXgcmE8X0FHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEQKgt0u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEQKgt0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746080051; x=1777616051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWf7uAhNYedZKsn+CY0Ja+5RDAkOW+5ofg6hDxIF6Uw=;
  b=IEQKgt0uLfsRWFml5/J6wnU439Tu4y136LQE/7ptZmhlfCtRbQrEsALL
   9HJGbRT+uHB2UmfYXEcDkI+y/8hkhI5oGh5nyL5YXIHwi14WLoqHDj3z9
   0rhCxUaFLtC9WtNvFjzuJfxhyX5aApWjSNpAUH84g12kgERhxCTj/IcNH
   LrR2w0kCO/Kbh/QpaEPK//cNjOZsRmwe/mmrfdzI6BLRdWVNB6e9q5slQ
   8n4n94KwhDkD0AWvJRd5/v7fwJxgUKaT6uh4Q3XpbEs5KmM7Dkb2wD/53
   X5wCUEuV6xWCNVAd7EP8vI9OGvcMm7+pNCKHmw+Ros8cN5mBZkvZ+VeAM
   w==;
X-CSE-ConnectionGUID: 7dx0h7zxSsmB0qCiqU0+Qg==
X-CSE-MsgGUID: uOfav7PFR4SWIiGMzRHTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57948851"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="57948851"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 23:14:10 -0700
X-CSE-ConnectionGUID: uYPpr16CRV+P7JsrQtYV8Q==
X-CSE-MsgGUID: JeGSqGrvST2GTYhosPC/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="135290200"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2025 23:14:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uANBN-0003zh-2g;
	Thu, 01 May 2025 06:14:05 +0000
Date: Thu, 1 May 2025 14:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/mpc832x_rdb.dtb: / (MPC8323ERDB): memory:
 False schema does not allow {'device_type': ['memory'], 'reg': [[0,
 67108864]]}
Message-ID: <202505011404.DMbb58Li-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78109c591b806e41987e0b83390e61d675d1f724
commit: ce4f2199a099c1394ad2343c0e3393690d0cd08f dt-bindings: mmc: mmc-spi-slot: Change voltage-ranges to uint32-matrix
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250501/202505011404.DMbb58Li-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011404.DMbb58Li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505011404.DMbb58Li-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc832x_rdb.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc832x_rdb.dts:174.22-195.6: Warning (unit_address_vs_reg): /soc8323@e0000000/par_io@1400/ucc_pin@2: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc832x_rdb.dts:196.22-215.6: Warning (unit_address_vs_reg): /soc8323@e0000000/par_io@1400/ucc_pin@3: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: / (MPC8323ERDB): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: soc8323@e0000000 (simple-bus): $nodename:0: 'soc8323@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8323-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8323-pmc', 'fsl,mpc8349-pmc']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4500 (fsl,ns16550): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
   	'ns16550' was expected
   	'ns16550a' was expected
   	'ns16850' was expected
   	'aspeed,ast2400-vuart' was expected
--
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400/gpio-controller@1448: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000: failed to match any schema with compatible: ['fsl,qe']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@4c0: failed to match any schema with compatible: ['fsl,spi']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0 (fsl,mpc8323rdb-mmc-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0 (fsl,mpc8323rdb-mmc-slot): compatible:0: 'mmc-spi-slot' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0 (fsl,mpc8323rdb-mmc-slot): compatible: ['fsl,mpc8323rdb-mmc-slot', 'mmc-spi-slot'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: mmc-slot@0 (fsl,mpc8323rdb-mmc-slot): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@4c0/mmc-slot@0: failed to match any schema with compatible: ['fsl,mpc8323rdb-mmc-slot', 'mmc-spi-slot']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/spi@500: failed to match any schema with compatible: ['fsl,spi']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/ucc@3000: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/ucc@2200: failed to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/mdio@3120: failed to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /qe@e0100000/interrupt-controller@80: failed to match any schema with compatible: ['fsl,qe-ic']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
--
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /: failed to match any schema with compatible: ['fsl,OCA4080']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: / (fsl,OCA4080): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: / (fsl,OCA4080): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: aliases: 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p4080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p4080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p4080-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p4080-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p4080-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@44000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@44000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@45000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@45000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /bman-portals@ff4000000/bman-portal@24000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /qman-portals@ff4200000/qman-portal@24000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: crypto@300000 (fsl,sec-v4.0): 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: ethernet@f0000 (fsl,fman-xgec): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/ptp-timer@5fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: localbus@ffe124000 (fsl,p4080-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe200000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe200000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 15] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe201000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe201000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 14] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe202000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /pcie@ffe202000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe202000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: pcie@ffe202000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 13] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi:45.10-88.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /: failed to match any schema with compatible: ['fsl,P4080DS']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: / (fsl,P4080DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: / (fsl,P4080DS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: aliases: 'emi1_rgmii', 'emi1_slot3', 'emi1_slot4', 'emi1_slot5', 'emi2_slot4', 'emi2_slot5', 'phy5_slot3', 'phy6_slot3', 'phy7_slot3', 'phy8_slot3', 'phy_rgmii', 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p4080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p4080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p4080-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p4080-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p4080-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@44000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@44000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@45000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@45000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@46000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /bman-portals@ff4000000/bman-portal@24000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /qman-portals@ff4200000/qman-portal@24000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/i2c@118000/zl2006@21: failed to match any schema with compatible: ['zl2006']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/i2c@118000/zl2006@22: failed to match any schema with compatible: ['zl2006']
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: crypto@300000 (fsl,sec-v4.0): 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/ptp-timer@5fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: localbus@ffe124000 (fsl,p4080-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: localbus@ffe124000 (fsl,p4080-elbc): board-control@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p4080ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p4080ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe200000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe200000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 15] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe201000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe201000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe201000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 14] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe202000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /pcie@ffe202000: failed to match any schema with compatible: ['fsl,p4080-pcie', 'fsl,qoriq-pcie-v2.1']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe202000 (fsl,p4080-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe202000 (fsl,p4080-pcie): pcie@0:interrupts:0: [16, 2, 1, 13] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: mdio-mux-emi1 (mdio-mux-gpio): compatible: ['mdio-mux-gpio', 'mdio-mux'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: mdio-mux-emi1 (mdio-mux-gpio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: mdio-mux-emi2 (mdio-mux-gpio): compatible: ['mdio-mux-gpio', 'mdio-mux'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: mdio-mux-emi2 (mdio-mux-gpio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-gpio.yaml#
--
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:179.11-182.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:187.15-190.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:460.17-463.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /: failed to match any schema with compatible: ['fsl,T2080QDS']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: / (fsl,T2080QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: / (fsl,T2080QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: aliases: 'emi1_slot1', 'emi1_slot2', 'emi1_slot3' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@c0:reg:0:0: 192 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@24000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@28000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@2c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@30000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@34000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@38000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@3c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@40000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /bman-portals@ff4000000/bman-portal@44000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-portals@ff6000000 (simple-bus): $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@24000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@28000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@2c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@34000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@38000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@3c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /qman-portals@ff6000000/qman-portal@44000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: flash@1 (sst,sst25wf040): compatible: 'oneOf' conditional failed, one must be fixed:
   	['sst,sst25wf040', 'jedec,spi-nor'] is too long
   	'sst,sst25wf040' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'sst,sst25wf040' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: flash@1 (sst,sst25wf040): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/spi@110000/flash@1: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: flash@2 (eon,en25s64): compatible: 'oneOf' conditional failed, one must be fixed:
   	['eon,en25s64', 'jedec,spi-nor'] is too long
   	'eon,en25s64' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'eon,en25s64' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: flash@2 (eon,en25s64): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/spi@110000/flash@2: failed to match any schema with compatible: ['eon,en25s64', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@2000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
--
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@4000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000 (fsl,sec-v5.2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon'] is too long
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t2080-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 21 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0: [21, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
--
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:179.11-182.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:187.15-190.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t2080rdb.dts:48.9-50.5: Warning (unit_address_vs_reg): /rapidio@ffe0c0000/port1: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t2080rdb.dts:51.9-53.5: Warning (unit_address_vs_reg): /rapidio@ffe0c0000/port2: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:179.11-182.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:187.15-190.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t2081si-post.dtsi:460.17-463.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /: failed to match any schema with compatible: ['fsl,T2080RDB']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: / (fsl,T2080RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: / (fsl,T2080RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /localbus@ffe124000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t2080-cpld']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@24000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@28000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@2c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@30000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@34000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@38000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@3c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@40000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /bman-portals@ff4000000/bman-portal@44000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-portals@ff6000000 (simple-bus): $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@24000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@28000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@2c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@34000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@38000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@3c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /qman-portals@ff6000000/qman-portal@44000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: flash@0 (micron,n25q512ax3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,n25q512ax3', 'jedec,spi-nor'] is too long
   	'micron,n25q512ax3' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,n25q512ax3' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: flash@0 (micron,n25q512ax3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/spi@110000/flash@0: failed to match any schema with compatible: ['micron,n25q512ax3', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): jr@2000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
--
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): jr@4000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000 (fsl,sec-v5.2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon'] is too long
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t2080-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 21 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0: [21, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
--
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi:44.10-75.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /: failed to match any schema with compatible: ['fsl,T2081QDS']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: / (fsl,T2081QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: / (fsl,T2081QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: aliases: 'emi1_slot1', 'emi1_slot2', 'emi1_slot3', 'emi1_slot5', 'emi1_slot6', 'emi1_slot7' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@a0:reg:0:0: 160 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@c0:reg:0:0: 192 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@e0:reg:0:0: 224 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-snpc@32000: failed to match any schema with compatible: ['fsl,t2080-dcsr-snpc', 'fsl,dcsr-snpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@100000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@108000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@110000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@118000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@24000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@28000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@2c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@30000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@34000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@38000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@3c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@40000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /bman-portals@ff4000000/bman-portal@44000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-portals@ff6000000 (simple-bus): $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@24000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@28000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@2c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@34000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@38000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@3c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /qman-portals@ff6000000/qman-portal@44000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: flash@1 (sst,sst25wf040): compatible: 'oneOf' conditional failed, one must be fixed:
   	['sst,sst25wf040', 'jedec,spi-nor'] is too long
   	'sst,sst25wf040' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'sst,sst25wf040' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: flash@1 (sst,sst25wf040): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/spi@110000/flash@1: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: flash@2 (eon,en25s64): compatible: 'oneOf' conditional failed, one must be fixed:
   	['eon,en25s64', 'jedec,spi-nor'] is too long
   	'eon,en25s64' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'eon,en25s64' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: flash@2 (eon,en25s64): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/spi@110000/flash@2: failed to match any schema with compatible: ['eon,en25s64', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t2080-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@2000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
--
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): jr@4000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v5.0-job-ring' was expected
   	'fsl,sec-v4.0-job-ring' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000 (fsl,sec-v5.2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000: failed to match any schema with compatible: ['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/jr@1000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/jr@2000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/jr@3000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/jr@4000: failed to match any schema with compatible: ['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic', 'fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-a@0: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-b@20: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-c@40: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/crypto@300000/rtic@6000/rtic-d@60: failed to match any schema with compatible: ['fsl,sec-v5.2-rtic-memory', 'fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon'] is too long
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t2080-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe240000 (fsl,t2080-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 21 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe250000 (fsl,t2080-pcie): pcie@0:interrupts:0: [21, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe260000 (fsl,t2080-pcie): pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: pcie@ffe270000 (fsl,t2080-pcie): pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: failed to match any schema with compatible: ['fsl,T4240QDS']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: / (fsl,T4240QDS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: / (fsl,T4240QDS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: aliases: 'emi1_rgmii', 'emi1_slot1', 'emi1_slot2', 'emi1_slot3', 'emi1_slot4', 'phy_rgmii1', 'phy_rgmii2', 'phy_sgmii11', 'phy_sgmii12', 'phy_sgmii3', 'phy_sgmii4', 'phy_xfi1', 'phy_xfi2', 'phy_xfi3', 'phy_xfi4', 'sgmii_phy11', 'sgmii_phy12', 'sgmii_phy13', 'sgmii_phy14', 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy31', 'sgmii_phy32', 'sgmii_phy33', 'sgmii_phy34', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44', 'xfi_pcs_mdio1', 'xfi_pcs_mdio2', 'xfi_pcs_mdio3', 'xfi_pcs_mdio4' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,t4240qds-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,t4240qds-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@138000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@138000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@140000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@140000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@148000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@148000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@150000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@150000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@158000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@158000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@a0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@a4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@a8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@ac000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@b0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@b4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@b8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@bc000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@c0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /bman-portals@ff4000000/bman-portal@c4000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: qman-portals@ff6000000 (simple-bus): $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@a0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@a4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@a8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@ac000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@b0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@b4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@b8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@bc000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@c0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /qman-portals@ff6000000/qman-portal@c4000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: flash@0 (sst,sst25wf040): compatible: 'oneOf' conditional failed, one must be fixed:
   	['sst,sst25wf040', 'jedec,spi-nor'] is too long
   	'sst,sst25wf040' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'sst,sst25wf040' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: flash@0 (sst,sst25wf040): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/spi@110000/flash@0: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t4240-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t4240-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: sec_mon@314000 (fsl,sec-v5.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/ptp-timer@5fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l2-cache-controller@c60000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/l2-cache-controller@ca0000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe240000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe240000 (fsl,t4240-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe250000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 21 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe250000 (fsl,t4240-pcie): pcie@0:interrupts:0: [21, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe260000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe260000 (fsl,t4240-pcie): pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe270000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: pcie@ffe270000 (fsl,t4240-pcie): pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
--
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /: failed to match any schema with compatible: ['fsl,T4240RDB']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: / (fsl,T4240RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: / (fsl,T4240RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: aliases: 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /reserved-memory/bman-fbpr: failed to match any schema with compatible: ['fsl,bman-fbpr']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /reserved-memory/qman-fqd: failed to match any schema with compatible: ['fsl,qman-fqd']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /reserved-memory/qman-pfdr: failed to match any schema with compatible: ['fsl,qman-pfdr']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: dcsr@f00000000 (fsl,dcsr): $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@138000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@138000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@140000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@140000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@148000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@148000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@150000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@150000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@158000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@158000: failed to match any schema with compatible: ['fsl,dcsr-e6500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@14000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@18000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@1c000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@a0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@a4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@a8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@ac000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@b0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@b4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@b8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@bc000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@c0000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /bman-portals@ff4000000/bman-portal@c4000: failed to match any schema with compatible: ['fsl,bman-portal']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: qman-portals@ff6000000 (simple-bus): $nodename:0: 'qman-portals@ff6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@14000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@18000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@1c000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@a0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@a4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@a8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@ac000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@b0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@b4000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@b8000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@bc000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@c0000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /qman-portals@ff6000000/qman-portal@c4000: failed to match any schema with compatible: ['fsl,qman-portal']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/spi@110000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: flash@0 (sst,sst25wf040): compatible: 'oneOf' conditional failed, one must be fixed:
   	['sst,sst25wf040', 'jedec,spi-nor'] is too long
   	'sst,sst25wf040' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'sst,sst25wf040' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: flash@0 (sst,sst25wf040): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/spi@110000/flash@0: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t4240-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,t4240-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e4000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e6000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e8000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@ea000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f0000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@f2000 (fsl,fman-memac): 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.5', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-b@20:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-c@40:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:rtic-d@60:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too long
   	'fsl,sec-v5.4-rtic-memory' was expected
   	'fsl,sec-v4.0-rtic-memory' was expected
   	'fsl,sec-v5.0-rtic-memory' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000 (fsl,sec-v5.0): rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: sec_mon@314000 (fsl,sec-v5.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/ptp-timer@5fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l2-cache-controller@c60000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/l2-cache-controller@ca0000: failed to match any schema with compatible: ['fsl,t4240-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe240000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe240000 (fsl,t4240-pcie): pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe250000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe250000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 21 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe250000 (fsl,t4240-pcie): pcie@0:interrupts:0: [21, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe260000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe260000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 22 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe260000 (fsl,t4240-pcie): pcie@0:interrupts:0: [22, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /pcie@ffe270000: failed to match any schema with compatible: ['fsl,t4240-pcie', 'fsl,qoriq-pcie-v3.0']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe270000 (fsl,t4240-pcie): pcie@0:interrupts:0:0: 23 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pcie@ffe270000 (fsl,t4240-pcie): pcie@0:interrupts:0: [23, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
