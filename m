Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA952758B
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070800; cv=none; b=oWzYVjobxcre/Utn9exlhlZIZSm87yrf7ReIV4aowDfRjf5tKFtPemFFppSsNcbxTnpwxf5rWVyKBFZPCxCxFEjzJerqQUB0BAGXCGSN+acD313i8u8T3YQkhfJrfgb8mBqHCHlIBrea9gDtBmPPCeG9QBKuYiAiOLYXLsoZ7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070800; c=relaxed/simple;
	bh=jncURHq3qoCSfWmyuM85Pjxqe1uDyo2R0tmOkMfW0RE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnnulg86y1/qIfMZM0UFOQjQDXXCWFuFigoPmamNcHuefILOBV5wGFqJIfB44VUht5tb71eUb1eS0+nTlwRbm8NLZs2QzFO2KuBZmVPzbWUcnJ+fxEn9YhIxxtIovl4wjWV1zJYwtTsMr0U0hObWth0wvHvDcfS13gsNIlLD56Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eM4noUaS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eM4noUaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792070798; x=1823606798;
  h=date:from:to:cc:subject:message-id;
  bh=jncURHq3qoCSfWmyuM85Pjxqe1uDyo2R0tmOkMfW0RE=;
  b=eM4noUaSgO3dBQBkimyDL9R5xvXLijACvwcJs90f2juJE7rrdR51S+q/
   574fmK7XqGDHCCBDhjZgAr2ppFyjQjXS5Dwueu1wyEIOZ0g1olJaj+Jzz
   JETrCGV1ETxqH3JikqFx4+Yh8+obdLMmBH+HZyN8deCx4x5e+U6eqUS43
   TKV4PNt19rbj58/ao1BGl1zsOqtYg88velz89kVKAh7godotK4HGDHOiB
   /bPkqT6gR5hOmbIFQDYONQ9jCpIa30unvtr22Gak5NT6paoWMCDncVTsR
   vXDCho08Ipr0X8JaEAfl8ifH0QEVbrir/r1NybiL3JVk29x6BbFyAf9KB
   w==;
X-CSE-ConnectionGUID: koVF4kGvQHSuTJN44oj0fg==
X-CSE-MsgGUID: zaETdpYiRY6dydUvCHpthg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="942303"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="942303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:26:37 -0700
X-CSE-ConnectionGUID: oDXeO9O3T6a6go35MjNn6g==
X-CSE-MsgGUID: mjYZXurbSlyFyQjYeBMQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1668090"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 06:26:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHLTd-00000000BiB-485K;
	Thu, 15 Oct 2026 13:26:33 +0000
Date: Thu, 15 Oct 2026 15:26:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning:
 arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202610151535.DW60FVfL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-r2105-20261015 (https://download.01.org/0day-ci/archive/20261015/202610151535.DW60FVfL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151535.DW60FVfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610151535.DW60FVfL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get a pointer to the per-core table of reset vector pointers

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
