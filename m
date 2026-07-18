Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE801A2C25
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344712; cv=none; b=Bv7Mnhpe5YWVREBF2+K6TobD5viNdnyw3Y0uzyM7a3AOAdbO6DlFmVAu1AWwUaCTkqyO8mKwWJ2Gur/JaXq7q6PLVhVqx4AXoT1zyeDvlAiBq7NNo1eANk1826CUXlpSv5BiHkttHpPy007yHgBFiD2VNFG0Hly1ZclfFlxDJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344712; c=relaxed/simple;
	bh=m1UG678DwlEX1WVYugJkXZyHpgCrIDrDXIDS4uHp/A4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fXPrxXTY2W6LUKzoUQ2jyy2aB8in213f6x1u4Pm3hyPwxu2q34etxCGHmuibzZuL1516hbE6yULgaQVsEqz9pnzoyIzVU5GQI7dbhgl/irqAVvSMziT4twvg4EdUC1qske/2UoJtDYPoiPT7pniPJppomcmF3k1owLXfFKDc4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mos8YRAx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mos8YRAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784344710; x=1815880710;
  h=date:from:to:cc:subject:message-id;
  bh=m1UG678DwlEX1WVYugJkXZyHpgCrIDrDXIDS4uHp/A4=;
  b=Mos8YRAxotIFHsHNjTbVcSDtQUpdb6wAimq844msTXpXVNPn/SeOVhmz
   DPZE21ecX9Q7F5o28hNIwZUZTOqT34itUSjtoZkneNUzbicCzKPksjMNZ
   91uQ0k2XnCAXH9hndNWnonQESnody1e7a52NeFHMj4mGPDJF85M95hCb7
   nSHklaDOQNRSiaOL9YYj9K9kFIJoEAomqVMCrLAbQ7W2ZGFHy0AqH3vYv
   +vK0seCXwdva+4yLwlszQTg8wxBSgJsWKHi5avH7UF89EGNqWV/1XJ5KR
   aJQAxwu8n0OEUsjksc2Zv+kHCMcKVeihwy5qhIBU5kAmFTmXT/U+5KB9g
   w==;
X-CSE-ConnectionGUID: 49hjfHMmTryqlUFhxB0vmQ==
X-CSE-MsgGUID: wi8Qm/6JQAezUOsOsYD/zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85051135"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85051135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:18:29 -0700
X-CSE-ConnectionGUID: 9844/xRPS+iO5SQkmAQ5XA==
X-CSE-MsgGUID: C/CeV/QLSoqFJWiyvGeYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261213007"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 20:18:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvZK-000000005iD-17X0;
	Sat, 18 Jul 2026 03:18:26 +0000
Date: Sat, 18 Jul 2026 05:17:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: service@1
 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202607180553.BurviRIc-lkp@intel.com>
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
TO: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Meduri/arm64-dts-qcom-lemans-enable-audio-ML-offload-memory-and-SMMU-mappings/20260717-052616
head:   a1167625b0738c4d16887615cfafa4dc48620a6c
commit: a1167625b0738c4d16887615cfafa4dc48620a6c arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2054-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180553.BurviRIc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180553.BurviRIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180553.BurviRIc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:5868.27-5937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
   arch/arm64/boot/dts/qcom/monaco.dtsi:5868.27-5937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
   arch/arm64/boot/dts/qcom/monaco.dtsi:5868.27-5937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
   arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: remoteproc@3000000 (qcom,qcs8300-adsp-pas): iommus: [[54, 8192, 0], [54, 8288, 9], [54, 8290, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: remoteproc@3000000 (qcom,qcs8300-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs8300-ride-el2.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: remoteproc@3000000 (qcom,qcs8300-adsp-pas): iommus: [[54, 8192, 0], [54, 8288, 9], [54, 8290, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: remoteproc@3000000 (qcom,qcs8300-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-el2.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
