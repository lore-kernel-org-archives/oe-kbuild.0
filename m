Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669955;
	b=3yMukQTFSHPikduVWqifvifdxeG4uqEDOPGh+V3oQO7gRkWhS6qD1rQxHG19bS3UOXzF
	 pwfk/ZH7iK7bT8ErntS0xOr1AA/3Xs2ALhfPexrLapJ4sUU2m12T8ndykgwYy5jWDE/5J
	 euiLkzUmSVy3rLf1PTNAkLrej4rDJ5zZR7exZazNbd7yWT48iCCf9xlrSrkElmAvMrvlJ
	 D2Wg9nLlDKPo38vpwwI5Zc1ulhflXquipM0j4/6ZysVUYAhLntWweivgKDHdVsSzs9dwm
	 qiNzA4JQE9zjRz0NMNwxXPBdWyeHxFlwCXpcBT85x8gEpYzSEbIls9tvpHLD98Y2LcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669955;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ik+f7j1WwPUSHCJZcU0FGlRuZZ/49nQLpChINGnoC+U=;
	b=fM2K+DHfVbkLzTpWjFeAUukdWiF1hQRhPQr9969TlQWPVHnVGAw2L0qoJ2nZpN8dd/DO
	 sSpgfLyByKs4KFgA5wKy/MK4LRJp0k3P5DIu126Kosz+ExHCfYVIEUIHH/u6M4bWe+xi0
	 x4obZDvnw7wfRtjJceMy1s6Xud2vgBUijF3rPMpkc/AQ4s1IrifGQXkDXYkqrq6HszFPm
	 nwvwVpdLI0xevWlT/EPalTRcXtU0CbcaqNw/DElpqTlaIeEJon8i7xuXl0JhwZZhT7lvr
	 rcN/LF/39lQSQ3I/vrSXuex8dUHW3BQ49rFXaC/e/r7V1wBRN1tyXiBKBwk9V/1OFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zvwn3CQD;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ABE606A32D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 15:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7ABE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zvwn3CQD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794669955; x=1826205955;
  h=date:from:to:cc:subject:message-id;
  bh=I8BTiV5B4Q1C/GcWKsNE8u06ONMTW08mpx8T44emGVw=;
  b=Zvwn3CQDptvY3TQba3a1BlGfI4fEY0qE44C9f7lDpCb2vyhYUSGJEFtl
   rh1GgJpRIkHtCTSBwNO3aR4JkAvEol5sG8S64uZ9vxdVbC0Yd0YCOWKfc
   m41G+EzHfp2TWLBRv+hLOM6GvaXbV0pZqU4pgLAp0zYnsAqcHMewHvxYx
   LYOMFO5LbZeO+FE5REjI0LDHQjYL6bDMrZ1oqGPB5lw56mGs7XNfXO37D
   KWXXhzTWYbQnCrB8i8src2LPdk5jAlTx/K+DUj8gdJkFBtXhp7Ntu1Q0S
   Xb/Bucd0NBFe+hqRfFi4b88R2qb7RGEukCn/S3qkkT0WOWcf/aKVLd5tE
   Q==;
X-CSE-ConnectionGUID: n3MkBEC/Ss2yqIL7TNM5kA==
X-CSE-MsgGUID: coDPZcBqSl+/wPRGNRVJcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3501357"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3501357"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 07:25:54 -0800
X-CSE-ConnectionGUID: l5fxqnVpQ5yoJ/BkE01J9g==
X-CSE-MsgGUID: lReD0DwMSmak0bTR19+4TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10883112"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 07:25:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSFdW-000000001nj-3wLR;
	Sat, 14 Nov 2026 15:25:50 +0000
Date: Sat, 14 Nov 2026 16:25:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 87/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611141649.5Wz05jHO-lkp@intel.com>
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
commit: da04d8c50639d4def50d7e2effd6cdbefa3c9226 [87/242] arm64: dts: apple: t6030: Add more hardware
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261114/202611141649.5Wz05jHO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141649.5Wz05jHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611141649.5Wz05jHO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j514s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']
--
   arch/arm64/boot/dts/apple/t6030.dtsi:582.28-586.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67500000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t6030.dtsi:588.32-592.6: Warning (unit_address_vs_reg): /soc/smc@36c400000/gpio@67700000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: spmi@364714000 (apple,t6030-spmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-spmi' is not one of ['apple,t6020-spmi', 'apple,t8012-spmi', 'apple,t8015-spmi', 'apple,t8122-spmi']
   	'apple,t6030-spmi' is not one of ['apple,t8103-spmi', 'apple,t6000-spmi', 'apple,t8112-spmi']
   	'apple,spmi' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/apple,spmi.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000: failed to match any schema with compatible: ['apple,t6030-spmi', 'apple,t8103-spmi']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: pmic@b (apple,chapel-pmic): compatible:0: 'apple,chapel-pmic' is not one of ['apple,maverick-pmic', 'apple,sera-pmic', 'apple,stowe-pmic']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/spmi@364714000/pmic@b: failed to match any schema with compatible: ['apple,chapel-pmic', 'apple,spmi-nvmem']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): 'gpio@67500000', 'gpio@67700000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: smc@36c400000 (apple,t6030-smc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6030-smc' is not one of ['apple,t6020-smc', 'apple,t8122-smc']
   	'apple,t6030-smc' is not one of ['apple,t6000-smc', 'apple,t8103-smc', 'apple,t8112-smc']
   	'apple,smc' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000: failed to match any schema with compatible: ['apple,t6030-smc', 'apple,t8103-smc']
>> arch/arm64/boot/dts/apple/t6030-j516s.dtb: /soc/smc@36c400000/gpio@67700000: failed to match any schema with compatible: ['apple,smc-low-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
