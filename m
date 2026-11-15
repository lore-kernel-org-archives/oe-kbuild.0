Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702883;
	b=4PP7MviXl4qgaaxMvnn2+HuQs3yXJ68WxxeSbS1pgCzQ73mmkJjFyUy7ID4bM0tAR2us
	 XDW7lLp5+6Sn1TI1gru0o2AuZwLdouB7AxwSVYD+FDX0RzLA7O/Ku55Bo5a87yJtVq1Ak
	 nBLWCcvHd5cIIuhIcXcrLIzA+juBEOw4h4MKJ2YHYNpJKdKPffwn7xrAKC+Vdlz4KmN98
	 sCpLw/QnURWTKIq0iK0AG5lWjzh6pAyl6VRkBSDma7qgYEg9+L185ZrSXbUOGR6bRWD22
	 oGUtQE08lGF1tYfLhiARYyQUV2Ge39UwRLbYxzQRYmVIk2W1g9/PXrAT14ftUrsjzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702883;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EGWHGeWtM949M79IoWhEEbFh9DSk0uvVljwdknV8ykc=;
	b=r03EQNq7IHcyyI/P/Uy6WGfKwxXl/UrcM1P7gP6lAjmE6PJyRxqZOPcriZe7XSmsu1Y0
	 cDJWmg8e/EjmJGgmA7pa9RZN5f32b6nCpK81FjxksMgpuTxuVUnpzcq6F+NlNYQhRZvjy
	 2Jp7T0w0USmKy1EVZHwKmagkMnNFlE/N9eCOSKK4Wer+B0WHCGAFVpMQsDZnM2BiP1Ag8
	 +QuKAFAo6XlsWW4h7tR/QFVMHLR50YHYaGgb2YXeoXkw7PYaCNEc0xwZCeTai99UZitHq
	 g5q0W50TjhDgBAPrhFp0P+aPA1dRB+9xGZKIapc9hdWTA5rabFzzlVn6eVFAAV9KgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JdsMIKhU;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A5606A329
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 00:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JdsMIKhU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794702882; x=1826238882;
  h=date:from:to:cc:subject:message-id;
  bh=FwBMwUq2KDDCzrLzQars91lQLCa+PAytywxTEMCuEO8=;
  b=JdsMIKhUXYD5fqFbDHWxElET8VWr8ehRuIG9gXpsEPvmABdleKGAch29
   2CJxAgJwm51pmBicaH3oqPERnbXjxEXD/3MMwiiCjCcl7omP7fIERJ8Ll
   0E2RKW/OiccF7zackzYojOgeEuBN7HMho3O7ozTLHA5E8OcL6Dhim6HyH
   ZuLxl7GHAU2Cg+ptwsDmc2a8Dk6SQ254YT3Q+uFQ75mDCY/tIylgLrrYM
   cycKUIYQf0uHrUlfP83Tlzb1QgdBsPeubLXD0R0+ntdAbf328t69+UYO1
   oq9l8XjXLWneo8aaXJ6X3OFbzk//48yd7CbYelUthQSMIumm66G/e0R9N
   A==;
X-CSE-ConnectionGUID: pxrYdTs5TtOvgEEdHuUXEQ==
X-CSE-MsgGUID: Td5SElXpScGj1/cHXR2geA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3381852"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3381852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 16:34:41 -0800
X-CSE-ConnectionGUID: gthksGAVQV+7X0VIqBEBmw==
X-CSE-MsgGUID: 8oxFTZDZTx6ubx0vC3fF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9556625"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2026 16:34:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSOCb-000000001ws-3Jcr;
	Sun, 15 Nov 2026 00:34:37 +0000
Date: Sun, 15 Nov 2026 01:34:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 88/242]
 arch/arm64/boot/dts/apple/t6031-j514c.dtb: spmi@2a1014000 (apple,t6031-spmi):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611150139.NqeE02ZP-lkp@intel.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150139.NqeE02ZP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150139.NqeE02ZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150139.NqeE02ZP-lkp@intel.com/

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
