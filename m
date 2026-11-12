Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467977;
	b=jAbmITCdoKN1IIiPRytYghkbaKjQJolE9oohaPrKq/nSKMyIYKzkTCSnuOr1vRrnyOrw
	 TCajYz+FH8CCLm4iov6GhDw2AbWfpvyPq/Fyy/ii6AnTyIf3lXHb773BvSDL0hjKKtIC+
	 MBta2u/Rj5A9HXksk5C+oIfReAq6CnnmnBNXItX0J6da7jrPKGi4u4xxJysKL3jVTv6sf
	 8GBEfg162fr59+/qyvsLFN/1iF6K9UW7ux9GzwdokS5SlxoxvQwAB4qxOUDbWBFwIokGB
	 4Epo0hhrkaJYlgfMN9fyGO4P65ON4sOnsGp/yiM74kRIBR6qGTAqnqNjG0rylFH47pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467977;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Vt6ia3EVAYGeBp1b18v2AFJxiahdY11M82R9UY1HKHQ=;
	b=4a7PeS6UCGUOeEl2hcVNkrgPxCJj9YWMC/xxlH3JIPDbUY1hGmBsup8zFRzgXgWH7pOQ
	 8RlnYBM9DbLt+XLawCyk4SL77/qebcceM/cojWMchd3pBuOzG8WPwN3rv+EXvsBhy3mhv
	 LxKHgKiRukUAcRmpeUT1POdicxd7H+IXJZL9oAE6jhHF4e5vNanHYPfPaK7HKkKqbbt2M
	 4K1QD/4geK8II7yGVivv0KHrFxZmyMzV7bIdp+9PHLnTBGIkpCyyKd2iDn46+So9mcL/U
	 0dvV/nYP9MUe9HCig9P5NHc59Ckuazd6qv/rqb9wkSuSdL3JrrABqK8iwBkGsyKX/6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W0dZ3D+6;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14578606A8AE
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 07:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14578606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W0dZ3D+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794467976; x=1826003976;
  h=date:from:to:cc:subject:message-id;
  bh=RjnA+7ImcpBXlKTAvUGTOYtSPKh5TR63VHNaAL/+qIE=;
  b=W0dZ3D+6T2YN5uQL6QHqamx6slSEwZ33kqdaGciIJ3bYF2znoMpDRk3E
   UDYTG7veIS1TDXFoppsaj9VLZpiBIUPXS4KQ3VT7kmS3oz9CP1e9biP9t
   CUQvVzz2eX+J4EKZhgncHMEEVBSTBU0Z0q1kqTGOyftehm3ztM0PuwSyp
   AfHcw3Ysf0MJKlE93JBn34RJbB6d9D89TSfhR6E4COgqCA2VxnHTdgNAw
   Ick816HY9O5lS3YHUpABinnTIh162xvqEG2m8bQo+SFeSWYHur2ybeUF7
   Y3PEEYsGzdrwcWE2kMrICg+HeeWghyMdi9sounsacTS7stKHJBpBQAM4E
   Q==;
X-CSE-ConnectionGUID: rh0xVc2lS7+Q7K+TLL3HIw==
X-CSE-MsgGUID: 3qIc3pbzQbKZd9KuKpPO+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3263990"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3263990"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:19:36 -0800
X-CSE-ConnectionGUID: C21Dx85QR5KgrIPt8RGg+w==
X-CSE-MsgGUID: RpZY/2yfQReEfNd9V6jB7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8753152"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2026 23:19:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRP5o-000000000pn-23EW;
	Thu, 12 Nov 2026 07:19:32 +0000
Date: Thu, 12 Nov 2026 08:18:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 88/242]
 arch/arm64/boot/dts/apple/t6031-j514c.dtb: spmi@2a1014000 (apple,t6031-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611120812.8JKdkNHA-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611120812.8JKdkNHA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120812.8JKdkNHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120812.8JKdkNHA-lkp@intel.com/

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
