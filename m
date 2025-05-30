Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55A23D28E
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748632494; cv=none; b=Emndn7y5hn1tNpPTNrSi96Fo6yBJXfGikSIJL0ID6qz60mJ8UV8/SWA83/lFvm/lKquXsrbvMIb1FmhqnFCfJE3CpbI2PBrqJ2bFQM3dgWvI2D9YLDDjtz9slJPrJtSwgm3ruovuSYntJtIRMj2F3rfBfkPbJQpdQvkcoFlYzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748632494; c=relaxed/simple;
	bh=VHkapk8foq/3fedt2dqrL1vvCKFzDVnUvYdCuJmk+iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjSSrVqrrcuijyZrec2V374rjx0ZelKAG6uaATpr/6Y33pB1zkdjsuiMo6ij74hmompClpW6Ees8uJc2HNg3+iLWr9EowQ7JzGm7BAdzhTQH7Nsmzir1Dm08khgYDE7L8+LKgboVjgQcKtozooYElz9WmwGx31SMtuOzZwRouAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDR4ZS36; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDR4ZS36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748632491; x=1780168491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VHkapk8foq/3fedt2dqrL1vvCKFzDVnUvYdCuJmk+iE=;
  b=gDR4ZS36WZNZ88L5805eh1Aldkn2RWQJDETuXAfA1PgeZRe1QW6kA25D
   jmqg9iuawMDHsLqcTghC0xSN2zcfb7RfsM74Fg8fAny7rvzky4PTQmHIM
   RHO4ycukviHzjDtBDqcydSSEbH8BUNr955Hd+hkpgMgnCov3XwbviJOXT
   Slip2iWQIsL5C2VKHHqHiTt2SzFIl2QbrdWyk/CPKsemcBmLHFtIi51R/
   LqE7L4bfRxyDQcLG0wsZe64Rszs0DSlKgn+hsTYeto9gyh8eZsG3Y/1Qe
   xySqq2GTsgICaK6svukqdmOpLd2rU4PvtRQD+3eR9AYmItDAvlAZf+wHd
   g==;
X-CSE-ConnectionGUID: RiXn3FXXRJSXj0dNGqULwQ==
X-CSE-MsgGUID: F+/Bx/9RS6SpA0FxlVPpag==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50427951"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50427951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 12:14:50 -0700
X-CSE-ConnectionGUID: KQdOFlMHR76dyfTzlYsgZg==
X-CSE-MsgGUID: KpsYU9DmQBS9uhWwpb2v8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174831068"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 12:14:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL5Bm-000Xty-31;
	Fri, 30 May 2025 19:14:46 +0000
Date: Sat, 31 May 2025 03:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add CMU_HSI1 node
Message-ID: <202505310320.2LqgRsCT-lkp@intel.com>
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
In-Reply-To: <20250528105821.158140-2-umer.uddin@mentallysanemainliners.org>
References: <20250528105821.158140-2-umer.uddin@mentallysanemainliners.org>
TO: Umer Uddin <umer.uddin@mentallysanemainliners.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Umer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next arm64/for-next/core kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/arm64-dts-exynos990-Add-CMU_HSI1-node/20250528-185921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528105821.158140-2-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v1 1/1] arm64: dts: exynos990: Add CMU_HSI1 node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310320.2LqgRsCT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310320.2LqgRsCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505310320.2LqgRsCT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos990-c1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
--
>> arch/arm64/boot/dts/exynos/exynos990-r8s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1s.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']
--
>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb: /soc@0/clock-controller@13000000: failed to match any schema with compatible: ['samsung,exynos990-cmu-hsi1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
