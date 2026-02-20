Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD621CC58
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594134; cv=none; b=r5IwuoImd3/TaZShGfQanCMBDj+/uoOqqxU7UpnLjKXD2RzKwcTL35gyziUt6xlOVbHJEhafkyzgb3fMatSAQ2vVrzK59KrMFHqTVnUGg57R8VCkCd6xt+0aqgvqDoacvXrHL0BV9ah8vZoN1hCmr27tVh+Mjbz16SoGUb/bBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594134; c=relaxed/simple;
	bh=fCiOW2VjoZkooXh+ae/JtGtvm1iXjzhsR2V1LbvBLxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCfiex+8XGWNh3GmpilwwlIrvKAxmCRu7Vz3BJ7ZKEQQrlHHTUNdsshOaWShtq0OvE+pghykLSmQCgya9lD0kCDGuTGolDuBsl8Bq9if7gdA5J+6HYHjbsGQ/MWJWLXEq2E916n6NN42jF/Wfx/ZzJ4hLlY6SgBTHkI+o+kUA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL2+a7TO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL2+a7TO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771594132; x=1803130132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCiOW2VjoZkooXh+ae/JtGtvm1iXjzhsR2V1LbvBLxw=;
  b=TL2+a7TOP/TPvLYItakRhM8RBRyfSJ/nyd7DVIdB7PeL9H89RFdlL4JU
   Be0D3KcpCBqkJ6LaP9If4Wt/+vzd/rGPDE4uuB0RQfrbYISiyinQ04waI
   nFsI9LfQlGB1h8BCkFLExUbwlrOazyNABktrLao1n4zjfXz0Cgz8k85qe
   AkDx9lhuALzZoE0VRkxmLolurOp1Q4cQgxYQOViN0pUPf0IdN1syxy9Wt
   Pk2H8miG2UQwrvYo2YthAHZexxq8GjJPmAKDOL34zEGjVQrg8CTePalnp
   8cSbCtcg/vKgKbsk/oWU0g0NW+Ag9e/xrxJHlDlVmlOxFsGjtpPVwlziD
   w==;
X-CSE-ConnectionGUID: C+sqvuhVQdSGUbmAbNgckw==
X-CSE-MsgGUID: KWMBuJ4ZSTm5hIcAwZ8Cxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84138811"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84138811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 05:28:51 -0800
X-CSE-ConnectionGUID: 4eq2nxB2QbGXAq6IURiT9A==
X-CSE-MsgGUID: TK4zzbu8S5mrRNqefsX6rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="237818493"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2026 05:28:50 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtQYq-000000004CX-14HH;
	Fri, 20 Feb 2026 13:28:48 +0000
Date: Fri, 20 Feb 2026 14:28:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
Message-ID: <202602201442.Hlz8IPDn-lkp@intel.com>
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
In-Reply-To: <20260217173457.18628-2-akhilrajeev@nvidia.com>
References: <20260217173457.18628-2-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dmaengine@vger.kernel.org
TO: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vkoul@kernel.org
CC: Frank.Li@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: thierry.reding@gmail.com
CC: jonathanh@nvidia.com
CC: p.zabel@pengutronix.de
CC: Akhil R <akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next tegra/for-next linus/master v6.19 next-20260219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-dma-nvidia-tegra186-gpc-dma-Add-iommu-map-property/20260218-014114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260217173457.18628-2-akhilrajeev%40nvidia.com
patch subject: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add iommu-map property
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20260218 (https://download.01.org/0day-ci/archive/20260220/202602201442.Hlz8IPDn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201442.Hlz8IPDn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602201442.Hlz8IPDn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   scripts/dtc/include-prefixes/arm64/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dtb: / (qcom,sdx55-mtp): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dtb: phy@1c06000 (qcom,sdx55-qmp-pcie-phy): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dtb: rsc@17830000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml
--
   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: / (qcom,sdx55-t55): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: pcie@1c00000 (qcom,pcie-sdx55): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: phy@1c06000 (qcom,sdx55-qmp-pcie-phy): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-t55.dtb: rsc@17830000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml
--
   arch/arm/boot/dts/qcom/qcom-sdx55.dtsi:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dtb: / (qcom,sdx55-telit-fn980-tlb): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml
>> arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 21, 512, 1, 256, 21, 513, 1, 512, 21, 514, 1, 768, 21, 515, 1, 1024, 21, 516, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dtb: phy@1c06000 (qcom,sdx55-qmp-pcie-phy): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dtb: rsc@17830000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
