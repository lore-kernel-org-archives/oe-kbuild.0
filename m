Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45956186E2E
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758378009; cv=none; b=GyOKpBc7WgzH7hnueqlZedq+H3xdLmeFU8JwNWBkGS/5uGTLYEg6bCfNxElhYNfm3sxdbLnt+qemHTriVIHtvlSi6cIU7Acw2Bti9BjuA36+l4sjm4RPSJ/ooVs7yE2DfavSeL5zitiCt1aTH5Y9hXslmVwWy2RBLCZdt2vutJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758378009; c=relaxed/simple;
	bh=ZN3UgV78xJAft3Scsf1WoQeqIvNXHY+JCT5BVNvPqsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djr72G8ASTET5rbjC1y8Rlq+Iq0ctrZofNJy61UG+uLtCt7BhbxbA945+cvy/2YazaABv+sOLwNS1ituU61u3zxeR+swjWaS01eRjIz6GvnYq1a6y3Nm3PT82Fz/1n0L963mmBAIc1sbxjcW36DVpjoefBtgD51xnWURklumbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCkHcyfQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCkHcyfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758378007; x=1789914007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZN3UgV78xJAft3Scsf1WoQeqIvNXHY+JCT5BVNvPqsA=;
  b=fCkHcyfQ7QpXVGO2KExznyjKSX/Mr1806T41MFJf15FEcXmwGlWnk8ie
   +MpRnc4ytrs9dcRm5+IYKZu4KIawES+4gHnY3nenIEL8ym8Iswx6ZO0cU
   A4Kr8rcdFLlH5EMAK55CVwkRZsMCC4JSjsjr6jHLKwVoMmvCMQJoqykex
   GuvGB09bW1XrQt9jxSTbh1HLD3bOOaKUdniBM1A+TD1kajAMieizdOxIA
   OBnbk5DVMwfCNL/DOi0r1oP0QEf0v4Fbh3jc3Wq2P7s7x4VXBOOLW7vC2
   UmAXN38QrWmZ1HX1gZP3jdZfkOcRlbxo+NcaychGDqGaUhEFpu4S9ifiH
   A==;
X-CSE-ConnectionGUID: ab034yfATiOxWgzUAq+VTg==
X-CSE-MsgGUID: PATdjUwOQ3yUBXaNa19Wnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="59921312"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="59921312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 07:20:06 -0700
X-CSE-ConnectionGUID: P5qRyAl+QU2aV57DMBGZTQ==
X-CSE-MsgGUID: MtPKc4xKTfSxTq0sFNCoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="175641275"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Sep 2025 07:20:05 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzyRW-0005NJ-1o;
	Sat, 20 Sep 2025 14:20:02 +0000
Date: Sat, 20 Sep 2025 22:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 245/265]
 arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac14000
 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202509202223.MOWxUkHu-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250920/202509202223.MOWxUkHu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202223.MOWxUkHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509202223.MOWxUkHu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac13000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac13000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac14000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac14000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac15000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,sa8775p-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/cci@ac15000: failed to match any schema with compatible: ['qcom,sa8775p-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: cci@ac16000 (qcom,sa8775p-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,sa8775p-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
