Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F21459FD
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285185; cv=none; b=p7qeOY6Z/+aV80rM0ixpN4Lfhtqml+hQea1IOtY61mdhCINiwt/f/NIZLyw0NIuxZXo5akTNm8l4TsU5VOU23PSlIyb8rlEqQgV3wxvBOqc0OgGBgE1giMartynQd9H8Yt89Mbzt0g/S1rywKhX3l4NE7Rih+g7YIyjZfoxXCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285185; c=relaxed/simple;
	bh=a69WZNIryy4BVeGdwT/4US3EVu/sbcj8utkyoToJOFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKqbUKlwWzFXLfvt8Sb5ZkCaXoKfkBYgTJEQqFWSQARlrVecz7gkazu4pI3WhdUAsy8ePZhKFOJ8SymjSz30nSjP/0Pklepwr8tpfr4YGtunNd0TRIY2XVFSCs+cc9NfLVlA7Xyrr9DB/FAuaCETWDMMzLNIHxKhDKKBt9kg4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jf/D+ZNO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jf/D+ZNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735285183; x=1766821183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a69WZNIryy4BVeGdwT/4US3EVu/sbcj8utkyoToJOFo=;
  b=jf/D+ZNOUhPss2lkQvmzqpxY6iwO3gzOK3WGdoLLLyYN4xzy0JisEvOJ
   l3Yy5nytcr53dV9L2VIXSIjAHMm3Fn58JNl3Oo60G82kcTzK81KQIo4Yx
   LP9iOE3tzTen1rnZirUt0t+hdamCEi4vdL2ZuRRmcQohIoE9zgEXRRF+v
   hEh+J5WNxe/Vhi7vTgTA3wjtOnAnk/37nKDPwCOSL0UTKbirwH80DxrNj
   a0x2Is9hLaM9nUjfx7ZBsdAc1zp52ti38DTnAWp7XnThyMtwwVHD5R1cd
   3qRUgV6WFOFFYzNhTi3pqTcHEbppRz+d1xl7wAfu69hzHChoyWxHzQcH4
   w==;
X-CSE-ConnectionGUID: vPH+DWdpRUSLTIc76TNUtg==
X-CSE-MsgGUID: 8U1m7vh5ScKAC+q1Bn4m0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35571695"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35571695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 23:39:43 -0800
X-CSE-ConnectionGUID: AWppHcc2TxqPsJ09TSwS3g==
X-CSE-MsgGUID: u16lKx4KShKtmnUg9bnesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131080125"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2024 23:39:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR4wd-00033y-1v;
	Fri, 27 Dec 2024 07:39:39 +0000
Date: Fri, 27 Dec 2024 15:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 58/123]
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: iommu@5040000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412271541.PXNo0NII-lkp@intel.com>
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
TO: Richard Acayan <mailingradian@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: cd89483a1327c0317a655cca1daf9521c7ec7529 [58/123] arm64: dts: qcom: sdm670: add gpu
:::::: branch date: 3 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271541.PXNo0NII-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271541.PXNo0NII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271541.PXNo0NII-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:1750.27-1802.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: iommu@5040000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too long
   	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too short
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qcs615-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'qcom,sdm845-smmu-v2' was expected
   	'marvell,ap806-smmu-500' was expected
   	'qcom,sdm670-smmu-v2' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,sdm670-smmu-v2' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,sdm670-smmu-v2' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,smmu-500' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/iommu@5040000: failed to match any schema with compatible: ['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2']
   arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: pmic@3: led-controller@d300:compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: led-controller@d300: compatible:0: 'qcom,pm660l-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
   arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/spmi@c440000/pmic@3/led-controller@d300: failed to match any schema with compatible: ['qcom,pm660l-flash-led', 'qcom,spmi-flash-led']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
