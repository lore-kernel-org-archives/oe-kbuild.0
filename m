Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236E442C
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jan 2025 00:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736729514; cv=none; b=HDPteql67X+haPD4nsFlZgFFkARTiV9l6jGLKbxpOIdtR6d6bK0E65k66y6Ym6lqd6tOBkItg15DhpWTNWRimVBDGKaGctRCbDjm1KKNYVtCnU1xZUtBMx4cV8BVQ5T5OC0NN6nZRVSXy3dhnWHn1ltPyQQ24MH0PP9hM0gqfC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736729514; c=relaxed/simple;
	bh=JENo2a17pb+G74Kk39QgGYcH8GDCHZp0yEHscPU8xOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGbJHVz6lpKosQKyVoZnNrXdb6l4CI3aU7NKQGlgAptvqKf8XUbWeq0Faf33y6krFxO5zn5lhdLD6wFo2In5EUtYG1lgQstd7A7gW5PkQb/nS3PtCT5G+FkcCLI2J7BZMeyukhcTI2Mvp1S5K5Yj6SBmN5pVvoqQDWjrVtVXP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtUTOQBs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtUTOQBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736729512; x=1768265512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JENo2a17pb+G74Kk39QgGYcH8GDCHZp0yEHscPU8xOI=;
  b=TtUTOQBsrawhYN/Hx6lJ2pZpt0L/cpqbY6inOcnvO2F7J7D10MlYnatC
   isiMY3kwx0ZYEVih8FzHClumVy4uyjwnQA3ENA4bZRTxvNKnwLYp4Wq9p
   wmqxzkT0wLWouy3Dv/uqIaoN6PT7Y6auP1dAryVjkb/Sby2MslQCoP0ro
   Ph1qYCMH+GK/wv1Av/6scg34y7Ptwm0xgc0XlKMoVi7qyxYTdOAUfx0FR
   AUXZn/5lYvcUcmLDC/wgT3+nFKqzY6jzivLirFWRwMp80/MIdGwvCY1yp
   jCjHFmCeWrbnIhozmJsChys/aGMAuUMJeb8kKVQS7OB+84HpWgOH2fwau
   A==;
X-CSE-ConnectionGUID: bOWY42d0SRG2Zckt3FNM4w==
X-CSE-MsgGUID: SHpSS1VCTqi8LMZlBiL+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39787601"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39787601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 16:51:51 -0800
X-CSE-ConnectionGUID: FnC480PBTpO5DhyHbxg9cw==
X-CSE-MsgGUID: gWlpgtizSte5K6NeFFlCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127560890"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2025 16:51:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX8gG-000MYl-0a;
	Mon, 13 Jan 2025 00:51:48 +0000
Date: Mon, 13 Jan 2025 08:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 223/228]
 arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000: interrupts: [[0, 141,
 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0,
 147, 4], [0, 148, 4], [0, 140, 4]] is too long
Message-ID: <202501130841.QENcA3Zz-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   efd5b51452c7e9fc60b51d09716fe163b67657b9
commit: 9eb81b31ab62cfaa243c6fe948b9f7cfdfdad666 [223/228] arm64: dts: qcom: sm8650: Add 'global' interrupt to the PCIe RC nodes
:::::: branch date: 28 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250113/202501130841.QENcA3Zz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130841.QENcA3Zz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501130841.QENcA3Zz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3756.27-3831.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnects: [[191, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c00000: interrupts: [[0, 141, 4], [0, 142, 4], [0, 143, 4], [0, 144, 4], [0, 145, 4], [0, 146, 4], [0, 147, 4], [0, 148, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c00000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
