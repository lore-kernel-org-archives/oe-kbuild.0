Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A51E1A25
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975350; cv=none; b=JaI5CXQjReDZ7qhEgbimA3JYcg+stIrnf25BXIgqYQEIX3pCW32vylsgamf/uHuMGFjUFWdK96lKj+tY0tAyCCb5kfOEXwJ6CKzUn9fakBPWawdhcPUIy4oC9MCBb/Pg+QeVqXzWrORwjTCindKTl+BjUDz5msrs/z/HMTbXWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975350; c=relaxed/simple;
	bh=A+C2ov9tDAAMyJBoSDimpOREEE7cjYioSFbPHiAyS94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXJ9RgLeHDCPcTS8PyinzYCpvh8YZLspIHCchWOzfIeh8ZPTgQ3QujkEkkqErg6zCcOb7pkHhFrXcERIWHJP1+bWZhIeiRnkCOtbouKzSqmiNXh0sAo7sVDUPd3xL9NorK15dspe+HfL6A6LqatmhMVeGqteirPiFmLENs/P0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsHET+9s; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsHET+9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730975347; x=1762511347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+C2ov9tDAAMyJBoSDimpOREEE7cjYioSFbPHiAyS94=;
  b=KsHET+9skZU+VF67YJCoHqPK3SzXbGRXeU5pMfGdccBZrJuTTemjBXc8
   IlBQacI0D6trh4neZGSJaxhLeSgAb+fOt67FtEnzBGddPOqUF464E5ft+
   SZfl2MLrwEVFMnGY00en9dQ0J8YOxN15jCG12wJKNEPuBQqu7er/B5Ccx
   hQ6v2wK+yrC0fHllK3eJ6gJklbrrdoRljmDZHo9OQj9vCkH1vnvv1YcuO
   E8ALNFFAFzj7fYAKnFtAn8fHMhqnEEh9yZJAAXynJ2SuaGUoSIpbtqJC/
   Dm/D0EX+MCbexmq6R9fi+3c5W9V0MwEoIzSd20Cq+g6AadLbkDtqysWlV
   A==;
X-CSE-ConnectionGUID: nc6XO9OqSFebbsCrxpnLOA==
X-CSE-MsgGUID: x/PUPZveQ0CHT2LU0fTA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30769898"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30769898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:29:07 -0800
X-CSE-ConnectionGUID: FyvVwzXwS5WGApnfUrAhxQ==
X-CSE-MsgGUID: QMQ7KDdwRHaCK2j6CGh2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="89664284"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 02:29:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8zl9-000q63-2b;
	Thu, 07 Nov 2024 10:29:03 +0000
Date: Thu, 7 Nov 2024 18:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb:
 system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
Message-ID: <202411071834.UJOmgPdh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 74cf6675c35ec3034053a69926f4d98e52852eb0 [81/81] arm64: dts: qcom: sc8180x: Fix LLCC reg property
:::::: branch date: 8 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241107/202411071834.UJOmgPdh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071834.UJOmgPdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071834.UJOmgPdh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: clock-names: ['aux', 'ref_clk_src', 'ref', 'com_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: '#clock-cells', 'ports' do not match any of the regexes: '^dp-phy@[0-9a-f]+$', '^usb3-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: dsi@ae94000: interrupts: [[4], [4]] is too long
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: clock-names: ['aux', 'ref_clk_src', 'ref', 'com_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: '#clock-cells', 'ports' do not match any of the regexes: '^dp-phy@[0-9a-f]+$', '^usb3-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: dsi@ae94000: interrupts: [[4], [4]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
