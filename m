Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF92E228D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112321; cv=none; b=kVJcx+igHXvQy3bAA5IpwKptcrt2Ym0DYnvXvQVj6KYzYsa5lY1uUVIS2HB3M0ECECJ+KOF7vte5Ms7loR144CarbTi46nPAAvvBShzSPAtg8RS26uJsEkuaKgHI+pZ+xwFc+YJxoRPddO3vYhXXvdbfDPl8glPXu5oCxuemk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112321; c=relaxed/simple;
	bh=phWUZxcJ35pvwCFWJyiteMYlGH7Y3uC1rbBq6WQzyc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rt3KkZnIL+KddmP6NRuPwYQ/KzMXrt83iYb0oEq3D2vhwHsJ2mdVVtkBN4MRfaCs0D02YXO9jfpjvxoY1pzqC65b2+YCX3fzXH9ijMIu0WhB9LBYMrCwwoLoT1ovvSHq/pRtrQkWucMYKhF9evLD7siskRnnb/U7ARyzelLPmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgETFVSl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgETFVSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775112320; x=1806648320;
  h=date:from:to:cc:subject:message-id;
  bh=phWUZxcJ35pvwCFWJyiteMYlGH7Y3uC1rbBq6WQzyc0=;
  b=IgETFVSlFTNZU0Tlq/tc7kVcjI77af3xs3BPLZjyimKUWmpxcP44ZiZS
   r5uWGekh+i2rB0ztolYGkSOLO4UNPIauIOPnB7gF2DBQVrAe31+/qh6br
   eddwqfWrU2Ibl7FLCrOHvHU5+FFYwLmfZhrnJn4zWhWkTPUZ5sBsf9Xjb
   +pGgSRr5yagfnPuURxAXa8Y/WRSdq0pg2svpvPc0tEqjH1jo9hgnCUzHh
   +RTAjzWZniWRZG7Oo84938WctWERHKmKXqnCSVoOKVR5An0k/RcW86odM
   sCMOaUXhGeHGX/a2R3ZXTJl/oewWr4OJemzT/zxhqUnF33QeTE2MKxXPQ
   g==;
X-CSE-ConnectionGUID: jhitFXENRoaArXEDKyfS2w==
X-CSE-MsgGUID: i7rwzLLXQsmcZTN6jNWY1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63714917"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="63714917"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:45:19 -0700
X-CSE-ConnectionGUID: 4C/0syIuRpqkg+RwwkAT1g==
X-CSE-MsgGUID: JFuU6ovrQNGe9R9DpSLp4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226059034"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2026 23:45:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Bno-0000000090z-0WmE;
	Thu, 02 Apr 2026 06:45:16 +0000
Date: Thu, 02 Apr 2026 08:44:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dts-qcom-eliza-display 4/11]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: pmic-glink (qcom,eliza-pmic-glink):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202604020817.TODWPV4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://github.com/krzk/linux b4/dts-qcom-eliza-display
head:   e55e09cfb0f67fbb930663bdcb09838749bf8948
commit: 8bd053659eae9d5816faa651d3f1dc923a7c385b [4/11] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20260331 (https://download.01.org/0day-ci/archive/20260402/202604020817.TODWPV4c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020817.TODWPV4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020817.TODWPV4c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/thermal-sensor@c22a000: failed to match any schema with compatible: ['qcom,eliza-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: power-management@c300000 (qcom,eliza-aoss-qmp): compatible:0: 'qcom,eliza-aoss-qmp' is not one of ['qcom,glymur-aoss-qmp', 'qcom,kaanapali-aoss-qmp', 'qcom,milos-aoss-qmp', 'qcom,qcs615-aoss-qmp', 'qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm7150-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/power-management@c300000: failed to match any schema with compatible: ['qcom,eliza-aoss-qmp', 'qcom,aoss-qmp']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: pmic-glink (qcom,eliza-pmic-glink): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-pmic-glink', 'qcom,sm8550-pmic-glink', 'qcom,pmic-glink'] is too long
   	'qcom,eliza-pmic-glink' is not one of ['qcom,glymur-pmic-glink', 'qcom,kaanapali-pmic-glink', 'qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink', 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-glink', 'qcom,sm8550-pmic-glink']
   	'qcom,eliza-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
   	'qcom,eliza-pmic-glink' is not one of ['qcom,milos-pmic-glink', 'qcom,sm8650-pmic-glink', 'qcom,sm8750-pmic-glink', 'qcom,x1e80100-pmic-glink']
   	'qcom,pmic-glink' was expected
   	'qcom,qcm6490-pmic-glink' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic-glink.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /pmic-glink: failed to match any schema with compatible: ['qcom,eliza-pmic-glink', 'qcom,sm8550-pmic-glink', 'qcom,pmic-glink']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
