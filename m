Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF834150981
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737658082; cv=none; b=kNGnZrEnRRdDFT0OsCDmrZjzxykIHsxDl1FU0Px8G9A7b7e1MUZSIXDND8AiSk1bfnoNdpmTo2wenE04o5t5zKqnJwyRiQUsZt+AdW77iZ+nvaXT70H0RlOjXN8P83DS7YI8k2w9SrUHTeve4JDIOkx2aLK7NoKHesQm6Ug2GCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737658082; c=relaxed/simple;
	bh=EK3KU+wluk7fJ4xNeWxAvkw2lW0NQgsxn5Nh/l/6EUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1Urpr7i4TVBth4lSgk5UolPd242C1u3BiSDpltgnwH2DcnsVm5A+a2f4W3VGzr105np0CZE0bMnQ9lYheeQT8cbcdG0UL2o68QK8RR+2EK5Lv3QxA4i7+o+5MkLQ0h9XRD+oespoUMQB8nagdA+xgOkmbx5LkU0sRvlCPlnXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aC5FWEM0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aC5FWEM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737658081; x=1769194081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EK3KU+wluk7fJ4xNeWxAvkw2lW0NQgsxn5Nh/l/6EUs=;
  b=aC5FWEM0KEoFJXVJUzRVi/gEZ/WPpLejXCVkWcqPS8TafNCsZk/SY2HF
   nELV5KHcDvP32bLBDokvbWi5T6voggT62he2SssX6xKocyDWLpeefhVxt
   YrtucmF7KwxiH51H6j88aRMJHuMsKCUhXWsx2OY0+zgNBWGM6CmrPnEgd
   XjGjObvgc6xT2CClnnJU67fpD8VqSLNjGAMcFSskQVcSIw4kIMpq8TKbJ
   mDEFTfcNyAUjcCySX02BVNGAqNMLW2H10AsSlHMlYyIl2/AoSnSmcMP/a
   0Mhqrds2HQXYdneyxaixxXnZdreDoyvvlT/x9OiLpQnyNbAxUG4fZ4ZbZ
   w==;
X-CSE-ConnectionGUID: VUJEjesUSnupYqC1bYS31w==
X-CSE-MsgGUID: 62K6nvKdRDiPqFfpMaEE/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63529557"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="63529557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 10:48:00 -0800
X-CSE-ConnectionGUID: JlceYDIbSCSAx+thl6s8LQ==
X-CSE-MsgGUID: PmuhnAgaT1+NB95Os3ktzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112181093"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 10:47:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb2FB-000bX9-07;
	Thu, 23 Jan 2025 18:47:57 +0000
Date: Fri, 24 Jan 2025 02:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 70/74]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000: clock-names: ['byte',
 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
Message-ID: <202501240237.QfdfZXQ8-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   4e443a546ffb5a1c936e44e053893ae12804fc13
commit: fbe30c4d7cec45b160138336252258be523894e7 [70/74] WIP: dts: dispcc
:::::: branch date: 4 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240237.QfdfZXQ8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240237.QfdfZXQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501240237.QfdfZXQ8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: display-subsystem@ae00000: interconnects: [[135, 4, 7, 21, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000: clocks: [[134, 12], [134, 15], [134, 72], [134, 62], [134, 6], [34, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000: clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/remoteproc@32300000: failed to match any schema with compatible: ['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas']
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2821.27-2904.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2926.27-2982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: display-subsystem@ae00000: interconnects: [[133, 4, 7, 21, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8750-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000: clocks: [[132, 12], [132, 15], [132, 72], [132, 62], [132, 6], [34, 16]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000: clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-cdsp-pas', 'qcom,sm8650-cdsp-pas'] is too long
   	'qcom,sm8750-cdsp-pas' is not one of ['qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,sm8750-adsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8550-pas.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: remoteproc@32300000: Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
