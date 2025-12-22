Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9EC3321A1
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415025; cv=none; b=YqQHYaOmNLX4pcAp+ZkPfpLj/EcgooEftNgaXGOTPOLenKNArkm9+WRKcBGMOOI0zzu2CWLIVNYcugcwpGOQh0Da6+2eQpY6OX7QPT+40qK7WmwG/ItBqasOvYGESIEcSF8gfXO6NkhNl6IG22KEm2cF7M1ECS+DO3xLnpjdt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415025; c=relaxed/simple;
	bh=xEEiD/gmNtwL8nOv93Gl2C9ifR5gGJJI3qR28US0e/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jx5QP6mbGBvW/t0G+DtUdW1gXhMJVeJgAV4iXxMCjPUMUcrWTkpxAC3/hcQg5YNQxsu9mEIByCwUoOaZuv50ZDzkHzz1aarKXRUUViPPjPWlA6FW8bX/xZTAdTChu/vBDNgtVmhG57aYzTurCTVkf0cFNVG3tnG0BnqOWj/1Qjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGFnHk/i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGFnHk/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766415024; x=1797951024;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xEEiD/gmNtwL8nOv93Gl2C9ifR5gGJJI3qR28US0e/M=;
  b=JGFnHk/iWhOIn5nWERhCVuVixFlYtvZ5flD4/r0RjjMEGn3hdhCHfey2
   7+ekQSHepFBDujDWtnMl57p6xMexWyZGOZU6e+wTi4tGAuej0qVHJRexM
   1ye4LBQTmWGEOzVkkKEvNYcOw0WgZdCvgscyNkPGEtIM1qcXHB5opkIht
   esxYl4436PxZZ7YKwCUH0gLdQB7WvqN0bTI5WgR3O0USP/cujkPcky4BU
   RKQOtpRcJ4uH05BvRK7UNJXAsKYw1w9uJ91zkx9oBl9RdYY77rifJXqxH
   DWcIDtbMv+b3ooG8AxpgHdeNHNc7nI5JkNG2vOPKKpY3iaksn8RvAhgCD
   Q==;
X-CSE-ConnectionGUID: EKS9b2IDTGm7mPP97guu3Q==
X-CSE-MsgGUID: lfGFvSg/QH+LbjHor6YLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68206487"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68206487"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:50:23 -0800
X-CSE-ConnectionGUID: izyBFdT0SiepCG+7Kvn+Cw==
X-CSE-MsgGUID: yJMHeMN+Qri38zX7jlHeeg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 06:50:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXhEp-000000005XM-1SYJ;
	Mon, 22 Dec 2025 14:50:19 +0000
Date: Mon, 22 Dec 2025 15:49:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: Convert nvidia,tegra-pcie to DT
 schema
Message-ID: <202512221535.YVUR1tc7-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2052-20251216 (https://download.01.org/0day-ci/archive/20251222/202512221535.YVUR1tc7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221535.YVUR1tc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221535.YVUR1tc7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pcie@1003000 (nvidia,tegra210-pcie): Unevaluated properties are not allowed ('dvddio-pex-supply', 'hvddio-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
--
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): Unevaluated properties are not allowed ('dvddio-pex-supply', 'hvddio-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
--
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@1,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): pci@2,0: Unevaluated properties are not allowed ('phy-names', 'phys' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pcie@1003000 (nvidia,tegra210-pcie): Unevaluated properties are not allowed ('dvddio-pex-supply', 'hvddio-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): pci@2,0:nvidia,num-lanes: 0 is not one of [1, 2, 4]
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): Unevaluated properties are not allowed ('dvdd-pex-supply', 'hvdd-pex-pll-supply', 'hvdd-pex-supply', 'iommus', 'vddio-pexctl-aud-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
