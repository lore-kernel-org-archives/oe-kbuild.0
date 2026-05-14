Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229C38D3FB
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802185; cv=none; b=EI3T+4UiZWC4G0UcM6ZKCpzxWwMVpFgGDESGrAcArrFEK5MFRg9TRqp84PBOkYeuHvEbvPo8FL1glzL4RSBri36Ah8UVlo/2m3LLYiReaejyp3Rvfj/hpLJHWbOwsEEzsXFDdpuWATl1p7GGHJjx2QVprISf7Iw1vooyA8Ugg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802185; c=relaxed/simple;
	bh=nZPVTa2dBc0HeLwHGXggmDZg1nMRNY3/oFVsoZhnGRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kHTdK5R9Tm7ou5YVaer1e16Ubv+ENJNIDzkGvCSn3aa3TBMMQ/sIdHby/qIBeDZgAFltb+B2c7xAar9yXJ0qPwsd3gkdzBoUMKItn6YIvA/LcrlFH0c0jV8f9xsyRwepCI3pIWj1dAJ81U+L4GZVAqOp3MvRG1QYujcvNJhRyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay8GGtXM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay8GGtXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778802184; x=1810338184;
  h=date:from:to:cc:subject:message-id;
  bh=nZPVTa2dBc0HeLwHGXggmDZg1nMRNY3/oFVsoZhnGRo=;
  b=Ay8GGtXMm/LvgNy9JqOPAOsUaQpcTpy51jGsz6L7hWfEL19mqrKvaCN5
   9wlYBJwVI83xq9ybPPtxNhLEDxu70mXjZtUHxw0KrObFjs2eaX/430Et1
   x0wHU7Zq60f7cLsAqkXauHUWwiD0zXFI4H3ZIWL69S8qqL3jiJz0m/ztl
   TgkfM6y/D4ukMUyU/huHCiMi8EMLO8oXAjcL9cvB4wKf1SlGGdSpaYJ7U
   dMvoxHoGnCWVK7AXjwR8OVsouCr6aFDOFIiPT3i+ai/Tw+Hf+Rbh8KO1p
   M1U9Mrj/PPueQQFeYneXwmZY50lB3RCheNjLwC62wxU6o8FMzG50LlpFl
   g==;
X-CSE-ConnectionGUID: GZZQHTHfRbOdGQqKvoqUNQ==
X-CSE-MsgGUID: 7sl85HMhRFu6eDwOLwm8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79711815"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79711815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 16:43:03 -0700
X-CSE-ConnectionGUID: oivJICaBRbaFD0SNu9Uyug==
X-CSE-MsgGUID: i9ylu+wkSb6y1dll0+8Dfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="276618044"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 16:43:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNfhk-000000008tN-26ua;
	Thu, 14 May 2026 23:43:00 +0000
Date: Fri, 15 May 2026 01:42:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.2 78/90]
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: watchdog@f410000
 (qcom,apss-wdt-ipq9650): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202605150110.kEB7NaWn-lkp@intel.com>
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
TO: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.2
head:   c4b423835ee7529854ab39b50cf766bc4c6b4d66
commit: c50080d313d35a54c7847536ce9e27ad62546251 [78/90] arm64: dts: qcom: ipq9650: add watchdog node
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150110.kEB7NaWn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150110.kEB7NaWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150110.kEB7NaWn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: /soc@0/pinctrl@1000000: failed to match any schema with compatible: ['qcom,ipq9650-tlmm']
>> arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: watchdog@f410000 (qcom,apss-wdt-ipq9650): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-ipq9650', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-ipq9650', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-ipq9650' is not one of ['qcom,apss-wdt-glymur', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-ipq9650' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
>> arch/arm64/boot/dts/qcom/ipq9650-rdp488.dtb: /soc@0/watchdog@f410000: failed to match any schema with compatible: ['qcom,apss-wdt-ipq9650', 'qcom,kpss-wdt']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
