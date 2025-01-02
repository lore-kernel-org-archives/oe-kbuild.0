Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C7142E67
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jan 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845251; cv=none; b=fUlfHKPo7kM650QRZz/7BhfPucS7cwHSjOzshf/vFOaKHSST+kyjLXXNfmg1wzQ5F2gZZXUnO5x+BNxC33OuOCT67JhR5jWediczd3Xxxy2qaVKIy6fKbgiU87k0T7y+Lt7Vf9HSPEY+oVYsOyegBS4YAX2+nqGBAltD2rbeW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845251; c=relaxed/simple;
	bh=kV2ViNm5mdO+oafavTk1CZXSYz9y2rBnW6HaV4pyYr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXl+FMfDYnNV75Z4/eeEmy7byXNG9AAd3be6dTpJAejMh4zY47dTBc28zfZ232BTXLjM8Kl+0HZVQQ2jl7WcKlUvmNDgCIC6UcmhMPwddoy2iTDIaxxcSXSPiW1eXHlMPQ+hjBvIfcumVH3qEs+5q7gZrc2b4M/U22shWDChdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9BU+mWK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9BU+mWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735845250; x=1767381250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kV2ViNm5mdO+oafavTk1CZXSYz9y2rBnW6HaV4pyYr4=;
  b=h9BU+mWKDRwamS4zb1zO7hPeZHVT2EH6qwYjXcRoGel9gUdBljva+k/Q
   4gVfEox4b8u+lTgQmQjjMSPtZPkbxv/yKUsm6qa+7WYBVDY8PPf2yM7PT
   lhS3QjfoSABxmOnlUUMbEZXZEShdz9i1FmaxwyHa/ewjWowURtL9S0Gkg
   6y7ZZz40OEuHoQqJTVNLLmcBL75UOGTqUhi3Y5XRbxqaL78qQjblsJuQ8
   6H/hT5zSuxZ8LFjsKdMv7jM/E+VIxacLoSpNZaqnDHZhWpZ3NMgZo3XW8
   lhIQGC9HfiQNuvoLsxuvKzeEPGB5YyovPcdOh9fnMrLfRMUJp+JuwK5s1
   Q==;
X-CSE-ConnectionGUID: Rpkk8LOGSXmp+ayNxns6Ww==
X-CSE-MsgGUID: 7bvpDdWZTM+2jz02K9b2VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="38920356"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="38920356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 11:14:09 -0800
X-CSE-ConnectionGUID: TNHIFgwSRQelmMB+/LfpJg==
X-CSE-MsgGUID: 1jHFmgLBS5SwTwWvt7HArw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101425467"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2025 11:14:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTQdx-0008mp-2B;
	Thu, 02 Jan 2025 19:14:05 +0000
Date: Fri, 3 Jan 2025 03:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
Message-ID: <202501030226.wM4BqwSQ-lkp@intel.com>
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
In-Reply-To: <20241231-gpu-acd-v3-5-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-5-3ba73660e9ca@quicinc.com>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Rob Clark <robdclark@gmail.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Viresh Kumar <vireshk@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dbfac60febfa806abb2d384cb6441e77335d2799]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-adreno-Add-support-for-ACD/20241231-051408
base:   dbfac60febfa806abb2d384cb6441e77335d2799
patch link:    https://lore.kernel.org/r/20241231-gpu-acd-v3-5-3ba73660e9ca%40quicinc.com
patch subject: [PATCH v3 5/6] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20241231 (https://download.01.org/0day-ci/archive/20250103/202501030226.wM4BqwSQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030226.wM4BqwSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501030226.wM4BqwSQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4164.11-4174.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: opp-table: compatible:0: 'operating-points-v2' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: opp-table: compatible: ['operating-points-v2-adreno', 'operating-points-v2'] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: opp-table: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/gpu@3d00000/opp-table: failed to match any schema with compatible: ['operating-points-v2-adreno', 'operating-points-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
