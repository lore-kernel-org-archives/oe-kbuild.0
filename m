Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6D1E480
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760196490; cv=none; b=f2vl+QKMpCQMEZ7mThZ4R0+uhUEQL8Z5zHz8zNeFSjKfJOWiXBvk69e1VQB/8oiL6V8zjbdH72AaGIRd9r0ghCpUDuPfEeg7kpkdcTJuJjAlAASP+qct4+bAd7FKSKCav3eecvG1d8fNmZ5p8IALYE1XQX60dfzO8MAE+V3e9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760196490; c=relaxed/simple;
	bh=w+bCnZ7ltzZo9LleBcGcuKbO51k1GjBANQ0r5y5i8uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms8QaOVr2G8VKkpjBvBmd78EVj4eypJZ0FLvcS9op7ooAYdKX1wozq1OK+s91VTjQd2oPiVdKPwyO2NhiYA8WefTvISgaghdCTU7LNuGAQY8unYNvIUTxBU5kceFSPI9YqS/bC7Uk0DkuXTnwWMvGAUgoxWdy0GyboI+FfBvRms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO7cLVi3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO7cLVi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760196488; x=1791732488;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w+bCnZ7ltzZo9LleBcGcuKbO51k1GjBANQ0r5y5i8uE=;
  b=CO7cLVi36FSa+PdUwDK9iN2HS6pIojH6JBCK68oWmrwvanEjj2DljBFM
   CjOzL9Av067zje5GCvP5MFsO1R9mdnKXc7szpLqqhWR1SeaFwX/reF1zD
   SUZK+BnJtJFTh8BVgjTzMK1wlUYkUbdrM+Of5Fle7rsQjHedva4tmvvVj
   fCw//WW1ynJrB12jgg+XIN+MUXuXkcrPm1yxdDY8xGNONUEDcaMoJTKn8
   xnHtOGOlo2FqJkkrHPeGlDxcVm7XlIi2zczn9Fj9ZQPD0o0QhTg1vpFHt
   rOsKpFcrhB4v6bd7kqCfk1WpncYl42YoAtUTWg0eKPwzm8rc3qePJvjKA
   Q==;
X-CSE-ConnectionGUID: w2ZJTBCOQbSlVcy6dyCVgQ==
X-CSE-MsgGUID: bE5N9ehzQAGm5Qh38MpMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62274597"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="62274597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 08:28:07 -0700
X-CSE-ConnectionGUID: FBtvG+vHQfKyepSOVdD70A==
X-CSE-MsgGUID: OY1vlBS/SNitdpknz4BRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="185465268"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2025 08:28:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7bVr-0003pf-29;
	Sat, 11 Oct 2025 15:28:03 +0000
Date: Sat, 11 Oct 2025 23:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] dt-bindings: PCI: qcom: Enforce check for PHY,
 PERST# and WAKE# properties
Message-ID: <202510112344.D4GOtHsT-lkp@intel.com>
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
In-Reply-To: <20251010-pci-binding-v1-2-947c004b5699@oss.qualcomm.com>
References: <20251010-pci-binding-v1-2-947c004b5699@oss.qualcomm.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Abraham I <kishon@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
CC: linux-pci@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5472d60c129f75282d94ae5ad072ee6dfb7c7246]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/dt-bindings-PCI-Update-the-email-address-for-Manivannan-Sadhasivam/20251011-022816
base:   5472d60c129f75282d94ae5ad072ee6dfb7c7246
patch link:    https://lore.kernel.org/r/20251010-pci-binding-v1-2-947c004b5699%40oss.qualcomm.com
patch subject: [PATCH 2/3] dt-bindings: PCI: qcom: Enforce check for PHY, PERST# and WAKE# properties
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112344.D4GOtHsT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112344.D4GOtHsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510112344.D4GOtHsT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[127, 2, 1]]
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[73, 2, 1]]
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[128, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[128, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:5045.26-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[75, 2, 1]]
   	False schema does not allow [[51]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
   	'qcom,powered-remotely' is a required property
   	'num-channels' is a required property
   	'qcom,num-ees' is a required property
   	'clocks' is a required property
   	'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): 'oneOf' conditional failed, one must be fixed:
   	'phys' is a required property
   	False schema does not allow [[148, 102, 1]]
   	False schema does not allow [[148, 104, 0]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): pcie@0: 'oneOf' conditional failed, one must be fixed:
   	'reset-gpios' is a required property
   	'wake-gpios' is a required property
   	False schema does not allow [[34]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pcie@1c00000 (qcom,pcie-sm8750): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'msi-map-mask', 'num-lanes', 'operating-points-v2', 'opp-table', 'pcie@0', 'perst-gpios', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pci@1c08000 (qcom,pcie-x1e80100): 'oneOf' conditional failed, one must be fixed:
   	'perst-gpios' is a required property
   	'wake-gpios' is a required property
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pci@1c08000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'msi-map', 'num-lanes', 'pcie@0', 'phy-names', 'phys', 'power-domains', 'ranges', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pci@1c08000 (qcom,pcie-x1e80100): 'oneOf' conditional failed, one must be fixed:
   	'perst-gpios' is a required property
   	'wake-gpios' is a required property
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pci@1c08000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'msi-map', 'num-lanes', 'pcie@0', 'phy-names', 'phys', 'power-domains', 'ranges', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[73, 2, 1]]
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): 'oneOf' conditional failed, one must be fixed:
   	'wake-gpios' is a required property
   	False schema does not allow [[73, 2, 1]]
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[366, 367]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: pci@1c08000 (qcom,pcie-x1e80100): 'oneOf' conditional failed, one must be fixed:
   	'perst-gpios' is a required property
   	'wake-gpios' is a required property
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: pci@1c08000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'pcie@0', 'phy-names', 'phys', 'power-domains', 'ranges', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: pci@1c08000 (qcom,pcie-x1e80100): 'oneOf' conditional failed, one must be fixed:
   	'perst-gpios' is a required property
   	'wake-gpios' is a required property
   	False schema does not allow [[53]]
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: pci@1c08000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'eq-presets-8gts', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'msi-map', 'num-lanes', 'pcie@0', 'phy-names', 'phys', 'power-domains', 'ranges', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
