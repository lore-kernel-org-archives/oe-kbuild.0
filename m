Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C704A4856
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542087; cv=none; b=auVuboJnpYGN3jO2ADjxOjuohbRJiQXxyfiipDsCavpWalfJXSfxI41kJ8GGI2dbKssnIYga5Nj69sZnbUUs7dtBAsetSZvTCaa6NxVsAZ3PC8nAnyaugn/+eY0AxPesvRmNoYFGnwunJ4EolnToySfL8SghL5hZh6+q3q7asBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542087; c=relaxed/simple;
	bh=Z4QH+ZtxDIzIPAffZRREyChwQHKBFoikU+DyGnLhvnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GAfcykgZVBi7SbNnR2H/1JH1E+5+XI3WB+ZVnDC9S8agvDLBWd+jaR/6lYvKWOhlIwa15MjET1lqUKa0goe1o3Bzgpzi2kYHER4oaEkXGJLhaoJqvttFCQt0Gy91D7D1rlmjRQaAv74QB0SW90WJh7qFxlfUwhQShxfPVeWnU7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOoMhbjD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOoMhbjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791542085; x=1823078085;
  h=date:from:to:cc:subject:message-id;
  bh=Z4QH+ZtxDIzIPAffZRREyChwQHKBFoikU+DyGnLhvnw=;
  b=YOoMhbjDJuA8stybTnkMY6l8zlVRkz2JUm+iE1/fKn5+oDEP2pr0HpiK
   kBqRR6d4dmHjkr927N3Uf+XpSV4q+fPuyZDOnP+7UXbTK3v4x9Rjh9Gzz
   gTKMx2c+xNQqMAvnnKN8z0fXxLzV3FcI07xaksab9RQDFcf97naFPaDu4
   YSs/1zg5JtxZlfonzsvHzhyQiV/IzVETg0QIWiHf34nmWbfnbBvcr9BAs
   bMdEq9DG1q//e0se/DztA2v+ZBNIC0VrjbLvwmNzeIQk24fF7issbcNov
   8iSgajn7HdlBt+S+mgpV4QGT/LKeFePOYXKnMBJMtD6xqnVWovzR1rNaP
   Q==;
X-CSE-ConnectionGUID: ap+oMa2eRgOMk2+ACDwv8w==
X-CSE-MsgGUID: XNW1HC+/RdCbdgYbgHLiGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="226266"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="226266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:34:44 -0700
X-CSE-ConnectionGUID: xXh6SKdNS3SroXEdmlYjcA==
X-CSE-MsgGUID: gOBbARAvTkulwxNUpYsRvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="605175"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 03:34:44 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF7w1-000000006yH-2WXF;
	Fri, 09 Oct 2026 10:34:41 +0000
Date: Fri, 09 Oct 2026 12:34:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones:
 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
Message-ID: <202610091213.dYLsvv46-lkp@intel.com>
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
TO: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
head:   336d6db9b8459aee9298b06c6d8a3b98784da5a3
commit: 336d6db9b8459aee9298b06c6d8a3b98784da5a3 arm64: dts: qcom: glymur: Add EC thermal zones
date:   11 days ago
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261009/202610091213.dYLsvv46-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091213.dYLsvv46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610091213.dYLsvv46-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
