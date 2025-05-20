Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571C1A83FB
	for <oe-kbuild@lists.linux.dev>; Tue, 20 May 2025 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762993; cv=none; b=YUO5Nqg9pXDsuQ+CWrQqD82m/6knK4JA1szgAkCoG9oyIcFjNS62rXxgCENU9xaegyyUKznWpgOmX5ulC7FjBv4SGlPYqWA0c9HnyEVisUvLVPD/4rZ2Mw6CaJy3ILxPu//Us/NVfwFH3MwjhteElELUYFMm2JROl4e2F36+gXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762993; c=relaxed/simple;
	bh=W0lo1NPgtFtVGMuvhLDR9higllOmdAjkEp4gvW3xyWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Del3BZPWwxCwqaS01v7IE+1WsPhj+ASeovu8bixdMUSXp+osZyN8kuu8Oi8V8mLN1PryBNMNhJheH7N2vUrZsAjpGydI/2ZklRgN2/oDtNcLM5IrI3s2PwWXyA4IEcqPbgcVTqQcVM9gDwzf/ab1oYLnoUEA3QxD9GoSJfKipFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NC35KqVy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NC35KqVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747762989; x=1779298989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0lo1NPgtFtVGMuvhLDR9higllOmdAjkEp4gvW3xyWQ=;
  b=NC35KqVy0CR4uAFf6Rwze40YQhzqBr/7eNc22hsUgnr1VKbzUH0/MTFo
   7bynODaM79UvAtrihdJH3q41sJEHg7RBKDadg9UcMkYrjsX1iUqncSe1F
   WS6I3jr2tkn6eyi11/qbpJrCtvjoE1moIugk4jvKqAJqZa2l374cQ724z
   qmFCwNeXr9eGe9qaAo7/2eEH67imM13D4xTMnEluQqQ/DedHn5xSXuYAx
   Y6qS2LyqRB8a//BrQrvbdjS++L/agIQWIaA0iGBNicHfSTfgQ/cgeGsBZ
   Ecr4ybBVVz7Ypdf/GhKSXibkjJ0CqdNNSMAvSvYaJ5MlIee8VmnuEYHEP
   g==;
X-CSE-ConnectionGUID: ml75ukYgSSqCARcPLLHWXA==
X-CSE-MsgGUID: vshZTO2VQ22EHl99EK1WzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60368243"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60368243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 10:43:08 -0700
X-CSE-ConnectionGUID: 9rDXXG3CTyCbRxd+lw+/2Q==
X-CSE-MsgGUID: FZE8/mpuT46JLGoDZap3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="163050510"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2025 10:43:07 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQzZ-00010R-0e;
	Tue, 20 May 2025 17:43:05 +0000
Date: Wed, 21 May 2025 01:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/sm8750-audio-part-3 15/21]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl):
 'assigned-clocks' is a required property
Message-ID: <202505210157.XRvJXEPb-lkp@intel.com>
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
head:   adac035ce9cf16b4bf5bcad64478178ae722e65e
commit: 1fddf08962775cd17147462aaa2a6920f24f31e0 [15/21] arm64: dts: qcom: sm8750-mtp: Enable display
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2054-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210157.XRvJXEPb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210157.XRvJXEPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505210157.XRvJXEPb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 8], [129, 11], [129, 70], [129, 60], [129, 6], [35, 16], [142, 1], [142, 0], [129, 0], [129, 81], [129, 9], [129, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): 'assigned-clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): 'assigned-clock-parents' is a required property
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['novatek,nt37801']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 12], [129, 15], [129, 72], [129, 62], [129, 6], [35, 16], [157, 1], [157, 0], [129, 2], [129, 81], [129, 13], [129, 73]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
