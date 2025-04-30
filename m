Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63616DC28
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025998; cv=none; b=ppqrUW35eNvb97hht4mKA5vjVfqVs6kdT+cv7p9MlXGbhroNqa0Hj5MW48NR/xbaSQXah50EdOh+CsGEnl/xmGqcta7UvvjbhDWImAm1LmFVFHa+C7XXXfzZBLiCmNKp633Z161lpXzZpSiCnf7ZHFTkCLp5c4PTcNuZ6GivAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025998; c=relaxed/simple;
	bh=Jt4w5UHWnJ+w9Cp7/d/w9t+7fyPrgkZ1FLfO8Hx7DRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBadzru6zzapS/WZbRJ3lxIIyGFJGUhAIW+vQGMIiXYZDwQhwkgGaOlKxCvlo2zlDTcSzyzd++KdqDb7deLmYowwEwORJvqL2nNN+2LLXQJ0MByQ6FF49G4BhznF0ayWDyI2sZEr3S2u5IqoJEeGNp3dK2gh2ldrvVsK+8YCwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evd7IsRc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evd7IsRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746025996; x=1777561996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jt4w5UHWnJ+w9Cp7/d/w9t+7fyPrgkZ1FLfO8Hx7DRE=;
  b=evd7IsRcLAb8iU6Zp8vGqMTgFwHxr5oiW2rd+DoGKWtS1+Yi3hULa4jh
   QC2XRMnW7ejTP1dNslFFPjE/PkigG3AnZ6VKvSZADU81g5v0HLiocxXar
   Duhi1U1a1eirAOdU27LYaTEyVekk2GV5GxOV83JZ/VCrWfmNYboF7AYxn
   dR6ztSACK2sF4MfCdMPuLZ282/WFbQmmm2p8SDKB9lJeR2vuwZeP3tyFt
   9G1mNJGYvdIifP53Wvffu9ro+1IZtcJU8ydvRZ4tMpKLUs+tMWg9RnxVm
   CUPYuVk0GN11q+v4VznbRk1ndXWFzRfuaZS20+97wiKYxUCPSqvQp1cLh
   A==;
X-CSE-ConnectionGUID: of/dz/rRSWCrBV9coXOMFQ==
X-CSE-MsgGUID: MrLxtcWjTaCXGYKAdmIhow==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46937286"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="46937286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 08:13:15 -0700
X-CSE-ConnectionGUID: jePu4f+JQNCIsf0gjwXzNQ==
X-CSE-MsgGUID: QfflCH8WToq7axtlKeZQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="171380703"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2025 08:13:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA97X-0003YD-14;
	Wed, 30 Apr 2025 15:13:11 +0000
Date: Wed, 30 Apr 2025 23:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/sm8750-audio-part-3 17/23]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl):
 clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus',
 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is
 too long
Message-ID: <202504302350.N3JjNdef-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/sm8750-audio-part-3
head:   ec641b25cc78eae045852d032319ef3a846f2912
commit: a880ed13c2dd5b41ad39e2110b00f40680007b4b [17/23] arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
:::::: branch date: 22 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-052-20250430 (https://download.01.org/0day-ci/archive/20250430/202504302350.N3JjNdef-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504302350.N3JjNdef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504302350.N3JjNdef-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2709.27-2791.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2813.27-2869.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000: failed to match any schema with compatible: ['qcom,sm8750-mdss']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 8], [129, 11], [129, 70], [129, 60], [129, 6], [35, 16], [141, 1], [141, 0], [129, 0], [129, 81], [129, 9], [129, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long
   	'qcom,sm8750-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm8750-dp' is not one of ['qcom,sm6350-dp', 'qcom,sm8150-dp', 'qcom,sm8250-dp', 'qcom,sm8450-dp', 'qcom,sm8550-dp']
   	'qcom,sm8350-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@af54000: failed to match any schema with compatible: ['qcom,sm8750-dp', 'qcom,sm8650-dp']
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2709.27-2791.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2813.27-2869.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000: failed to match any schema with compatible: ['qcom,sm8750-mdss']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 8], [123, 11], [123, 70], [123, 60], [123, 6], [35, 16], [135, 1], [135, 0], [123, 0], [123, 81], [123, 9], [123, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long
   	'qcom,sm8750-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sm8750-dp' is not one of ['qcom,sm6350-dp', 'qcom,sm8150-dp', 'qcom,sm8250-dp', 'qcom,sm8450-dp', 'qcom,sm8550-dp']
   	'qcom,sm8350-dp' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@af54000: failed to match any schema with compatible: ['qcom,sm8750-dp', 'qcom,sm8650-dp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
