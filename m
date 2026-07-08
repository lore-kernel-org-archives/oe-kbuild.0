Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39E386C15
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501752; cv=none; b=hGRvmVduRWd+kxJEpC5gGggOFrSIFc4uZ1nVqQewl0ad2bB+B2uoPTjRIBlpXgBxZ7j2/ORHaR4BV8IG456aKTD1VRRcwK8pKcp4bVl0iSmscM9UWF7EFWxzBGizyaGX2mivx+RQxT03weoVR+hJhBjuDEM2MorgAZ3SF9IlPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501752; c=relaxed/simple;
	bh=rftT8ueenr8EEK1Me74ob6rVCBsByK5NBZ2R+qcba8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOZr0NQvQtkZLf8aj5dD5KCFolnUpeWOc71KyEfnnWFSSLRjmJZy6btM8X17HfHkQBGeAE3Hj7vwSGILLAZJb1UEdFmAoRJt9F49ByHcFJpB5H9LCJUN1T8/LfG2I3tmrc67/JfX9819Gy6hxUxj0+JR0tNcgiJ6SAF/HD0FJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep/C2iPB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep/C2iPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783501751; x=1815037751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rftT8ueenr8EEK1Me74ob6rVCBsByK5NBZ2R+qcba8s=;
  b=Ep/C2iPBDaiUlI4W3NLeD23Kheeq6GuWhm8kw1tdOAsIG7L5eOHAszIm
   62oCId5Q4p8BLSzpsqjV453YjiGmkVQDg3h/RFy0udXzlwm7f+oO5+nrg
   0yGtuOsFdX0Icg4jxo9fzxgJnm59vV+d6ZJDv/QacuPJEbIz82UNiVOfw
   T9EQ/1K8s3LEbpXle/vXhoPFAsxrem2OoQlsMwfYYU9jU382uP/E7IxnV
   PmPSH031u7gCvJT3fSYlfIO3Kyg/cKGCyR9WXolVwXrC0bAww2SRj2fBA
   8FRjobgEW452e22ojB8Q45aUNXQX4J7bZ8sdGqdSGeuxBLRsDiUC+vr7K
   A==;
X-CSE-ConnectionGUID: jQu3kaUNRL6gmunPEVBSfA==
X-CSE-MsgGUID: m8+PzbbNTnKPqNw0UcPP+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="106955008"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106955008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:09:11 -0700
X-CSE-ConnectionGUID: yQc2cgiKRsm0LRY9+eiXuA==
X-CSE-MsgGUID: q5CXLFxxSt+2dYQQZ9ZB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284346204"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Jul 2026 02:09:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whOHD-000000002jF-0TOn;
	Wed, 08 Jul 2026 09:09:07 +0000
Date: Wed, 8 Jul 2026 11:08:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: monaco: enable inline crypto
 engine for SDHC
Message-ID: <202607081057.76DXsZTP-lkp@intel.com>
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
In-Reply-To: <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-2-701c86f3c25b@oss.qualcomm.com>
TO: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Hi Neeraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e9685d3c41c35dd1b37df70d854137abcb2fbac]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuldeep-Singh/arm64-dts-qcom-kodiak-enable-inline-crypto-engine-for-SDHC/20260707-152221
base:   8e9685d3c41c35dd1b37df70d854137abcb2fbac
patch link:    https://lore.kernel.org/r/20260707-ice_emmc_support-v9-2-701c86f3c25b%40oss.qualcomm.com
patch subject: [PATCH v9 2/2] arm64: dts: qcom: monaco: enable inline crypto engine for SDHC
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260708/202607081057.76DXsZTP-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081057.76DXsZTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607081057.76DXsZTP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5498.26-5573.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: mmc@7c4000 (qcom,sc7280-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
