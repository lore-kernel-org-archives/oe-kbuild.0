Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17F182B5
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720346627; cv=none; b=s4dzESxzMIQhjtgxvF2NcjK4j377Lzm/hmIUXsmUyMBaFDhCTXfxulolwOOAHmwpg7h7Qxs+gfAXGZmF6Y2Jtt8aXJO777wCt7xErg2D4kOwkfih9pTSN9xj71xyQeJ7xeDCx+2itUsJTWLuVmyGmxbdUq3JT6m9tLeh2QHKL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720346627; c=relaxed/simple;
	bh=A2eheobqGsCt0mKtqw33wCz4S0+8pbVOzFVU1xnwWCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PF6RB59PHCm2oWN5qPdbzwfYos7NLeaHCg44oNEVs6F3dkRgmlVZ6GF2zxBEkOCX7IaidaiXKZXhlLZ+U01CL+rqnhEVWd9e4wbdQg2vbM1L6Sdn7xDdE7m5Iw/NAcEzScb7967NoNzAi0v/A+bZRZSwyB5P6TaKLIMDyMa85Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/6bIUnH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/6bIUnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720346625; x=1751882625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2eheobqGsCt0mKtqw33wCz4S0+8pbVOzFVU1xnwWCc=;
  b=J/6bIUnHvydYPiL6mDkSjbsP5GpMxuI46eN+RbEqjZC8jcssbNVcgMrc
   dQ7XLxh/RFxXtomBMwJlF7mk7c8cqoee6gUyxa6B1Y79Z0KTP4gQLq0co
   Pz01C7VXXlcUnpxEpHxuolKnK0RJLnmKkSv3/rNKlBKZ44MUuRBKI78f7
   1c6VIxQyYyGh9NEXRYAX+1l4qHX+vLjXv78Q+6VyEDFaljDUwPajwBkc1
   besy+1o01tlZUAGB5svdrWbXr8Ai2g3BUPCaZp3aSXvdF0tHsEqrZVTw6
   /0v1scPH8G4vrWq3WZF4RkvikCb6kCCWokva9pHdvW7yD/jusx8OvwEmq
   Q==;
X-CSE-ConnectionGUID: Ye0FJwTqQuC7NCheYMVVPA==
X-CSE-MsgGUID: i1glRqnwQi2c+bUKp0kNnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17771918"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17771918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:03:44 -0700
X-CSE-ConnectionGUID: bMtp9N2+R8Wl2wUuyx1EqA==
X-CSE-MsgGUID: fZCCIF3UQhuCd7mvB15sIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="52424618"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jul 2024 03:03:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQOk8-000Uos-1x;
	Sun, 07 Jul 2024 10:03:40 +0000
Date: Sun, 7 Jul 2024 18:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.11 248/290]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@24091000: failed to
 match any schema with compatible: ['qcom,x1e80100-llcc-bwmon',
 'qcom,sc7280-llcc-bwmon']
Message-ID: <202407071733.cUYD9lj4-lkp@intel.com>
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
TO: Sibi Sankar <quic_sibis@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   88bf3be9c327f2d78c65e7e4c10c677d4b36128a
commit: 740bc66960527754d4980e649953fb8ccecf67e5 [248/290] arm64: dts: qcom: x1e80100: Add BWMONs
:::::: branch date: 12 hours ago
:::::: commit date: 11 days ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240707/202407071733.cUYD9lj4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071733.cUYD9lj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407071733.cUYD9lj4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@c: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@24091000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@24091000: failed to match any schema with compatible: ['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b3400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b3400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b5400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b5400: 'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b5400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b6400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b6400: 'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b6400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c432000/pmic@c: failed to match any schema with compatible: ['qcom,smb2360', 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@24091000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@24091000: failed to match any schema with compatible: ['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b3400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b3400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b5400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b5400: 'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b5400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b6400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b6400: 'opp-table' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b6400: failed to match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
