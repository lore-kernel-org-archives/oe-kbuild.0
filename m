Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A778F52
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 03:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758944773; cv=none; b=Vkx6sSJ3ufgrmNBLkJ5EfvRkOZSg+6E9+cMYGYHIj/kd4CgAi8C2uUip6kNUaxr5BIGcry27a1iCzPBWhWhFhjaq0ElebAjabUxYAAErzdAQCokEG2Zrlyy7fvC7vDKYbHLGRRmhwiv4V3ed6dMohEGGLa3Aeu93eTB/mO0SeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758944773; c=relaxed/simple;
	bh=0QmL4CpukVHnVvyq+dr0ksKR6Jo7vZqT3xIuxLvOkJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMJih9zFRL5KilVVy8A8E21LB+csvQ8+/ZR6DHAEby0vfVhnQ/SOr6D6sjKCj2SoK33nbyPKDLpHiYQFxSjj5X63NBz54vjuTOHPlzNK4zQep+hiT+c9e5B75Vb4cc6tIHz3ciPDor2JWaZnTqs0YQYudBxrP5qRqjAKCt16gHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeQDq9Yv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeQDq9Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758944770; x=1790480770;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0QmL4CpukVHnVvyq+dr0ksKR6Jo7vZqT3xIuxLvOkJk=;
  b=XeQDq9YvD0Jtv+lMborE5VqiT2i65G1KW7xRVWBxYAqjRucotgfhKU7D
   ZLxQQVYcMnJc3JVT/ThlvVOT3/ZQVEiTgUXc109xsweJjvgldKprqmvWP
   d2j0M9JXKGxrXNAjKQvkaTV+zSiQTs+gyUfFB/KtdlZ53dzd1ZJyIDMPy
   cYahnmhhZyksWVpgJsFC97R08alVANTMKjh27Yc26MWUrLV7jJS+6e8Zw
   uchtGCb/9mc4Y2B7RO7Z/uzslUhbMUTCOLRuYwVmZFAgCvfn9TAJJJslz
   LbQXThYeS/ZLNmgLmgiPt+pX87x+NXxQeX3Ki74yHwXrWBa/FEHyoXFrS
   w==;
X-CSE-ConnectionGUID: IQoSlnNeQTyLFdH0M2eSMg==
X-CSE-MsgGUID: nwGSlO21Rriy7QS5I3sRQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86719189"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="86719189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 20:46:09 -0700
X-CSE-ConnectionGUID: FEDsxBI0QKu/bUPCalwvzw==
X-CSE-MsgGUID: KEBfQIdsRBezCHKmQr7aqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="178216238"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Sep 2025 20:46:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Lss-0006lv-0g;
	Sat, 27 Sep 2025 03:46:06 +0000
Date: Sat, 27 Sep 2025 11:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing
 nvidia,tegra-pcie.txt bindings documentation into a YAML schema
Message-ID: <202509271308.VhTfdiJe-lkp@intel.com>
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
In-Reply-To: <20250926072905.126737-2-linux.amoon@gmail.com>
References: <20250926072905.126737-2-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-PCI-Convert-the-existing-nvidia-tegra-pcie-txt-bindings-documentation-into-a-YAML-schema/20250926-153302
base:   4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
patch link:    https://lore.kernel.org/r/20250926072905.126737-2-linux.amoon%40gmail.com
patch subject: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing nvidia,tegra-pcie.txt bindings documentation into a YAML schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250927 (https://download.01.org/0day-ci/archive/20250927/202509271308.VhTfdiJe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271308.VhTfdiJe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271308.VhTfdiJe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): Unevaluated properties are not allowed ('dvddio-pex-supply', 'hvddio-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
--
   	'google,nyan-blaze-rev9' was expected
   	'google,nyan-big-rev9' was expected
   	'google,nyan-big-rev6' was expected
   	'nvidia,tegra186' was expected
   	'nvidia,tegra194' was expected
   	'nvidia,tegra234' was expected
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): Unevaluated properties are not allowed ('dvddio-pex-supply', 'hvddio-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): Unevaluated properties are not allowed ('dvdd-pex-supply', 'hvdd-pex-pll-supply', 'hvdd-pex-supply', 'iommus', 'vddio-pexctl-aud-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pcie@10003000 (nvidia,tegra186-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pcie@10003000 (nvidia,tegra186-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pcie@10003000 (nvidia,tegra186-pcie): Unevaluated properties are not allowed ('dvdd-pex-supply', 'hvdd-pex-pll-supply', 'hvdd-pex-supply', 'iommus', 'vddio-pexctl-aud-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
