Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034F17BA5
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995608; cv=none; b=rFMWKfqsaOVwGNO/OYoiONJh7382RtrhBWTUOdKsU2P0Cqv+WnVHBG/Zd7A4B9pgdz5Xx+lUDmf77nEGnqUqh6Et6Gg6EaT3JN22DDO7shJgNF37jIvJhqqF7h3QI2cgKvH3D3rfWMi0KiHEXu+5UW7Ssd/cEFoXhnmQJ1PWEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995608; c=relaxed/simple;
	bh=CBhysBIFAq9685+JzOojy6AW3RXqqqbJhdqgKUMkYa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZF4vr70E+wpl426HEWH3A9cteIBKw1qaehE2NfwojuTEA269MBUuA2SgiVoyRcQCAZ1S9S1j636NRKq/dYZhUQIB5JsZ59Uo+nVTAHQpcNlvdKVesEKYsLCIar4bFTYuuWVIpeo2xNwJNlKsnWSCPWru3G6JYO9hlK3jWieFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjIC7cIL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjIC7cIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743995606; x=1775531606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBhysBIFAq9685+JzOojy6AW3RXqqqbJhdqgKUMkYa8=;
  b=RjIC7cILhczFbgBB/mctqSTPA3kpakFk91LAxiu9C5gPoGs2ySjLmzAG
   GmuThNckikH6ZzXl3uGWwmiR6KUuDbI2L04XOEmmzmN8BzhVgdjlKuZm3
   QpuSkns97is9A+hKAi4Nblq/x9h7fQ0szpRQEXSUD69JJW7ujkdA0SDlW
   XaTylHqd8Jys5zN8Huqeyykr+7DlH/wp9i08yfWc+QBx6NAisfhDPSSQv
   jHaVrRC/IUDr9WdXt1QgTjsRxerB5TJuMjfcXAWCy6LaK23QEiz0zmqqi
   fENTWhCLHBrz1xCIMOKSgk8mwV71ZuWVdbMmw91vdXLQrOB2d3mQxgu/D
   A==;
X-CSE-ConnectionGUID: TjoeQ7G1RzqMAaUHpBAjcQ==
X-CSE-MsgGUID: WPnDcfntT8StAc7tKTthPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="44609563"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="44609563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 20:13:25 -0700
X-CSE-ConnectionGUID: GFP7nEJlRbCmThZyb5RFXg==
X-CSE-MsgGUID: uzb5x5MGSEW10W+0t0IiXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132664669"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2025 20:13:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1cvJ-0002wd-1a;
	Mon, 07 Apr 2025 03:13:21 +0000
Date: Mon, 7 Apr 2025 11:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 28/102]
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: isp@acb3000:
 clock-names:12: 'gcc_camera_ahb' was expected
Message-ID: <202504071100.CcRaHyNr-lkp@intel.com>
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
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suresh Vankadara <quic_svankada@quicinc.com>
CC: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   239252d33658f16e30ebbe940292946ccc610d00
commit: 351a5736d35848f1abe6b253a2a6e0ae8f63a331 [28/102] arm64: dts: qcom: sc7280: Add support for camss
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071100.CcRaHyNr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
dtschema version: 2025.3.dev6+gb64c5c3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071100.CcRaHyNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504071100.CcRaHyNr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[345, 346]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:152.29-155.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
--
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4764.26-4835.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
