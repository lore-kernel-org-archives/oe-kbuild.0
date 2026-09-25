Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877E4A0131
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342634; cv=none; b=rdgb+8l5EoalIvbj+OYmQcUuBar9f/cWXqqMvd0zynWdaMWQn/0JU3AY11Uf9B7aQnnnlY5Tj1ds8A93vWZ/m0D+cOMANmRbA0m5h7ZJYD8e1pzQsMDCsUl8ueECv1alE68KtK7RiK1/Y8K13ncBmxFlYs8hlangILsgJFATKX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342634; c=relaxed/simple;
	bh=sZcjJEHnfamJD6gBydloeAlWPAyb1kZcGSMR7qrlmhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzenRtc7Yr5rAmuDHiENZ7k4BVvLWKsxLK0IncQXKQIECIZ27sVYBWgmzTzyR8B411WmCsySeHeD5ZkxXoT2xC8JShvZfT38qKloJbOsjCeDKT5Lu/1NIj4QqfbOXQf6mmMayteTiRNe6zX27+axwadopRIVZezTCPKl9D2Oyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFsZDXp8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFsZDXp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790342627; x=1821878627;
  h=date:from:to:cc:subject:message-id;
  bh=sZcjJEHnfamJD6gBydloeAlWPAyb1kZcGSMR7qrlmhI=;
  b=OFsZDXp8S9zcyFLpUfNQWmPrLv5Q/nYlBDybsO8Ahkve5H5fCOICDi6e
   Suz+KsOChOZMY3dou9E4kEiD5KBexLCXHNrT4pPz+wjH9xnBzmS5zBv9O
   f7ME9bvT6XCUtv8UXQ4tCmrU+DyCK4EkDCsit0XW6bndDq/19hp2eWRfS
   60so9l7y9l50CJWCJ5GY98UT2eht8qXIZsCCBsNKsV0wSEAkD2LLCgpWL
   EhP/8LQoSeX9m6hQv9M4rf87DmyuReHK6Gug386gCy+R0flbtMAXmIjju
   /0qGNRTVmP53a6BZZLyCIkSBA0kY+RW9HFC7OtoyStLJfw2zCLCXVZSTu
   Q==;
X-CSE-ConnectionGUID: m79EhsffT+eH8Loe98vcAQ==
X-CSE-MsgGUID: hIHwBqw8Rq2lWCvH9XCOiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91145781"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="91145781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:23:45 -0700
X-CSE-ConnectionGUID: SCCJ1k9nRk6Y4jtKzGu1Ag==
X-CSE-MsgGUID: Y34Ol5wLRqG/ojtzqtrnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300605571"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 06:23:44 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA5tt-000000000li-2p9G;
	Fri, 25 Sep 2026 13:23:41 +0000
Date: Fri, 25 Sep 2026 15:23:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 21/22]
 arch/arm64/boot/dts/exynos/exynos850-a217f.dtb: /soc@0/sram@2039000: failed
 to match any schema with compatible: ['samsung,exynos850-acpm-sram']
Message-ID: <202609251555.8VWqWFGT-lkp@intel.com>
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
TO: Alexey Klimov <alexey.klimov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sam Protsenko <semen.protsenko@linaro.org>
CC: Peter Griffin <peter.griffin@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   3653ea2aa0a212677569a98cfccc183ba2c890cc
commit: 089d44f32868e6a5fc3f817073b59b298fbc9e73 [21/22] arm64: dts: exynos850: Add acpm SRAM node
:::::: branch date: 17 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2404-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251555.8VWqWFGT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251555.8VWqWFGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251555.8VWqWFGT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos850-a217f.dtb: /soc@0/sram@2039000: failed to match any schema with compatible: ['samsung,exynos850-acpm-sram']
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml
--
>> arch/arm64/boot/dts/exynos/exynos850-e850-96.dtb: /soc@0/sram@2039000: failed to match any schema with compatible: ['samsung,exynos850-acpm-sram']
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
