Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9E143752
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720513644; cv=none; b=CAjYEhCYj/qN5JE4gA3EAJHflxjg8ExbDPlv6t/fwXF2YWP1RR4Metph37YYl0npsoCz/M1S9PKM9daVyyQyiuBSXyUOkhkZlfpYG3qT65tZiiaM28sniq4f/DIgTCTiO1XwUWYiZXU2zHYHVmb8f6/iimZxGP8OGGIoMLEHrrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720513644; c=relaxed/simple;
	bh=6GTqlObPbAMj0kXhfAxOqEmc9sQTe5eTptdvMFSQJCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEzn1jKo7isCj4WTYfGvblyYMjsEIqUx573HaYBlEY+Ec1qxyKFFjrtzJxhZc+5aPf8yUuPWYTo73djg6qFinM7EDzPuxt+JTmTmWk2a+aSPxXbLY9yzcG9vzhdKTX81dHQ/AB7U02c//VmIsJoE6YdjbwQhQ1IMs+XCS2qCOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmuMrBlO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmuMrBlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720513642; x=1752049642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6GTqlObPbAMj0kXhfAxOqEmc9sQTe5eTptdvMFSQJCc=;
  b=NmuMrBlOozeW/FuUvkDjgrb94gBGB9qs17DwXFFwGRWxFt6APaFO30oz
   QzI+M6R5zqWx9w56+HZvKwdSYGnaFBF/J4l6KL7ayPOGqy2J4Qhonll7G
   ZkYT7hJFXmgKxtUCH6McB4to8G1rtraPddZ4FnitaqBeHYU9fkxPTeZZx
   wrxR59fN3lpblww6EFkYCl5IlyQjaNYhp2f1TE/rbQXJ7+ZOrh0YUTIGG
   5Oopwnga1IkguvyQOIIBEd8S5IHST0VCd6Z7zmJ+uc2PXUcyben622iNI
   Fl0ihp3B7aU0RYsXmhL8oeRv7M3Gee/nqK7/Qy/4pj07w2IV2Nd5iIuhK
   A==;
X-CSE-ConnectionGUID: LeY8Ah5gRimVSaNSAFd0VQ==
X-CSE-MsgGUID: UAuYdepbTIS2/ZAVvpehPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29147095"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="29147095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 01:27:20 -0700
X-CSE-ConnectionGUID: d5Eyo6axTS2MIgOZxeFDxw==
X-CSE-MsgGUID: 0+jic0D3THWvAkQ+YyiQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47872955"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2024 01:27:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR6Bx-000WTS-06;
	Tue, 09 Jul 2024 08:27:17 +0000
Date: Tue, 9 Jul 2024 16:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 42/43]
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: uqe@2400000: si@700:
 '#address-cells', '#size-cells' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202407091607.Y5w2TuIH-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   011e6a719ead0cbafc1447074e2a7005b18b6071
commit: 716be628d1dbce1241f5de0ab519203c45c5c48e [42/43] dt-bindings: soc: fsl: cpm_qe: convert to yaml format
:::::: branch date: 9 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091607.Y5w2TuIH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091607.Y5w2TuIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091607.Y5w2TuIH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: i2c@21b0000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: uqe@2400000: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: uqe@2400000: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: uqe@2400000: $nodename:0: 'uqe@2400000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: uqe@2400000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'qeic@80', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: qeic@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-si.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-siram.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux_bus: $nodename:0: 'aux_bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [23, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: i2c@21b0000: clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: $nodename:0: 'uqe@2400000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: uqe@2400000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'qeic@80', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: qeic@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-si.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-siram.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux_bus: $nodename:0: 'aux_bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: i2c@21b0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1043a-gpio', 'fsl,qoriq-gpio']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: uqe@2400000: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: uqe@2400000: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: uqe@2400000: $nodename:0: 'uqe@2400000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: uqe@2400000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'qeic@80', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: qeic@80: '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: si@700: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-si.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: siram@1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-siram.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux_bus: $nodename:0: 'aux_bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/aux_bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3500000: fsl,pcie-scfg:0: [25, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
