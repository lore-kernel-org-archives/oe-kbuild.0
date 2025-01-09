Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B5204C2A
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736466311; cv=none; b=RNjceCafFIMA2pNQuDXaH1skhxhvwh21wd7AVwZ5Pfv90DoIL0kUzxgSdAa6VwNth5jxAykBeB19sxG9l5S0U0dKuq8c9ET99lHYU/jjVE6SiBeA9dB1O7p8TtM55Ggk48kV3hT7v7o4WEpL3zqb9ytT7G9O4RP9wToOk9nw56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736466311; c=relaxed/simple;
	bh=NCVIpLPu4EuM0QPnsiwId0MeO8S7IojXbnwsE6Fa9GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tl3xCrh77Y+lAbEkKYQ00GO/Aev8WuAPUEePOs/ZiRBhyhW5f7gWQ6hdTegWffsQNhQ5U01MI7wERaEycTTaw09IT0J/kHsmRortUo+qIzYGFzOQKNajB4YOOyUU0vnYoQ6wFR5AsF79GVNIvzROo5QBhCNcANmgJ51d0J7OKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qc95vFph; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qc95vFph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736466307; x=1768002307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCVIpLPu4EuM0QPnsiwId0MeO8S7IojXbnwsE6Fa9GM=;
  b=Qc95vFph/5+yOs9XEFiAJ9SwiTy/kG7o9CE0ne2NidRo9cG1VjNyGPsU
   cU2VRxHU8CW4E/68B7qZhIC2Bw6QcXuTtwZX2c2nXai51qCCkoUuclN0x
   2jSH1B6PoNs/qjAiYvMIQ26a/vduoHG/S5oE+llr75JGeHnfWPQzCWXg7
   XPnL4fzPyLSCmykFzO5RMzxKpeb0ZwbLPvmwDncvOUhfE1hO/aCAqTGUY
   dS6RdoHIBSpYAc5I4dqxdKXAwbYJUPMFrc1X7cxhjqiV6ydDZXjG29gSN
   CYWXelL4GgkbelpiczGij9mQM4nqgnQyw9m1Jtihwrw3hflz9Wdlqf2nP
   Q==;
X-CSE-ConnectionGUID: 2XNQSWFOSta6C16CorVYPg==
X-CSE-MsgGUID: WthoON5HQBeeEjr/f2vy0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36442195"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36442195"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 15:45:06 -0800
X-CSE-ConnectionGUID: aZHRMlo5REuDVSSbNR1aKg==
X-CSE-MsgGUID: 6JuiJ19wSwKfPX/BlBgWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103750091"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jan 2025 15:45:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW2D1-000IID-0m;
	Thu, 09 Jan 2025 23:45:03 +0000
Date: Fri, 10 Jan 2025 07:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 20/46] arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0:
 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom',
 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',
 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq80...
Message-ID: <202501100750.Hmpd79U3-lkp@intel.com>
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
TO: Sricharan Ramabadhran <quic_srichara@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   5c0b085f7946d60c3b805a93cb5cbd7d766a0617
commit: f5fede6ad79b4a5aa0f1cf0480e84d8843d6684a [20/46] dt-bindings: nvmem: Add compatible for IPQ5018
:::::: branch date: 35 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-051-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100750.Hmpd79U3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100750.Hmpd79U3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501100750.Hmpd79U3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
--
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
