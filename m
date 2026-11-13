Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612189;
	b=2XyEDXhAhtJ1A13zRktL+H5OKOIgXV76HY4eI88rxdYTFF58v46fXqPRvfzsB19llK4S
	 V+AjNSMhxp+ueLyGuKGfmkC7Cuy0h69CIjLZtTe7JT3BJPsHlr6u+rPvwJi1oSlw3M/MT
	 BWJcV/NCs9SXXqbQLherrLXlskgXWUF+cHLVfbJL5sIsx1l6pLwEkHLuWqYA1Ixu5GtT+
	 /k1eoYJ2iL0+3GLP//k/yyFXpnrhmwbYlze8iQqpWX61ATR0077YGflaZwlEyy1RQxwEb
	 Kwhb4sSgqlChUcBlITuWadZSwYIbd34CVKImydrmdPSqC1LHTkD7PNh7djP497zjhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612189;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sZoEUmos1zxAG+xaeMBWyXIxagMZvU8Dmsb6ATSEHng=;
	b=0/UBCtzvlRA50fQBGSt2KH5IPO99T8BEbxV/s41pfosTruuHfCW2ewNBa6RxK2UX76b9
	 Gn2Op07m9Rl/btvSIqMCQyynWWUW8MdUTEs4K49yPZE1VDzWXU1FjCmZ1plIVsKzJnqsV
	 qbWfrkepjTWNhWRVqIX6jw3yyeu2rshJJiJTy+4Cg1KYVbrxYR67EykOmqd+pSoDSXmqz
	 dUCCTE/bXMtQpgF6nM78YSL2ig4wG2RmQZIRgS4Xxq8Afbl9+oj4X2EbkOpR35DYnN0DE
	 w6n8MaLaNEZdTTkngyqpqlvxnhIBQytZZ7oGhOpg4/pTg6eoKx4wGwdGgsbEuocWEnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQmKNunk;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D4606A893
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 23:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416D4606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQmKNunk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794612179; x=1826148179;
  h=date:from:to:cc:subject:message-id;
  bh=+ZhtL3d4owz3bLRA8IVG8/3MJBBuAe2Iv2cwWcR+TK0=;
  b=PQmKNunkLm6IL0Wlk+Dw8tYC3nRCJutEgQYYvKzQM35Atnjq0Rr9hooK
   tBRyzwWyQfj4xlT+s+2EKgNOU51rjKH8iiJqGChHkRHgU0Bq0vOgQrqak
   nN9s7HAk4MbdlQz2sC5sLO6CkRDcjyIFOWZuqYewVip2MiAYtQZyPP4e3
   NBgecKna/iQ/y3hXZxC/mKAdeifukg5vShByDbpG4IdRzPNkeqcoBm0Uj
   5LB1d6mUqV5T3mpXSgs3nyoD8NzlbSsKEt1+qdFIjNVGa/cwqoauxqcQf
   3f6h40gAZLMLeZSLea1EL2RjEEL54hYdNL1Mkhf1xJluMAkX1LiQ76hHt
   g==;
X-CSE-ConnectionGUID: 7VGvy7YoQEiWzZ2gRGuWpw==
X-CSE-MsgGUID: vpe0dEbyTvSPH+fHg0TMmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3317645"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3317645"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:22:58 -0800
X-CSE-ConnectionGUID: rYvZXJWeQIqXVgteje0q/Q==
X-CSE-MsgGUID: Shwz4ALAT9Ov5G0myJgSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10822800"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 15:22:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS0bf-000000001P3-3EOD;
	Fri, 13 Nov 2026 23:22:55 +0000
Date: Sat, 14 Nov 2026 00:22:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 87/242]
 arch/arm64/boot/dts/apple/t6030-j514s.dtb: spmi@364714000 (apple,t6030-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611140026.2WF82Hxe-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261114/202611140026.2WF82Hxe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140026.2WF82Hxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611140026.2WF82Hxe-lkp@intel.com/

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
