Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376330;
	b=T07zYVPvJkznPbXfr+VeRCE+7Nab7FTN34oMPxn1srtb/EpchpA5tP4GSDlwVGW7fcRq
	 3nLLHb772iB0zQ8FJE45ykI/nDivXKmsG+4NrrZQ3GVmkD983AJidBW3biQg58rmWu1JJ
	 x4oXwhVhnHOY5tr2IyJ71zPruaoOszxzyE4KLyvQuDxT+IPsDKv4OEScbUkxkWCFCfmVd
	 QGoYxDsf+lT7moD6TOG+Dnl1EoLmNmgHSG4mr226GfiIdKYVEs+7HuheLrGANTHSjE3Zs
	 mg5LMO1drkOrogK2i30J0GWXrJLzDl1VuiRlBGzmQJ6HsYASA1nUxSG0fW7Y768rdYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376330;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BuuF9Wfg7oWvbFNOSkuEvHuR4/8qLb0bVuWHdRHIZu4=;
	b=BMYgzRj3ByPO+UXxums6w7ZtsHUNoPUl1Nymjmx1+sOXVZqS//Olr/l453LlIbePWw3N
	 7k3YofbDV0Fiqulkoc+AFAtnLPZFCy/98h3NHNhKR+DQcYA+74us9Fydvk7I0OxZntqGy
	 rSJzGqA5FW1So+C6XJ+adiu9oGpfS3HyPryFpQuTf1qRxU5ciEy8z++fXpO0zzlWqvExP
	 wrSeQbKen2097mavwioRkrVOYyyLC+SQewRkL3a2AlIM1YMgkvvhEV7wyqYutBke2V5IT
	 zAewY1ul5UrSVuqh+we5RTgyQ3rLT+O8JxXpplXTmxDANP/14vUf3B78DgeZ3G1NKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSwIFuLs;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD3606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 05:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSwIFuLs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794376329; x=1825912329;
  h=date:from:to:cc:subject:message-id;
  bh=odC08DO9s4MNEeD/hHmm96MUzWp+8CrgI7976qYGa0U=;
  b=ZSwIFuLsBBrZUkFo/dskNKOY0gA4EFAh+DCC2C6Pug9oR1R2h5VjQMIe
   DVu7Q/pWz6eV6+uBjSSO1V++8tLesId/H4BvhOtBHt7/9LOzaEL4nPRLd
   iaqi+XBSLzXgrG3fTIDmyGj+XpJlaTXSeg1Nvt1bUfcBo2dw1Z9UA4Jmi
   v5mxY0qtG7V7Eb7kglSoEDO+XKP+iyw1zubKNon3r6D2kWcoNletmbGli
   OlduQsNUlxx/L1m15RYSlma3Fw08fhtNOr7Sc9zddU/NKiGXaatXbvd9q
   d5TNK7D82TK+qCTky7yFx4BXAEK6vY2zI5fXn1UL5B3Kv8utAP7BrWq47
   Q==;
X-CSE-ConnectionGUID: X9FLi6rmSHu9KSWCCaq0LQ==
X-CSE-MsgGUID: 6FTUImXFStqFzFoX3cfVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3047712"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3047712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 21:52:09 -0800
X-CSE-ConnectionGUID: LGzcumLRToW5ury/BYCBlQ==
X-CSE-MsgGUID: FdKJ2l0hRoW4sOzsNmPHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8165587"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2026 21:52:07 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR1Fd-000000000Wd-1Y20;
	Wed, 11 Nov 2026 05:52:05 +0000
Date: Wed, 11 Nov 2026 06:51:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 88/242]
 arch/arm64/boot/dts/apple/t6031-j514c.dtb: spmi@2a1014000 (apple,t6031-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611110647.Rm3439DV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: b4b489139e5f90b20526db0ce9f1d562b1d5cf18 [88/242] arm64: dts: apple: t6031: Add more hardware
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611110647.Rm3439DV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110647.Rm3439DV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110647.Rm3439DV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:106.27-110.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:112.31-116.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: spmi@2a1014000 (apple,t6031-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6031-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/spmi@2a1014000: failed to match any schema with compatible: ['apple,t6031-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6031-j514c.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:106.27-110.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:112.31-116.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: spmi@2a1014000 (apple,t6031-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6031-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/spmi@2a1014000: failed to match any schema with compatible: ['apple,t6031-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6031-j516c.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:106.27-110.5: Warning (unit_address_vs_reg): /soc@200000000/smc@2a4400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:112.31-116.5: Warning (unit_address_vs_reg): /soc@200000000/smc@2a4400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: spmi@2a1014000 (apple,t6031-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6031-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/spmi@2a1014000: failed to match any schema with compatible: ['apple,t6031-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6032-j575d.dtb: /soc@200000000/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:106.27-110.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:112.31-116.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: spmi@2a1014000 (apple,t6031-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6031-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/spmi@2a1014000: failed to match any schema with compatible: ['apple,t6031-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6034-j514m.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:106.27-110.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6031-die0.dtsi:112.31-116.5: Warning (unit_address_vs_reg): /soc/smc@2a4400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: spmi@2a1014000 (apple,t6031-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6031-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/spmi@2a1014000: failed to match any schema with compatible: ['apple,t6031-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/spmi@2a1014000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: smc@2a4400000 (apple,t6031-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: smc@2a4400000 (apple,t6031-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6031-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6031-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/smc@2a4400000: failed to match any schema with compatible: ['apple,t6031-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6034-j516m.dtb: /soc/smc@2a4400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
