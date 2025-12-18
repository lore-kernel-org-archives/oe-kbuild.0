Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006C1A23B9
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054531; cv=none; b=h0GoCrHnI2U01oyYH5xpF+AYXdnpWvvQyT/3ERIBX3+rTcvcKuPj7H5qWXsHVZDdtCGGIZyW/qiG/hOBW8vLjStoU0YaUXE8//lxYHl9v0DkmXFhg8d1C/3tsFcZoRjFAaU9BV64u035NSwSOEq2xiqFO6YMSu/xyLSnmTFSuuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054531; c=relaxed/simple;
	bh=XqoUhtsRtdgqtdfmXpR6HO9z5VpaXoVfNySb3PfxiRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQk3GdyczJWL5mFdF5S8uF2WjPGLzLRe9zst8T4t1Szm4U7Yk/Az+sQlcM8BzR263G9rG0FPY7wvp1zFmEwNQgx2zlqbXWbuYtlw+VNtPjs5le0Y9GFHvSWHIp1g9Q3NBjsLh7hoZgJlXNV9NDz/0ivBnihphxFW2sMN+Dcn1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q73WSNtM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q73WSNtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766054530; x=1797590530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XqoUhtsRtdgqtdfmXpR6HO9z5VpaXoVfNySb3PfxiRM=;
  b=Q73WSNtMfsgaVYHF32ICh5C5hNfglmzUKB+P9svW5CFaJFG7dNxfGq9I
   bJw9yY9TbP6q083EDJaCdXKeUi55FYWthDbxa3GV81RS8BHBpot++gs/a
   oYnFipqrtaWbWtl7pSLTAdPWheg8XJ6m4bjzhq8y6WNDzJbnNRsKQmDJL
   MYBrxN4wqs7jUlU29egTFS+F5XvkSdM76TO++zHToT2OLSNidid++OGg9
   4orcMug8GUPHUCZ5b4BM4rOa0g/9PGRR9wnip9xTP3nh83uhmYXYzQLcj
   UhAcFcj722zQLacNojXUgM1jUiehwTmOFlztnBLk3lNgoofdWQxGMgWbS
   w==;
X-CSE-ConnectionGUID: /sIQs9pkRMuVKR1V/lzLww==
X-CSE-MsgGUID: OoW36KGfTLePLyxICP47TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85590037"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="85590037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:42:09 -0800
X-CSE-ConnectionGUID: v6bxmO08RWmB0h0AY3+6VQ==
X-CSE-MsgGUID: X6mvGT5wTfiWXCp6qCqJuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203449913"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 02:42:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWBSP-000000003tw-1XAq;
	Thu, 18 Dec 2025 10:42:05 +0000
Date: Thu, 18 Dec 2025 11:41:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: Convert nvidia,tegra-pcie to DT
 schema
Message-ID: <202512181154.O6CjvAbr-lkp@intel.com>
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
In-Reply-To: <20251215141603.6749-2-linux.amoon@gmail.com>
References: <20251215141603.6749-2-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>
CC: Mikko Perttunen <mperttunen@nvidia.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-PCI-Convert-nvidia-tegra-pcie-to-DT-schema/20251215-231359
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215141603.6749-2-linux.amoon%40gmail.com
patch subject: [PATCH v2 1/4] dt-bindings: PCI: Convert nvidia,tegra-pcie to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20251216 (https://download.01.org/0day-ci/archive/20251218/202512181154.O6CjvAbr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181154.O6CjvAbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181154.O6CjvAbr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1172.15-1182.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1212.15-1222.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1251.15-1261.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1172.15-1182.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1212.15-1222.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1251.15-1261.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1172.15-1182.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1212.15-1222.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1251.15-1261.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:37.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: dma@60020000 (nvidia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: audio-codec@1c (realtek,rt5639): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:906.15-918.4: Warning (unique_unit_address_if_enabled): /usb@c5004000: duplicate unit-address (also used in node /usb-phy@c5004000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:936.15-948.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:810.3-42: Warning (interrupt_map): /pcie@80003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /i2c@7000d000/tps6586x@34: failed to match any schema with compatible: ['ti,tps6586x']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:936.15-948.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:810.3-42: Warning (interrupt_map): /pcie@80003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /i2c@7000d000/tps6586x@34: failed to match any schema with compatible: ['ti,tps6586x']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-tec.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:906.15-918.4: Warning (unique_unit_address_if_enabled): /usb@c5004000: duplicate unit-address (also used in node /usb-phy@c5004000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:936.15-948.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:810.3-42: Warning (interrupt_map): /pcie@80003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /i2c@7000c500/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1130.15-1143.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1174.15-1186.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexa-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'vdd-pexa-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1216.15-1228.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: vi@54080000 (nvidia,tegra30-vi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra30-vi', 'nvidia,tegra20-vi'] is too long
   	'nvidia,tegra20-vi' was expected
   	'nvidia,tegra114-vi' was expected
   	'nvidia,tegra124-vi' was expected
   	'nvidia,tegra132-vi' was expected
   	'nvidia,tegra210-vi' was expected
   	'nvidia,tegra186-vi' was expected
   	'nvidia,tegra194-vi' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
