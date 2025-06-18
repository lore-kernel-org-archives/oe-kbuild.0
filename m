Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452718FC86
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223101; cv=none; b=asqtu9TPiCgPm/CtBggo9XV9h5mWqCbqT072dGx741KtfeevlITZCHoewBnIqUvFqPlcfuz/Ib8sReSQCwwdBy1iO5UUNK3Erv4QWdqrqXacV3LqTKBtknVCJsC/HwSx7sVkFamN1le4GZCAM42SrHQk/ZeuAn0AXIl8NT3Ml/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223101; c=relaxed/simple;
	bh=vQSJQ661pqDlJeT5ucew+LXk6ANAM5p6c7m74M8gCUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzDcLsrTmXkQZkgWqMRSJUyq39Is6Y+JTJko8NjlG95HaoLKXKzjInczsyMdGDdwhchzonAjHlXfp/8TUkzOCWn7O3lxhLRiYBs6yzT8iceT5AKrCPR43ftmupzNg61XNaPkkhFtF02nUs8z0wYeCMZS8TtGEDVXElN7IM1SZcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3VAh/6I; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3VAh/6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750223100; x=1781759100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQSJQ661pqDlJeT5ucew+LXk6ANAM5p6c7m74M8gCUg=;
  b=g3VAh/6IRHj1skCVGfZ2I8nSK8ZT22gA3/9rMTwT+so99vFif64tom+N
   5Iz8cT7C63nCRBFzWvasmf3lpEGm29ncXqKJIq8GoAr7msYLStwzcxNnA
   ewqHcaP7eLfpANlJtLFCOHaKAPK7G+wvWp7MG6oIzoKStJgovGWlhrEvJ
   Z1iN17ykXjn5yOIHLPPrvmIl8xBQsyZ1mLCP0ZM7MufIjTzlmK6n45it/
   Gf5WRBSFPnlZkylI74Y+FluDTBG0u7VRw5U/1DH++sR8qt/EP3zulVDla
   PYIzbTZffu/YpheoRiS8cMPQTDK6yFZXG+yDIRAHuMw2Hjc7f9nASJr4z
   A==;
X-CSE-ConnectionGUID: S2JQ3wo9Qvi/ZJ9LRAiPYg==
X-CSE-MsgGUID: 1iUtkGDCRk2WiilcNaxdpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="62701272"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="62701272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 22:04:59 -0700
X-CSE-ConnectionGUID: 3pXfnDuiSvmelLj4TyeDXw==
X-CSE-MsgGUID: 79/UiFFoS0KsPtKUWktMXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154497617"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2025 22:04:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkym-000JPm-0F;
	Wed, 18 Jun 2025 05:04:56 +0000
Date: Wed, 18 Jun 2025 13:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 13/23]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb:
 /soc/mdio@3009000: failed to match any schema with compatible:
 ['sophgo,cv1800b-mdio-mux']
Message-ID: <202506181221.EuUQcAMN-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: f009754bffb9d03ce00b6336391ca82eb71138c8 [13/23] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506181221.EuUQcAMN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181221.EuUQcAMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181221.EuUQcAMN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
