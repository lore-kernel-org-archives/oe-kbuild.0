Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5973E0C40
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909422; cv=none; b=Ef14AnQm7HPpyXJupAvMlDkCgM0YFDEGlzrm4YrAmxPYie6skgyBNzRDf00KwOdDMz9PJp5qxPCv5EL8L3Xk9XCkXsve4eCbceOUU6a0LXTdGdV+Mw8ObWpSxf0qA7bYLGMC4G5NGXsYAbb/Ug+HeJcYW9svjCIGS5oSMINpLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909422; c=relaxed/simple;
	bh=Yc1BojaDZvSg2mav+rszc2leMuLOL7A1d7P+1BGbsyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AW1NeGkY0NEwpqTIwM2waM8PllD9UTaqp9GMS33+KnFqSKA6negXmQ6Sx/hyINXUTIijQsCyti4Y0limL7g0NyWoTntZ5wgzu0YVORgsao9kp+F7QoX3ky9B7/UxOmhnY6uKfa3F93yRuj7V24+SsdUGx6Cg/lqTS6+47uLa0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwu31YUP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwu31YUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777909420; x=1809445420;
  h=date:from:to:cc:subject:message-id;
  bh=Yc1BojaDZvSg2mav+rszc2leMuLOL7A1d7P+1BGbsyA=;
  b=nwu31YUP0NdXLB4hCtTUQKpwQAdN7n9ZMTQujWXlodnZOH0j/RZmv6c4
   HR1SGC/cPSOy5cZTOGTmfXDBZYo/HrpgyVbmPZwyXzy8PGKOdFmUhLKUM
   4F+i58ql5UsDXQvMgZaqRHRwXVsC5op701oqTINbH82fU5Zoo8/3+4NZz
   2ZD/oNUBfOi6CQfxjE7ORqsnG2G6nWsf6D1oOAN/VVySTRLeYP3itUb47
   mWBXTEAEzdkltBcB0eGq9wNlfVRpf0eS73WdvWvkzdFDFP6OcSgjWiHmJ
   gZ1ywNLRC5mvMW+3tEBva2uDOKw9ZzZDVk84CNgPDu82dKLhkC+i0xKME
   g==;
X-CSE-ConnectionGUID: 6XzW5ORwT/i5qijA4H2iXw==
X-CSE-MsgGUID: Aewmw6ZGRzOF+QdfUyXoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82619069"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82619069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 08:43:39 -0700
X-CSE-ConnectionGUID: BZs8HWvtS06ocbi8qagwhw==
X-CSE-MsgGUID: 6zzEyjFgToOMN8T6y5CiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="237323360"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2026 08:43:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJvSK-000000005rx-1d1O;
	Mon, 04 May 2026 15:43:36 +0000
Date: Mon, 04 May 2026 17:43:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
Message-ID: <202605041733.VY9AgIIO-lkp@intel.com>
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
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 6a563a9760af9d5476faf8b3fd419b0714ab0b4b arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260504/202605041733.VY9AgIIO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041733.VY9AgIIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6a563a9760af ("arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605041733.VY9AgIIO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
