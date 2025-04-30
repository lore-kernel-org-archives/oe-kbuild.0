Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BF2236FC
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746051717; cv=none; b=H/AgLplRoKu5E6fqOZ/P9uCa7t0pCyfGkmRPT+HOvhyUcFem7ujsBmn6s8mBS8VKCYMDdUjwJtkS8kxfycyaEiHVrx++wh2D3Lz+CSkKQcMVzHC64l2hsO1JkNQGj93rmKtyR+Mj/eGJQ1q7PkdlWBKOds8EwiVGqEawiSTD9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746051717; c=relaxed/simple;
	bh=/zG2xxjlbAH94EnHeNInvhWgyjL7Y7LteyO9YmXE+3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMdHqQtOGwo0Mp9SOanefflqgSWwtZPMSl7rlCz0TUYDmp3PF/8K2AdV9RRYWsyPc8uHK1kgKuuOqlUgqNexR1xl/5YqF2MXYOHDGn+/rcTdx2xyO/tohh6v+byv1WEqTpbYBumyoqpaRcv+qGlNm7oApq8UZH3xW31BxvFdLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2WneiIr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2WneiIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746051715; x=1777587715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zG2xxjlbAH94EnHeNInvhWgyjL7Y7LteyO9YmXE+3c=;
  b=j2WneiIrO9DV/W4xSYru9+6imD5L/pjrF0Aem+c7MSSsLTzQiliXMY4V
   Mz3jXmxWOBmVbLea8RfsQrHpwk2bA2iH2bqH81xWeInXKOs2YbJFQ3frI
   8vcjFKjPL1vMDHPB9+ijVCAgF2iWClNuNZPRV9yo5+Rtqw6ZBKlYx4ZPh
   Kt+zj6AdoKlY8T14uEG2Gv73TBJFU+jBXJxPYp9Bc6A4hNurDFjZqrlD0
   PI6iqENqe/c0nCdn+uJ3RxtKVdkKkSntj8o9ysXW1yVSsmG3D+Gnek7WR
   pjc7Wd3OiE/UxpufZ/FDGsuw3a26BJ/57BRgg3LKDm/0HzSZzzz4SXpQ9
   A==;
X-CSE-ConnectionGUID: ARWY0sNUS8mK2VExDM+EOQ==
X-CSE-MsgGUID: B5NEnkxVTIGyAPJs56sGBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47611385"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47611385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 15:21:54 -0700
X-CSE-ConnectionGUID: nWveIsOTTHyT2LbOWV7sZg==
X-CSE-MsgGUID: MRkZ019qRyKOjDxJd/Irsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="135218766"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2025 15:21:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAFoM-0003oT-0B;
	Wed, 30 Apr 2025 22:21:50 +0000
Date: Thu, 1 May 2025 06:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 6/6]
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb:
 /soc@0/clock-controller@1ed00000: failed to match any schema with
 compatible: ['samsung,exynosautov920-cmu-cpucl1']
Message-ID: <202505010629.T5s3sk24-lkp@intel.com>
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
TO: Shin Son <shin.son@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   aa833db4b82205275f4a4c08554b3dde99dae0c7
commit: aa833db4b82205275f4a4c08554b3dde99dae0c7 [6/6] arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010629.T5s3sk24-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010629.T5s3sk24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010629.T5s3sk24-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@1ec00000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-cpucl0']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@1ed00000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-cpucl1']
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@1ee00000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-cpucl2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
