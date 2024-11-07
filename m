Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A42216A32
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731002854; cv=none; b=M1rnYRhh/i4YQdwWQKFPNhKYyszqaugXwGIxeVv0vxaD4abLqbVnO4yH5vqLqAqEVySgdSJp+NCKHCNrScKymWHaX/EpnPLYnLBt1jy8nj1azMM+o/FNJ9W0iSGWdVdWfZ0GI7rP8hLkdGitvWhAC1USRKxO47yfMHmpZ3SOU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731002854; c=relaxed/simple;
	bh=XNDNfQ23FgIZO5SVRYntsebyexyfprI9EtFEe+ECZvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDnCwzr+t+4Me829eNtuFOqBGMxFjvCPnlRZrIB3RfX1aJKQJg4GfbubKNgnyrqO8CsbS5jYUDV5yaz/UC4wfvuwFXf7RNl+u5CN9UnwfZ0hzevTTddH7Rpe9IKBd5yZonPvWikhZkK2TVzXibC9t1m23Kqg6NB14rKcZ8ZdoVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXOr2j21; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXOr2j21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731002853; x=1762538853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNDNfQ23FgIZO5SVRYntsebyexyfprI9EtFEe+ECZvM=;
  b=cXOr2j21JayCaH7i29/akc5/D9YzTZzkCXHKemvhvcC+/8uU/74THG9b
   00StM7O/bvWZ3Moww57obzLkro3O042j/zfE86rCaM7uoP+sssQ8BmS8F
   O/OhBJ1/iDG960BbLl0Ex82hdcwfqMrkc43Uhmuwd3E+Ly5He/nFUUcJ7
   U9lp80tzObSZ6seNKd1AvW0EgMzKzdYTPQTTLXyNP6mRcjvrhFUDBfTOH
   OXAT2NZdiY1i4CLwFpgNWhSJefWOqyyb+rbWk7dNKv+jWL6IT0NDzEulO
   kMv3Ti6kzKyes9wHQDxJGTtl7tFZP3ldFRbSINO22LDhY4pm/rFdjzsYL
   g==;
X-CSE-ConnectionGUID: dwgHMo4bRgiadKJ0O07KFQ==
X-CSE-MsgGUID: aVlIKqMAQrCu158/cChvfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31028113"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31028113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 10:07:30 -0800
X-CSE-ConnectionGUID: 02znsWSYSjqGARmsWp8phw==
X-CSE-MsgGUID: iflg7UNCScWE3cfhSp52nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="89823036"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 10:07:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t96uj-000qZ8-2E;
	Thu, 07 Nov 2024 18:07:25 +0000
Date: Fri, 8 Nov 2024 02:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.13 127/131]
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: scm: compatible:0:
 'qcom,scm-sar2130p' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',
 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5332',
 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq...
Message-ID: <202411080233.MBfT1DPU-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.13
head:   35e0a4f0a39651a6a6009f516847721cfdc633b7
commit: 6339e41fa39b498b0c9417925e33c80ad61b0e63 [127/131] arm64: dts: qcom: sar2130p: add QAR2130P board file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080233.MBfT1DPU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080233.MBfT1DPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411080233.MBfT1DPU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: scm: compatible:0: 'qcom,scm-sar2130p' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq5332', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-mdm9607', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm8916', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,scm-msm8974', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qcom,scm-msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qdu1000', 'qcom,scm-sa8775p', 'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x', 'qcom,scm-sc8280xp', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx55', 'qcom,scm-sdx65', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm6125', 'qcom,scm-sm6350', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm8150', 'qcom,scm-sm8250', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8550', 'qcom,scm-sm8650', 'qcom,scm-qcs404', 'qcom,scm-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /firmware/scm: failed to match any schema with compatible: ['qcom,scm-sar2130p', 'qcom,scm']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: mmc@7c4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sar2130p-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sar2130p-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sar2130p-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: mmc@7c4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/mmc@7c4000: failed to match any schema with compatible: ['qcom,sar2130p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: dma-controller@900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/dma-controller@900000: failed to match any schema with compatible: ['qcom,sar2130p-gpi-dma', 'qcom,sm6350-gpi-dma']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,sar2130p-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sdm845-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,sar2130p-gpi-dma', 'qcom,sm6350-gpi-dma']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/geniqup@ac0000/i2c@a88000/redriver@4f: failed to match any schema with compatible: ['nxp,ptn3222']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-pcie', 'qcom,pcie-sm8550'] is too long
   	'qcom,pcie-sm8550' was expected
   	'qcom,sar2130p-pcie' is not one of ['qcom,pcie-sm8650']
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c00000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/pcie@1c00000: failed to match any schema with compatible: ['qcom,sar2130p-pcie', 'qcom,pcie-sm8550']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-pcie', 'qcom,pcie-sm8550'] is too long
   	'qcom,pcie-sm8550' was expected
   	'qcom,sar2130p-pcie' is not one of ['qcom,pcie-sm8650']
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c08000: clocks: [[33, 41], [33, 43], [33, 44], [33, 49], [33, 50], [33, 15], [33, 5], [33, 12], [33, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: pcie@1c08000: clock-names: ['aux', 'cfg', 'bus_master', 'bus_slave', 'slave_q2a', 'ddrss_sf_tbu', 'noc_aggr', 'cnoc_sf_axi', 'qmip_pcie_ahb'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/pcie@1c08000: failed to match any schema with compatible: ['qcom,sar2130p-pcie', 'qcom,pcie-sm8550']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-gen3x2-pcie-phy']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,sar2130p-adsp-pas']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: iommu@3da0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
--
   	'arm,mmu-500' was expected
   	'qcom,sar2130p-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,sar2130p-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/iommu@3da0000: failed to match any schema with compatible: ['qcom,sar2130p-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: phy@88e3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-snps-eusb2-phy', 'qcom,sm8550-snps-eusb2-phy'] is too long
   	'qcom,sar2130p-snps-eusb2-phy' is not one of ['qcom,sdx75-snps-eusb2-phy', 'qcom,sm8650-snps-eusb2-phy', 'qcom,x1e80100-snps-eusb2-phy']
   	'qcom,sm8550-snps-eusb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@88e3000: failed to match any schema with compatible: ['qcom,sar2130p-snps-eusb2-phy', 'qcom,sm8550-snps-eusb2-phy']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,sar2130p-qmp-usb3-dp-phy']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: usb@a6f8800: compatible:0: 'qcom,sar2130p-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sar2130p-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sar2130p-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sar2130p-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: power-management@c300000: compatible:0: 'qcom,sar2130p-aoss-qmp' is not one of ['qcom,qdu1000-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/power-management@c300000: failed to match any schema with compatible: ['qcom,sar2130p-aoss-qmp', 'qcom,aoss-qmp']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: thermal-sensor@c263000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,sar2130p-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,sar2130p-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,sar2130p-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,sar2130p-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,sar2130p-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,sar2130p-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sar2130p-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: arbiter@c400000: compatible:0: 'qcom,x1e80100-spmi-pmic-arb' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-pmic-arb.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: arbiter@c400000: compatible: ['qcom,sar2130p-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb'] is too long
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-pmic-arb.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/arbiter@c400000: failed to match any schema with compatible: ['qcom,sar2130p-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: mailbox@ed18000: compatible:0: 'qcom,sar2130p-ipcc' is not one of ['qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc', 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sc7280-ipcc', 'qcom,sc8280xp-ipcc', 'qcom,sdx75-ipcc', 'qcom,sm6350-ipcc', 'qcom,sm6375-ipcc', 'qcom,sm8250-ipcc', 'qcom,sm8350-ipcc', 'qcom,sm8450-ipcc', 'qcom,sm8550-ipcc', 'qcom,sm8650-ipcc', 'qcom,x1e80100-ipcc']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/mailbox@ed18000: failed to match any schema with compatible: ['qcom,sar2130p-ipcc', 'qcom,ipcc']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/pinctrl@f100000: failed to match any schema with compatible: ['qcom,sar2130p-tlmm']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: iommu@15000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,sar2130p-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,sar2130p-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
--
   	'qcom,sar2130p-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,sar2130p-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,adreno-smmu' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	'qcom,smmu-500' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/iommu@15000000: failed to match any schema with compatible: ['qcom,sar2130p-smmu-500', 'qcom,smmu-500', 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: rsc@17a00000: power-controller:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-rpmhpd'] is too short
   	'qcom,sar2130p-rpmhpd' is not one of ['qcom,mdm9607-rpmpd', 'qcom,msm8226-rpmpd', 'qcom,msm8909-rpmpd', 'qcom,msm8916-rpmpd', 'qcom,msm8917-rpmpd', 'qcom,msm8939-rpmpd', 'qcom,msm8953-rpmpd', 'qcom,msm8974-rpmpd', 'qcom,msm8974pro-pma8084-rpmpd', 'qcom,msm8976-rpmpd', 'qcom,msm8994-rpmpd', 'qcom,msm8996-rpmpd', 'qcom,msm8998-rpmpd', 'qcom,qcm2290-rpmpd', 'qcom,qcs404-rpmpd', 'qcom,qdu1000-rpmhpd', 'qcom,qm215-rpmpd', 'qcom,sa8155p-rpmhpd', 'qcom,sa8540p-rpmhpd', 'qcom,sa8775p-rpmhpd', 'qcom,sc7180-rpmhpd', 'qcom,sc7280-rpmhpd', 'qcom,sc8180x-rpmhpd', 'qcom,sc8280xp-rpmhpd', 'qcom,sdm660-rpmpd', 'qcom,sdm670-rpmhpd', 'qcom,sdm845-rpmhpd', 'qcom,sdx55-rpmhpd', 'qcom,sdx65-rpmhpd', 'qcom,sdx75-rpmhpd', 'qcom,sm6115-rpmpd', 'qcom,sm6125-rpmpd', 'qcom,sm6350-rpmhpd', 'qcom,sm6375-rpmpd', 'qcom,sm7150-rpmhpd', 'qcom,sm8150-rpmhpd', 'qcom,sm8250-rpmhpd', 'qcom,sm8350-rpmhpd', 'qcom,sm8450-rpmhpd', 'qcom,sm8550-rpmhpd', 'qcom,sm8650-rpmhpd', 'qcom,x1e80100-rpmhpd']
   	'qcom,sar2130p-rpmhpd' is not one of ['qcom,msm8937-rpmpd']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/rsc@17a00000/power-controller: failed to match any schema with compatible: ['qcom,sar2130p-rpmhpd']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: cpufreq@17d91000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,sar2130p-cpufreq-epss' is not one of ['qcom,qcm2290-cpufreq-hw', 'qcom,sc7180-cpufreq-hw', 'qcom,sdm670-cpufreq-hw', 'qcom,sdm845-cpufreq-hw', 'qcom,sm6115-cpufreq-hw', 'qcom,sm6350-cpufreq-hw', 'qcom,sm8150-cpufreq-hw']
   	'qcom,sar2130p-cpufreq-epss' is not one of ['qcom,qdu1000-cpufreq-epss', 'qcom,sa8775p-cpufreq-epss', 'qcom,sc7280-cpufreq-epss', 'qcom,sc8280xp-cpufreq-epss', 'qcom,sdx75-cpufreq-epss', 'qcom,sm4450-cpufreq-epss', 'qcom,sm6375-cpufreq-epss', 'qcom,sm8250-cpufreq-epss', 'qcom,sm8350-cpufreq-epss', 'qcom,sm8450-cpufreq-epss', 'qcom,sm8550-cpufreq-epss', 'qcom,sm8650-cpufreq-epss']
   	'qcom,cpufreq-hw' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/cpufreq@17d91000: failed to match any schema with compatible: ['qcom,sar2130p-cpufreq-epss', 'qcom,cpufreq-epss']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/cache-controller@19200000: failed to match any schema with compatible: ['qcom,sar2130p-llcc']
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/qfprom@221c8000: failed to match any schema with compatible: ['qcom,sar2130p-qfprom', 'qcom,qfprom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
