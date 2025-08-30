Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F56F53E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756594087; cv=none; b=Q/Ohl68vPt5j8Fq2AcBDtozLqdlu5zcZTGVD/yE03swkSpz+8IXMzrHmQTv0ctbVKAEPNeUmlL1wXTMyM1VyFDJMxOQp7CRwDZOOyBcJefTL68RVrifPbaJADtgN/oAhJGPHbNxhQpMMk4lL0Qqb8WK2r1mv3QROCGI+5SKnM8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756594087; c=relaxed/simple;
	bh=4YD6GQS4N7rspbgDxOYnvm2EptLpire8i7QtXcMYdvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hw+CJMk4uBk1OwBqPTsA/ag3lJWhhQti55zJ9lKInJjTdE1fR4cz8irzDI18ScDTNweTI3EwfRbLW0wcF/xDSoyJjm3PcHhPJMV5JNW+zSi5Ay2IA+4Go79K3fb1BknzcNJ3iLKrgtXIjECrGbW9U0Rnq8AbrC30X17EpOPupps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loZzFoML; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loZzFoML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756594083; x=1788130083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YD6GQS4N7rspbgDxOYnvm2EptLpire8i7QtXcMYdvo=;
  b=loZzFoMLysO5iGbTQEI3zjOaRZbD4xaLTpe3cqvZnkE9KFXxsUGh3dyH
   QS7ITVBWZz3wem6y1+Na7mSz/4ccUpu9AEcUj5G6dpYuqufSDZdMz9+18
   NXIQuYumTwNHs4nEN1O05MlhwjgGIh562U+4Tt0KQsjvegIcDPh/kL9Y2
   7j8pnYu+YqWAl/S8D56ydM78d7cTZK6KDiCZRBA0ssgbN9HhoGO7Eatkl
   RGDr88yTO93GHRvZrp16XoAdXHKGzE6srnq4+nTZfO+JRWskLwY0B0I9i
   sNtBqeDXAsqvWOi0I3SAgqnH941v9X1DEiBUtwpucHvdtjTdv9ncmLvyR
   Q==;
X-CSE-ConnectionGUID: Gsk0+zjSR7SX0/nKf3f04w==
X-CSE-MsgGUID: O91G4YiGQ2uFFhYfFmk+/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84247506"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="84247506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 15:48:03 -0700
X-CSE-ConnectionGUID: YYZ82YibSe64YlIoiNe4ng==
X-CSE-MsgGUID: uIwhVmiWTxSWZRjl8CtWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171448145"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2025 15:48:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usULE-000Vjh-0Z;
	Sat, 30 Aug 2025 22:47:16 +0000
Date: Sun, 31 Aug 2025 06:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:thinkpad-t14s-x1e 5/19]
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb:
 displayport-controller@ae90000 (qcom,sar2130p-dp): clocks: [[120, 2], [120,
 12], [120, 15], [120, 18], [120, 19]] is too short
Message-ID: <202508310656.Jb58OmG5-lkp@intel.com>
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
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Sebastian Reichel <sre@kernel.org>
CC: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 3a5ef59556abfb9ed77b83dfdd2b33e885d9f24d [5/19] dt-bindings: display/msm: add stream pixel clock bindings for MST
:::::: branch date: 19 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310656.Jb58OmG5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310656.Jb58OmG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310656.Jb58OmG5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2214.27-2289.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sar2130p.dtsi:2310.27-2366.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): clocks: [[120, 2], [120, 12], [120, 15], [120, 18], [120, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[192, 2], [192, 12], [192, 15], [192, 18], [192, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 11], [249, 15], [249, 18], [249, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 28], [249, 32], [249, 35], [249, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[57, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 11], [249, 15], [249, 18], [249, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 28], [249, 32], [249, 35], [249, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[57, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[227, 0], [227, 12], [227, 18], [227, 21], [227, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[197, 0], [197, 12], [197, 18], [197, 21], [197, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 11], [249, 15], [249, 18], [249, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 28], [249, 32], [249, 35], [249, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[57, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 11], [249, 15], [249, 18], [249, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[249, 1], [249, 28], [249, 32], [249, 35], [249, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c00000 (qcom,pcie-sa8775p): resets: [[57, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pcie@1c10000 (qcom,pcie-sa8775p): reset-names: ['pci'] is too short
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2634.31-2679.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clocks: [[107, 0], [107, 12], [107, 18], [107, 21], [107, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clocks: [[107, 0], [107, 10], [107, 14], [107, 17], [107, 24]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2634.31-2679.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae90000 (qcom,sc8180x-dp): clocks: [[109, 0], [109, 12], [109, 18], [109, 21], [109, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: displayport-controller@ae98000 (qcom,sc8180x-dp): clocks: [[109, 0], [109, 10], [109, 14], [109, 17], [109, 24]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@aec2a00 (qcom,sc8180x-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[216, 0], [216, 28], [216, 32], [216, 34], [216, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb: iommu@5040000 (qcom,sdm845-smmu-v2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too short
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too long
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'marvell,ap806-smmu-500' was expected
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[216, 0], [216, 28], [216, 32], [216, 34], [216, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb: iommu@5040000 (qcom,sdm845-smmu-v2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too short
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too long
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'marvell,ap806-smmu-500' was expected
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[216, 0], [216, 28], [216, 32], [216, 34], [216, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb: iommu@5040000 (qcom,sdm845-smmu-v2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too short
   	['qcom,sdm845-smmu-v2', 'qcom,smmu-v2'] is too long
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm845-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'marvell,ap806-smmu-500' was expected
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[219, 0], [219, 28], [219, 32], [219, 34], [219, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[203, 0], [203, 28], [203, 32], [203, 34], [203, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[201, 0], [201, 28], [201, 32], [201, 34], [201, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-mtp.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[204, 0], [204, 28], [204, 32], [204, 34], [204, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[207, 0], [207, 28], [207, 32], [207, 34], [207, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[206, 0], [206, 28], [206, 32], [206, 34], [206, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:587.10-628.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[219, 0], [219, 28], [219, 32], [219, 34], [219, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[199, 0], [199, 28], [199, 32], [199, 34], [199, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1562.21-1582.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@894000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[195, 0], [195, 28], [195, 32], [195, 34], [195, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: touchscreen@2c (syna,rmi4-i2c): Unevaluated properties are not allowed ('incell-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/syna,rmi4.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[199, 0], [199, 28], [199, 32], [199, 34], [199, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[214, 0], [214, 28], [214, 32], [214, 34], [214, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[214, 0], [214, 28], [214, 32], [214, 34], [214, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts:470.25-491.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[208, 0], [208, 28], [208, 32], [208, 34], [208, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['jdi,fhd-nt35596s']
--
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:473.10-494.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[206, 0], [206, 28], [206, 32], [206, 34], [206, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[222, 0], [222, 28], [222, 32], [222, 34], [222, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[208, 0], [208, 28], [208, 32], [208, 34], [208, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[193, 0], [193, 12], [193, 18], [193, 21], [193, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[185, 0], [185, 12], [185, 18], [185, 21], [185, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3960.27-4032.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4053.27-4106.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: displayport-controller@ae90000 (qcom,sm8150-dp): clocks: [[184, 0], [184, 12], [184, 18], [184, 21], [184, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[195, 0], [195, 12], [195, 18], [195, 21], [195, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[2, 0], [2, 12], [2, 18], [2, 21], [2, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:740.9-751.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:740.9-751.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[208, 0], [208, 12], [208, 18], [208, 21], [208, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4848.27-4921.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4942.27-4996.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[199, 0], [199, 12], [199, 18], [199, 21], [199, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[142, 0], [142, 12], [142, 18], [142, 21], [142, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[125, 0], [125, 12], [125, 18], [125, 21], [125, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[125, 0], [125, 12], [125, 18], [125, 21], [125, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[129, 0], [129, 12], [129, 18], [129, 21], [129, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2946.27-3024.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: displayport-controller@ae90000 (qcom,sm8350-dp): clocks: [[131, 0], [131, 12], [131, 18], [131, 21], [131, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[222, 1], [222, 11], [222, 14], [222, 17], [222, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[197, 1], [197, 11], [197, 14], [197, 17], [197, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[203, 1], [203, 11], [203, 14], [203, 17], [203, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[203, 1], [203, 11], [203, 14], [203, 17], [203, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[214, 2], [214, 12], [214, 15], [214, 18], [214, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[198, 2], [198, 12], [198, 15], [198, 18], [198, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[205, 2], [205, 12], [205, 15], [205, 18], [205, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[185, 2], [185, 12], [185, 15], [185, 18], [185, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: displayport-controller@ae90000 (qcom,sm8550-dp): clocks: [[189, 2], [189, 12], [189, 15], [189, 18], [189, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[243, 2], [243, 12], [243, 15], [243, 18], [243, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[226, 2], [226, 12], [226, 15], [226, 18], [226, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[235, 2], [235, 12], [235, 15], [235, 18], [235, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: displayport-controller@ae90000 (qcom,sm8250-dp): clocks: [[227, 0], [227, 12], [227, 18], [227, 21], [227, 26]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: displayport-controller@ae90000 (qcom,sdm845-dp): clocks: [[219, 0], [219, 28], [219, 32], [219, 34], [219, 37]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: displayport-controller@af54000 (qcom,sm8650-dp): clocks: [[243, 2], [243, 12], [243, 15], [243, 18], [243, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
