Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38122609E7
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037572; cv=none; b=R/aQZKP8eAEksn50oTFktmQgrXe14xSXfnf9HK+bLV1b5q6yUjkmWHXYyTbL73iOxk2v6m3zZicboIeYjE8U3AYV/JrZCLp+C02xOraOy+XNBeEf2YQs1UXHuW9z22Qm3FI7PvH6LhFEKJJi2SgqZmCXnH8WQocDNW9VcENJWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037572; c=relaxed/simple;
	bh=KvxB33rS1RPWgT8nvnW9m+rCx1/TbgK4fwfA6+AcEjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ll0kyY1pkRHnHPKco7lZToZNNtQ8CQ3Smq3UGYorh6jHs0rgt5SoDvmB40jyEvu4+Lzb7r39DRgzKIwcTH/vPuI0rEvlwCWCJNhrx129c18JxM5JA9HEfrzf+QN0QLk1vGVXbSFoonBx+m8CNe9QIIhDy9JGvwCJafNPG1PXtZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bC4GSbp8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bC4GSbp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746037570; x=1777573570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KvxB33rS1RPWgT8nvnW9m+rCx1/TbgK4fwfA6+AcEjI=;
  b=bC4GSbp8uCdaqHN7CCPvPsmKiaOih3UYoRE+cZA1EJccONNGNlyTwsQs
   h/Gr5WYYGBD5OcQRuZHe1s0NJ9FZhUdJ7ymPACpaOts6W7dTrIn53injC
   edA4BGXZVbhQbp+zpXYGoPc4Kh03mh2ApcLKKZBnkt+QN/ZALqEY4VB4Y
   Q4pxdw5t1X35eqaZ6GBuAHhwoQzVrdfv6O6cDPjikjQasdtpjFOTSSQ7O
   gL2gklQWg9ZXvfhtKYSKBlnVC+fxi5R3+nbPVSE0kQSb1h9dx2IE00lAE
   WniAJ3daJbE6U4sss60loySreefuztga77jMWskAv5jKMuZBmdMrLl0Z/
   g==;
X-CSE-ConnectionGUID: 6pDic0hhTGiAruLDNw/tgA==
X-CSE-MsgGUID: 0g0TGAC7TPSFVBSQcLxJiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47590872"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47590872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 11:26:03 -0700
X-CSE-ConnectionGUID: vVxQ6G1XRJqhMLwLItDOHg==
X-CSE-MsgGUID: e+WFxvtiRK+jLL+LLWjMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="165117328"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2025 11:26:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAC86-0003gL-27;
	Wed, 30 Apr 2025 18:25:58 +0000
Date: Thu, 1 May 2025 02:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts 18/22]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl):
 'assigned-clocks' is a required property
Message-ID: <202505010239.kWuqJM87-lkp@intel.com>
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

tree:   https://github.com/krzk/linux b4/sm8750-display-dts
head:   fb710250b6b50c639e91385eb8feb8d8b549b3cf
commit: 80d2a17790a4115bcc54817be873280fe601f2ef [18/22] arm64: dts: qcom: sm8750-mtp: Enable display
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: arm64-randconfig-052-20250430 (https://download.01.org/0day-ci/archive/20250501/202505010239.kWuqJM87-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010239.kWuqJM87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010239.kWuqJM87-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sm8750-dpu']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 8], [129, 11], [129, 70], [129, 60], [129, 6], [35, 16], [141, 1], [141, 0], [129, 0], [129, 81], [129, 9], [129, 71]] is too long
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
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
