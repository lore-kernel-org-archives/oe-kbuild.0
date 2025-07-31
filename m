Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED79521CFF6
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754001585; cv=none; b=c6vVTRYC+nMXVqHEFKkHGoFHZwbapHz0D6lx+R7WyP/XYfBjGYtt7X8Tzriqu53oj+/4+oqGhHTUHq0BeptMH2azrVewCjxVS4Wc5FmVxBw1aJeaWPX2ZD9ziucGxUSp/XfVqud+ViU8luw3HGW5HT8C4PFNMDaFeYSAyjvUxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754001585; c=relaxed/simple;
	bh=ur30K+70T/9/buSFpwgfMtmaXcNg7nt0052vFiomqbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJNZoWujzn32kRprd0Yd3HmYmBLq3z8Db0WlbbiURYklDCU1qHLLIEt1bMuzuRAkg8QV9ibqLAfx+nEDrormWm5PTu+JH2MF1yHVfeWPpkvwPGQ3GdreuMtkPfbN7CJ1WaltUWpFFTjf01eR8AOiX4ZNiP6Gbgo3QC5K8wWzMaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sz1DflJR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sz1DflJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754001582; x=1785537582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ur30K+70T/9/buSFpwgfMtmaXcNg7nt0052vFiomqbw=;
  b=Sz1DflJRfcrmsUEBPPmu0ouAFOJGe131SIgoBhz2Ox+G1Yl6vNhEOksP
   flxBjdgwinda0iYqqn+Wc76a7IzMJoGnobhn407AWP5A/rhix73gJFSlW
   4k7gsxhsHgOY+WoxTHvh/hgxQcJkcwWV5aC4EH/0X0AWTbO4IszV/yjbC
   Y+YcCJM/h6SUSWjkPH89OGbAgM7GQyGqF3XzE2UJw9fXfSW7tbXyZRr8E
   kE5XgYOGcSm5i5A/vMXtN/0tBf6nQ5qOor/YELMkgFaaJdEDPjDrQifXg
   wyHOsWuAE/RxobsDxEUgpZNWAiSvODuihPZPO9DR1Bm73CQHZaUm7Gs74
   Q==;
X-CSE-ConnectionGUID: 6uBttiFIQOyxSYUbWjSQVw==
X-CSE-MsgGUID: SJ43V9rnRU+MNlq6H9VRrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59988064"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="59988064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 15:39:41 -0700
X-CSE-ConnectionGUID: RWpEqd2ASamyLpMJutaNPw==
X-CSE-MsgGUID: Qi/vqCoBS1el1CZfe2+Vfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163096470"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 15:39:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhbw1-0004AG-1v;
	Thu, 31 Jul 2025 22:39:37 +0000
Date: Fri, 1 Aug 2025 06:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 31/35]
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: phy@aec2a00
 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
Message-ID: <202508010613.RkHxevLb-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-051-20250731 (https://download.01.org/0day-ci/archive/20250801/202508010613.RkHxevLb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010613.RkHxevLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508010613.RkHxevLb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4809.26-4882.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4259.12-4263.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@aec5a00 (qcom,sc8280xp-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@8909a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@890ca00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@aec2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@aec5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@220c2a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@220c5a00 (qcom,sc8280xp-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
