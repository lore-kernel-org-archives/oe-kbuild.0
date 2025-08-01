Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ACB18C332
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754017340; cv=none; b=TuD9vsRQaaUAE4n/PCpF3awgO7aQPyiXHhyaR78APWKRC5W7yPOuFZQP5mJMMuKSx/6S5m6ropSjRE0SI+mYdGrPfc1ZrW4PLEiycMFR1R7g+dkX3ZqJsPbrosIjvbL6XCciQjazaEPU9Nct8LqYiFW2lvmQiq60pxbWDDz94d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754017340; c=relaxed/simple;
	bh=gafUJ/QqfSKFVw0MjHF7qak0scCUiGKqXYOgJWtHhcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7I82d303QZgq2Et+NpiwRe2d8u4nMrSIpKT44F6s3DRa+BPkhQf9a6LFnSUtvBTC7nnuC0pNJ5Y/fyouZXf2gWBETAVlZkux6z0KI0wMS+J3sWbqZYZ9A1sxlqGx7KEtq2dTwxanVgsaJ1C04kzF1AOVTbovZj+mxFZXcDRIKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDoK0WIp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDoK0WIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754017337; x=1785553337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gafUJ/QqfSKFVw0MjHF7qak0scCUiGKqXYOgJWtHhcE=;
  b=TDoK0WIpZOXT0TMqMy3JsqYg/rHXjyDiDDQXhtxEuSgfJ9dTz2VEksU2
   YhjeTlWpVg2Z24zE95bZ8mTWjfRRv+0G9Y7TyiSVNPmx7NXVjuwvleptx
   UBGZVWrTkMuWKfc3ARvF0VRf/SQ7ALyNvP29fKvNI3H31rKWNZolc/Rt1
   9dA+nQ/sKqnAVSfoXFcwL9M3Un2VaAferREf6uyfL6yxBvzIjHH5vLxRg
   vrt2ExWj4f0PhmNvGU+spCmPa+J3ddn1muLBV607PL5ycR816TF+qHhwg
   cJjhg5A5nnsQtM3Mr2JgAIc+lRPr9CeJpiGEZ9AmTumaNJQXO0vuWDbYU
   w==;
X-CSE-ConnectionGUID: x8YvCoWrTriSs2emHqmgOQ==
X-CSE-MsgGUID: LNH9BS71TJ27W23USH4EmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60001927"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="60001927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 20:02:17 -0700
X-CSE-ConnectionGUID: el9eCdzfQHONk7HbDxsc1g==
X-CSE-MsgGUID: p1o4pAHAThynGEYf74YobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194411023"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 20:02:15 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhg28-0004Jo-28;
	Fri, 01 Aug 2025 03:02:12 +0000
Date: Fri, 1 Aug 2025 11:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 31/35]
 arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: phy@aec2a00 (qcom,sc7280-edp-phy):
 clock-names: ['aux', 'cfg_ahb'] is too short
Message-ID: <202508011040.UbLKCZ5r-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   2b6d3151b160e8ae3b58d1a9e47746b45f77b31e
commit: 3d8d62d238113b4b72a5e30852cf52633128371e [31/35] dt-bindings: phy: qcom-edp: Add missing clock for X Elite
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-052-20250731 (https://download.01.org/0day-ci/archive/20250801/202508011040.UbLKCZ5r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011040.UbLKCZ5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508011040.UbLKCZ5r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4259.12-4263.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
