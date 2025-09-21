Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331F2512DE
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758446113; cv=none; b=i7dd8emgXOSSRRAhPF21jL4ottC6hrT+tZ04t6M0zhrZAEMCIIuVECODE8uIVUE7qvnT3E0TIU1P4lrvj4GsvUfq+vJzSY8NT+eRIMYDYs64haK0HIBBdhBfA4FcLojw9nBQtU7ZPJLT0KkaL3PHoqxPfZ4rC/HHX1Drj/pFXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758446113; c=relaxed/simple;
	bh=9tks03gwcuGFK7vhojS94dpRAxVdthWp9RG3sjbSUzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awYs3UVgtVJiOBP2PIIac7pGlouXoy5r0iwfGQyTebgrvV9F5c5qwC6tiqVjMn18j8gVdcvdxZbWIJ3JUg5byqemKVHJRn7d6sDmwpJWlagO7E18EYufTLND8Nttxj6SDPpW57EuGh8AiHfh27xKCaAEMARmDNg243ji+ohOu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6OfzqLd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6OfzqLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758446111; x=1789982111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tks03gwcuGFK7vhojS94dpRAxVdthWp9RG3sjbSUzg=;
  b=U6OfzqLdxahs41xrHnhCcRg4z2ssjL1LZlY63vnbKFsjpeSzF9cNw5ZM
   RZQGLOTtocPbGfVA7Pz6msU2rNWpiptucuB71XS5uq6S3F/kJyvi+ftQS
   qydxJDUl6mPuwNk8j7To93acWW5SkRZ/IKjUR5SV8inBHTNRN5okNXfHM
   mQBX0ccuy7adNeOmkUgE90O0Lzw8YDzd1xmZVfeK3oS3RfVZZBePjDE7S
   oqRnjt8ldtOmQhqP8girq2m4vU2omhje873/plY+ntLh61QYAqYUyaWj7
   uwkTzIT0I9QKHaLC2cKAMljFbjY+jxMQcVTtqiGd8qZJdXmKcU0cdWdry
   g==;
X-CSE-ConnectionGUID: sLG8GAEZT7eIqBO0yADMbg==
X-CSE-MsgGUID: g4dGMzvDRxiuSNtbvbXzGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="78178853"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="78178853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 02:15:11 -0700
X-CSE-ConnectionGUID: /LSo2bv3S4a1+5ZKifxQeA==
X-CSE-MsgGUID: ovJoiLyFRwG9pwndN0Hhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="176140235"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Sep 2025 02:15:10 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0G9z-0000co-37;
	Sun, 21 Sep 2025 09:15:07 +0000
Date: Sun, 21 Sep 2025 17:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 245/265]
 arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac13000
 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202509211711.rvI7ykrm-lkp@intel.com>
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
TO: Wenmeng Liu <quic_wenmliu@qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: b68fc45910d4eb1b3bb7e160282fba5a4bdd8409 [245/265] arm64: dts: qcom: lemans-evk: Add IMX577-based camera overlay
:::::: branch date: 31 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509211711.rvI7ykrm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211711.rvI7ykrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211711.rvI7ykrm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sa8775p-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
