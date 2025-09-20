Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E61C01
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758359383; cv=none; b=bnrDU3ApdcEsjjETvaJioF9YiwtOc7wekD77KZaFniST05D5/Gd+FXwKvRnkvds12PT9Zs3h3Q90wH9ywSpEvadTRTN7vtsTiCx+49zJb5o6dLkSvG+VWr4zF1aavc0SekRgKvN+OOCfOzFIDEZT6YaRF3h7ZASKY2HsZea3rPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758359383; c=relaxed/simple;
	bh=r2VMC962vV6heZ4ZJMfQvfSK2lazzSoBT4p7rFX9ENE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cr5Gv/7mv51qq0VzRN9TLCB/+eYMdW1AhqRfU5jzlvud23Dlq2reXjVlTZIpTMle/mrchTLt94uCtTyZBeUgem8qBCd33N9SBRjFnvvXhQLxAs14AGohMZq98G0YbXCKsVFKcZeIERxT+w+XMyivrAU8ZrrwjAusuTnmIElgSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaxSYcGu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaxSYcGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758359380; x=1789895380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2VMC962vV6heZ4ZJMfQvfSK2lazzSoBT4p7rFX9ENE=;
  b=MaxSYcGuyZmfAuxDlWR8RQnubBe5G+RWQTBSDcJOqmKFLD1uey1k8aBp
   mFksW50sqV0pp5ppQ+tBkGjvWGJQa7K7RMXKufgJlzM+FmldrTMDa/4Vt
   VBvRPZ9E1KrCAGGpP4bZOkgOUo3aqhxQaAYErQEpH/1+AoY50RlMzrlD2
   Sb7pbyiMl3vcRzSGAMRnt+2F12kwklAX++iHNPaaYpkLX8bPGcROkl9o8
   hYwoRhHe41fsYrCzc74AbsY3sX/g9i19sKYYcVpSGUOMOZy8tOne2Kx8T
   9rbUa6l2FrIehuNAw1XyZgBI9B0zN4ntHhaXGIpqAcxGNpe7N0gIYh6Cs
   A==;
X-CSE-ConnectionGUID: efJu401eTCG1VWOwV4JqBg==
X-CSE-MsgGUID: exMxl7cKRpq28cmKU5g16w==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="70941596"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="70941596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 02:09:38 -0700
X-CSE-ConnectionGUID: Q+hJTL5URFyylHQf/PGY3A==
X-CSE-MsgGUID: M0YEOCfwSee1A4XtTtwDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="180062264"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2025 02:09:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uztb4-0005C3-0i;
	Sat, 20 Sep 2025 09:09:34 +0000
Date: Sat, 20 Sep 2025 17:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 244/265]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac14000: failed to match
 any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
Message-ID: <202509201722.p6zkfJk0-lkp@intel.com>
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
commit: 3964a91e552880c356ec4d3f09eed927f48e9c66 [244/265] arm64: dts: qcom: lemans: Add CCI definitions
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250920/202509201722.p6zkfJk0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201722.p6zkfJk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201722.p6zkfJk0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sa8775p-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sa8775p-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
