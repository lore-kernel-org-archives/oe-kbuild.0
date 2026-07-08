Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC232DFA3A
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509025; cv=none; b=FjYX0r/68pBrWawB11xLVkhbjWaqsZ7G+r7LWxOHzhRX176aBU1O1k4HnyaBa08hs1sEsAS1ejq3PHYvEiCUKSRD6xH9QpPJpcDEsE1NWQCaxa81JmM4MuYusFoBCbl62UO5ieQ4/SryuHOmL4VJ/5u7qytHBSN+DuLGE4suta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509025; c=relaxed/simple;
	bh=2ZImJKo5iZCc7txDay29unGqO1+P8UCTRoyKGlmh1z8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jNB1lLUkgZKkRmVJWTHyQxzG4U3OiobS1Lhx70w0BUVrObVGip2pEjMb2z47VSOyeWA9l2GQiRgUpuehlGzVrjlpaPfXiKyvaQbIAYcGkoZhh8fGMmPjHkEe7qBG8jEtFOVwN3MwbuKOFApdK1A7zf67NeIQoGcYm6Khz1XaHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP6NiyHE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP6NiyHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783509021; x=1815045021;
  h=date:from:to:cc:subject:message-id;
  bh=2ZImJKo5iZCc7txDay29unGqO1+P8UCTRoyKGlmh1z8=;
  b=GP6NiyHEINc4Fx1JafPJUWJT6pRpTjog5NTV0Ebu4OvkEjlMn23/w5GB
   PNyb4i/vSedLR/eutYvWUSr/XWJ0tK/i+e4BChEf7shQrH1v+nHl+NM9W
   9RTrXesw0UrVvLbpzdTLben67CKX/O8t8fnYp9G62Rk/dRswEAgnbfDcj
   T0DyB7IJUmuf9HNulIpXCKuqdBTe8gowP/jSEPQB6Dq3W7y8IzbQ6fTRD
   oNOxcUbxVn7KuRD11CW699y3TWnSVdB4Uf+l64Gv5y4ikk5wxKUll/kt9
   B4MNLgXbwQRu7SigZgV2nrHddKg+ie5Mttt5yqzJHHBelSepg3eSqRhwV
   w==;
X-CSE-ConnectionGUID: 25GrVLWETO+OPu3ppcB7uw==
X-CSE-MsgGUID: HWef0QBbTU2G6nfXOvP2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94813810"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94813810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 04:10:20 -0700
X-CSE-ConnectionGUID: 98YQ6NbHR0KqNS9azh2tcA==
X-CSE-MsgGUID: MOSN773tR1ymWDixxJJKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253771862"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Jul 2026 04:10:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whQAT-000000002kn-0SxC;
	Wed, 08 Jul 2026 11:10:17 +0000
Date: Wed, 08 Jul 2026 13:10:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb:
 mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed
 ('qcom,ice' was unexpected)
Message-ID: <202607081245.3Jw9k5Gw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kuldeep-Singh/arm64-dts-qcom-kodiak-enable-inline-crypto-engine-for-SDHC/20260707-152221
head:   e0f805270d0f56a4bc6ee8e7039256c1a8e86543
commit: e0f805270d0f56a4bc6ee8e7039256c1a8e86543 arm64: dts: qcom: monaco: enable inline crypto engine for SDHC
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260708/202607081245.3Jw9k5Gw-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081245.3Jw9k5Gw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607081245.3Jw9k5Gw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:5892.27-5961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/monaco.dtsi:5892.27-5961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/monaco.dtsi:5892.27-5961.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml
--
   arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: mmc@87c4000 (qcom,qcs8300-sdhci): Unevaluated properties are not allowed ('qcom,ice' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
