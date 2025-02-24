Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254E1DC198
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740432388; cv=none; b=CcmkidHK00dhNbv38U//Uv4EpkoXc7SSRjyers9aFs2Hso9qznrRi1AZ3h/nz5pN2CKmKmS4B6NVpkax4+PSfoWRZsYt2il+aYmdvm4otvHezr6L+AhbSKRjC+O/iYsdmLhAzB4eyh4PfaKZZJqLsvfVQ1dVnyk59p5BhpGKPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740432388; c=relaxed/simple;
	bh=OedWHTmiGO/m8ifbFZ2PJK+G9XqjCPz0xIcHtjXudK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BfrCfYusqEAXtdgYQ2vtFZJpqeR0u18Ji/Lpqu+YIuGBR5e4ThNwOnGDheD7z1JKwNblk4FPFQw66OsYnYWNhFmKnD5yZItGM6W2lWLQI/pZla6M0OFlqkDVxQksEHi2wGAo21SjGgYbKMn31NHD5rcyH5XtLVFMSeXVJyc693M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbN/Uz+h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbN/Uz+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740432387; x=1771968387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OedWHTmiGO/m8ifbFZ2PJK+G9XqjCPz0xIcHtjXudK4=;
  b=AbN/Uz+h/B6jXFkylk002ltT32gmkyeWH/sKFPMLAApJn7syqSafhSQs
   xlFBb+u7+/W9GmObYgMG+PYl07NLigtfK+hsuFJTC3dfjPXkN2Qty04qB
   aVb0Vxr1HFVCRDx6zwjdhn1mgC1Ya2MHp2+lqG+DO4P4GWzhsXzLkX2vg
   0mPDntQsdd8+tGyZ1xJ9dQyGWdK5rNZ7wk/QnZXamJlC33CCOezKwX4sP
   rwnSdDBU38IxYSViYyeCV/4YLRcAvk07Hgl3ASfVIRjJcBi5xzBgdMsEv
   udwSDlmMPFJw+Cdx1RqJkGBP9XUxFlebwDGLs6SdZ61v69e4dA/NJ4Zuj
   w==;
X-CSE-ConnectionGUID: u74x+XT+TNmYrs51WRMXAA==
X-CSE-MsgGUID: vTGURxEsRcOq0Vmcu9vi2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52205366"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="52205366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 13:26:26 -0800
X-CSE-ConnectionGUID: VnUeRE6pREy1h5Q8fesEgw==
X-CSE-MsgGUID: cDRztIa+TuyNKfRi5yRjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="120795917"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 13:26:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmfxm-0009Lr-0Q;
	Mon, 24 Feb 2025 21:26:08 +0000
Date: Tue, 25 Feb 2025 05:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e80100-t14s 1062/1079]
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mmc@8804000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202502250551.BL81pvD6-lkp@intel.com>
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

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: 495547255fb7f0fd4d44e3a21c6a3d7d65f4140f [1062/1079] arm64: dts: qcom: x1e80100-crd: Enable SD card support
:::::: branch date: 6 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20250219 (https://download.01.org/0day-ci/archive/20250225/202502250551.BL81pvD6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250551.BL81pvD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502250551.BL81pvD6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1bfc000: reset-names: ['phy', 'phy_nocsr'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mmc@8804000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,x1e80100-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,x1e80100-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,x1e80100-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: mmc@8804000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,x1e80100-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: sdc2-card-det-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-up', 'function', 'input-enable', 'output-disable', 'pins', 'power-source' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	Unevaluated properties are not allowed ('mode-hog', 'oe-n-pins', 'sel-pins' were unexpected)
   	'pins' is a required property
   	'mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pinctrl@f100000: usb-1-ss1-sbu-state: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
