Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE22DB789
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500392; cv=none; b=a5FEsaNBtQ3o57qBLG1TuQcBnPMIbYdI2+ntaYUDeH8BK24dbByEpG8rXYuR6bgOFSDjcTtV55zQ3wLXynLLE1qvtWC1PQ3xgmLicFIwDbjIVZ3sP7K60+MQHYH2k499CAo0YZKdqOZ1niRBHedETYCpJSq8uptDUNq+xF/0Qx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500392; c=relaxed/simple;
	bh=kYTKr9eLjA7Q4J0JLGoamcsrj9rrZ0746lPlCvQKEbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HnxYbPztw0Pl0Te/cmXWX7XSV2Apib3oxapnmZmvQrmZqahuxNcuBWvlBDwgI5RcJwJwiQpdA6HqWGKrrVAJ0m8YIoPFT/DW7xKdxVD6DRrsDFiYytA+aUDjkQlUQ8nf5W43KakHnVyxpvEwzuKm0R2U/I7m0SVfARxS6x+F0Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azybhhQ7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azybhhQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778500391; x=1810036391;
  h=date:from:to:cc:subject:message-id;
  bh=kYTKr9eLjA7Q4J0JLGoamcsrj9rrZ0746lPlCvQKEbo=;
  b=azybhhQ7IJv2MuSwhf/6UdVE4l8ek6MkXvtCbEk2kpzW/K7uZv41aM1c
   aZlkqSOmHVVbxdXlzUWS5ntKXNKXhpJXrN08MrVPGX5wxZ30KqRv/Mug/
   NlMu0gBm/jLQLHrPzABGaE9WU+XRc6ekcO/poVCiOV+GuIbeR96kxKIML
   r0RY1UZ3ei5lbClVebNrMfDV6hFpwh4wPmTu7Av7JaxS729VeO8J8eogY
   cdH7M1xrGCy/tUC6FFFVsJqmZXlo7j4rxQdgZ8Jfaey+zvA0RFE/C1WZS
   ATnlSl5i5UoIzWVznJ8zWl25U6W4UcgUFw6l+RJOQg1+hehhQc5ZVRL+k
   A==;
X-CSE-ConnectionGUID: xQaYU6ypS9Szn+ZSqR1P4w==
X-CSE-MsgGUID: fIw01fWzRF2V0Ut10NUhDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="89687838"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89687838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:53:10 -0700
X-CSE-ConnectionGUID: 99K3CKY8Ti6LBwt1n2A7OA==
X-CSE-MsgGUID: eX/6Vx6tT/OmRP2Bpr2/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233102211"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 04:53:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMPC6-000000007wf-1uPd;
	Mon, 11 May 2026 11:53:06 +0000
Date: Mon, 11 May 2026 13:52:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:clk-for-6.17 1/64]
 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000
 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
Message-ID: <202605111325.HDxlkogP-lkp@intel.com>
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
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.17
head:   45dd59885ca8d283f365774a82b9b785b65c8d37
commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296 [1/64] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
:::::: branch date: 10 months ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260428 (https://download.01.org/0day-ci/archive/20260511/202605111325.HDxlkogP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111325.HDxlkogP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111325.HDxlkogP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3614.27-3688.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3709.27-3764.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5202.27-5277.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5299.27-5355.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
