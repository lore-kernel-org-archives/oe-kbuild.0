Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88E80C02
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758436630; cv=none; b=icYoSbxBpFKSw9/YNid/icA3sW//v1+foKiubeo6pw42u8QLHA2rBrgDZkrLiSFZx1SF0eXvjFPryrgh2+gOx0qXiFpfAXLbH30HvgiyPtZ34z3VxxVrvfID4Jq+9bno9TlXdltQNJsMfaUyPg8qnNlEan1eZEruKJl1b4wzxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758436630; c=relaxed/simple;
	bh=g/ihSI92iyuZbVNT/bQLu/PpfEFfrFggap2qKqi8708=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqsWrUlM4Uh08QuEb078gSg4DoTxXnTF213Okz6Y5eTHAUx7LtshCjp/Jk56bSI4maiD5UCJsu9E2kT2YJPleF1XDy/lIyIfbVrz4TZ775FzszJ9LirIkCTDZ9mfiKWdkbkPC7pLGT8rPsEXMogI+f59AR7iaxnx1IwYOAzjGEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUkgwqvG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUkgwqvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758436628; x=1789972628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/ihSI92iyuZbVNT/bQLu/PpfEFfrFggap2qKqi8708=;
  b=cUkgwqvGIh4RD6S3b8D7W/Ooz0JjKmtcacz95Jnp795612LJXQdHNmJc
   IJU5+o3tW9eRW6LB5i/t2AspEP0c16+R9BjODWRD5xtYlL/As8yuYwB34
   6EhvdumtNMyYddpvfGpzwTU62qokVGb8HgBno0oWOF5luyWhYqrqvmk+s
   qHO/YSY70O1qwN2AV76zOArTWBXVhiY/T3qMlmTeQfBmPGapZThorDSU8
   4jwAZ+964c0zrmqVlthvDAwHgu4LboFx3eFzF6QNVcg4WYSreRzyfzppD
   aNkrMJreICBNAJ7dSZ/NaXxmW7u/xpMFA+Bf1Ku7ZQvgWUyTQSq5874pN
   A==;
X-CSE-ConnectionGUID: S1t0XxgtTsGQZVNBLtLdYw==
X-CSE-MsgGUID: CHwtJ83xSqmMrFX8rZ0OfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60848822"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="60848822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 23:37:07 -0700
X-CSE-ConnectionGUID: LeKbMEBUQzi8dk7p+QJHoA==
X-CSE-MsgGUID: /+BVx/r8Thuld8EYKsDvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="180223224"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2025 23:37:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Dh0-0000W7-31;
	Sun, 21 Sep 2025 06:37:02 +0000
Date: Sun, 21 Sep 2025 14:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 244/265]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac14000 (qcom,sa8775p-cci):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509211425.T9DfTJVF-lkp@intel.com>
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
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509211425.T9DfTJVF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211425.T9DfTJVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211425.T9DfTJVF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
--
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/cci@ac16000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/isp@ac78000: failed to match any schema with compatible: ['qcom,sa8775p-camss']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
