Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B0779D0
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736485194; cv=none; b=FAByBYm7PRWmfReT3V9QBuEjZNKYcdXToXpBZx4RtBQCvl0eTe/EopOWl/yDHFRryAdS++Ci5Spd6Ad7kuY/fpGPkwLcNuqzylsRDizAn0bjuTGoD/Wwq0NBvuEZypMfqT9xykgfD7vN8ZZrqRnX7/kPXRMshHo3US5AENqTW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736485194; c=relaxed/simple;
	bh=jO3h/eVfM+Cpss/P5C9UzU4iQK8S9u1GyAQlyyTNppU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmXtsrUX68Jw8x/XMOS3DzdWutjvy3Enq0+h6hq3355CRtz9Pvmwwoz1MeHPDo66VeTy2vwnNPdOSOYBMceBfO1a9Z0uMsAX0zDMyy3LOMNvg/LJ00PyJO+72tzGq0XHjjF/v3LjL9MCs/bnRb+1dtKuMeq02npecs5LYot6SDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH3fS4J9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH3fS4J9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736485193; x=1768021193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jO3h/eVfM+Cpss/P5C9UzU4iQK8S9u1GyAQlyyTNppU=;
  b=BH3fS4J9Ba1HiPZo0l0zuLvTL0JPsL1YV6PJ8oWmyUfCKWHwuPUxBcLv
   VIkbADwKIn6lyCkGo9urbgpZ/CHc77aSOsa9doQl9D+J5ouSh6VoBOgDW
   qXKsPfrW01ki8khzirH1f7x3+oJbYkAoaItoXvNF5CEZ/ao8IP9DLfoB1
   7FgS/L/GmnN/srsb0E5SuphO15hwoPzqrWmicqJ1qOe2kT6FnqCvgwO/P
   pNpozNIs+tLISadlVMu4Zn+wCTsX1fFzFtkmVVlV+09rwNBc8NBqnmx8q
   TqcwtAJADW9c2lVzIgSoj6+Pev9S8+m+I7l3rUDC8WM4pdj37qD0l1+6i
   w==;
X-CSE-ConnectionGUID: LNfWZhynSMerVWUj1qgNIQ==
X-CSE-MsgGUID: WFOVua9/TAexlnMLP/n6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36878878"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36878878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 20:59:53 -0800
X-CSE-ConnectionGUID: Y4O017yLQnSkaYHoZws48A==
X-CSE-MsgGUID: xU5+oiPwTbSQUorRjlcNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108542818"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 20:59:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW77d-000IYd-12;
	Fri, 10 Jan 2025 04:59:49 +0000
Date: Fri, 10 Jan 2025 12:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 20/46] arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000:
 compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom',
 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom',
 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', ...
Message-ID: <202501101241.Djb4rzsV-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-053-20250109 (https://download.01.org/0day-ci/archive/20250110/202501101241.Djb4rzsV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101241.Djb4rzsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501101241.Djb4rzsV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: compatible:0: 'qcom,sar2130p-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: qfprom@221c8000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/qfprom@221c8000: failed to match any schema with compatible: ['qcom,sar2130p-qfprom', 'qcom,qfprom']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
