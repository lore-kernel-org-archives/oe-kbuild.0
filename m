Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECA30DEBA
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230736; cv=none; b=VdNUxgVkGtMpXjyIwtekNQd1Vfy4aQQKReuT2QLBhBCC4x2x81uaaDxYbRniZRc93cFTQ3sOb05XhHALAsUtT5F0q5PPLYEJGmzw0suTIMW8EHO+MXuRs3tcC7xNtUFwhwfp2pP3QXYjoz9GkyzT532MBRwDprUAmZPMrqG0HbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230736; c=relaxed/simple;
	bh=ye5DOFBRZ645qoJKDddKngi08cGvIdeKzzE6UTVmULk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QsbIzV73xNikTJfEiZj6xZj6bLcAi+vdBJpvdTMq2GfG/8/zt1ci1bqlzhvE8GB+wvaUv5mIupSGyXlO+PqA3mDtKyvruebloKfzkKFPudGpRmFuR/6AOfdu3nJQP2fdnsG+r6G46V3q7Wapz7L8oH7mhaYFL9dh85tGNQQRvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbM4Jwu1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbM4Jwu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778230735; x=1809766735;
  h=date:from:to:cc:subject:message-id;
  bh=ye5DOFBRZ645qoJKDddKngi08cGvIdeKzzE6UTVmULk=;
  b=BbM4Jwu1lW81fXYL/GO8GI64JFGe3WARYdo3dEyM0QP764ny7pWJqJKy
   RS3gSV1dseFkGT08Lt7HjS3NuAjVuuFUB4Z8jqHrmxYh9AH1LDMm0YLaJ
   7gowUwMXRe0/4ATcMkPwrcxvw9Q2c17HXqdIhI6gIGpJrGMjz1o4JdxcZ
   OpdUk53b/lSJ7usgxxvpXlUzRXiYUEkVpmaE2GztHLYzMyCOBdTdYYbsh
   FSedVKwXdva1/CW8ErsG0Lfjvrjf+y57VhOpCt3Pty1+PPPAcTtcRTaSN
   dBv0PbuReBCwLKUxOc1sP1IneCFm+akHuoAYYNN4TwHsaEeHVa6kFRZt3
   A==;
X-CSE-ConnectionGUID: lk3wN16ET1Kn2P2O7vLr5g==
X-CSE-MsgGUID: 2o/yk7v0R+KIPWPYnn8DVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78920275"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78920275"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:58:54 -0700
X-CSE-ConnectionGUID: SDMHH+pJRzOSmwuGvgd0yw==
X-CSE-MsgGUID: WwgedlfzSeeRu3KwEXx10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241060206"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 May 2026 01:58:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLH2o-0000000078L-3n8k;
	Fri, 08 May 2026 08:58:50 +0000
Date: Fri, 08 May 2026 10:58:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
Message-ID: <202605081059.k72sXIPy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Sahil Chandna <quic_chandna@quicinc.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: 6a563a9760af9d5476faf8b3fd419b0714ab0b4b arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260508/202605081059.k72sXIPy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081059.k72sXIPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6a563a9760af ("arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081059.k72sXIPy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
