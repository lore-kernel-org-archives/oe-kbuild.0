Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118DA12D758
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 23:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735341300; cv=none; b=HSHk3tT0jsjg+tVA62CY/b2XwI/W+sjYKifHy0fDMT5/+NUbqsDTeUIY1Ia0iZ2KfpzUgF1xk6fvhOMkj73/Aa2HEraDdq5DWwzA0B935rjXgLywCzCLcKddy9h80dS75+n9tiOJOjgjhNPMGxvdzTrX6dOO/+Mkp+a+AztZ5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735341300; c=relaxed/simple;
	bh=SfU+tr9cqVJsPu+5mFf0sRIDRuHzR8UR0mqkP2fq9Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=imsHMaK4cNATG4y4n5nc6eBX3g0HdcpEV/2PkYwCtzWxi4BSKZOHKz22225dO+gZkDHwGMfn48fSuUqe71jsOVSOguB8ob4h7sv09AKhDw8N0lTLmT3pwy9rkqea4e1d4h/AxKGqGMFux9xPMMZzBpXH6nIlfU1h/dghuKwyQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkOc2dDJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkOc2dDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735341298; x=1766877298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SfU+tr9cqVJsPu+5mFf0sRIDRuHzR8UR0mqkP2fq9Tc=;
  b=NkOc2dDJNErwTZg7e6vMSEYPf/LRhAzNwqk1QI6SdGi7X1x5qQ2c40oE
   14yxhUzajtH29uvSPz/EsklVDQe+Bn0hPDkJU1crsUNFwbr+cjVzxGNcE
   nNShUxzTGXsFROJLwFqynPZTgUKNNp+NqdenSNrjXHNh34d7PcK8NXRVW
   yVl3RCskAPmgCAvi0cUAP5o9FMxvELVuFIXfntnDM96XcHbxe1MPqJIH4
   T7KzCgwVnw1Auk6arzKMGesxP3Fnp/KALpwQq/eojslRryPHOApcztmO7
   nGfyXNthWbBkNrbA9OTufseyyMIxjZCRAHeul4KKDuHQWi8VxCApEz3WS
   g==;
X-CSE-ConnectionGUID: 2h+YsvYtRqm88zOtKuLzHw==
X-CSE-MsgGUID: 3+I4ynzoTu25CYSQjWRozg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39511882"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39511882"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 15:14:57 -0800
X-CSE-ConnectionGUID: 1hFsSmeISWGcc6vqC/RQSw==
X-CSE-MsgGUID: bqeVp3NNTTqpAZQWpSTjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100633363"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Dec 2024 15:14:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRJXi-0003iM-0U;
	Fri, 27 Dec 2024 23:14:54 +0000
Date: Sat, 28 Dec 2024 07:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 86/123]
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/pinctrl@1000000:
 failed to match any schema with compatible: ['qcom,msm8917-pinctrl']
Message-ID: <202412280755.15s0NgxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: 26633b5820569a5e7bb29d713e978107f4a2bd94 [86/123] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 19 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280755.15s0NgxL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280755.15s0NgxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412280755.15s0NgxL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:535.25-538.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:545.27-548.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:565.27-568.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:590.26-593.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1030.11-1041.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: qfprom@a4000: compatible:0: 'qcom,msm8917-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: qfprom@a4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/qfprom@a4000: failed to match any schema with compatible: ['qcom,msm8917-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/pinctrl@1000000: failed to match any schema with compatible: ['qcom,msm8917-pinctrl']
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: iommu@1e20000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8916-iommu', 'qcom,msm8953-iommu']
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8953-iommu', 'qcom,msm8976-iommu']
   	'qcom,msm-iommu-v2' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/iommu@1e20000: failed to match any schema with compatible: ['qcom,msm8917-iommu', 'qcom,msm-iommu-v1']
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: iommu@1f08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8916-iommu', 'qcom,msm8953-iommu']
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8953-iommu', 'qcom,msm8976-iommu']
   	'qcom,msm-iommu-v2' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/iommu@1f08000: failed to match any schema with compatible: ['qcom,msm8917-iommu', 'qcom,msm-iommu-v1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
