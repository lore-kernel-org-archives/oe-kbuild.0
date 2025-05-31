Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F532111
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748671241; cv=none; b=b7deCvMWruDqHIwsu+UgdVnx7279ADn1K7ZZvAoeJ9RDxOzx80NrrsdIIP5GX07d+LHxcraWhEVqoxJJa97Fsp9qblwP8DBQUHGNv5uMXIdQZFz9/tRaSzT7n9jepneRv8GfyEn6GGa+cH/T6nbCJ4ZOCUH3I6MRWsWP2+dExPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748671241; c=relaxed/simple;
	bh=1d9mCMl4gb7dtwe6WczKMKPbJIOCZXaFaA9Q39XWK3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJdwg0/1x+z+TSN6WMwKl6afwGeYchKGTq6oYq7r8ELC5Sp4Y+gM4XrQ21NcEEVGkxaRODVvnwN1nQEFmmqgJYo+X5Zg0JrJLCoA4plRxGAltgV55HzI8M3vlVu13hpeFF7HegzkR+XnxdDFihSlGf8EhaKtgyE2NsWh9aLdGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fs0RjH+b; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs0RjH+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748671239; x=1780207239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1d9mCMl4gb7dtwe6WczKMKPbJIOCZXaFaA9Q39XWK3E=;
  b=fs0RjH+b/X+PL8d6I95tLBVYmfeF3nVuhTnZkBrP8BCnUeydfwkEYJPv
   If0hFuA7DYJJAV7CTl0raleOJIKrF2J7PBbIMg3MDOxBvuqtzf/H7rZFm
   SqcPukDVz6XszlTuIteVcgJhkLJ4ZU4oIhfL7xk/NamUl5zFktBEtJJJ+
   b42Q9xf7a2Q7wx2unxXULrBBRi5E8PFDOJjsQBYeWLV1bOfv6cgRTXbP8
   dDU0pZFt7YeRKQwUVEE8Gsn593/PensblcUgTn6oQqFnz3fGhoFIFFvpA
   9BLDUj72i/tc5my5QZU57Py5EPENdbp1XdDOsBfbLTd9aeODCo9Y0G6za
   A==;
X-CSE-ConnectionGUID: 1tc4yb5PTMeegzMP/wVifA==
X-CSE-MsgGUID: qgepBCORRXWyi9G7gccaOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50816112"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50816112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 23:00:38 -0700
X-CSE-ConnectionGUID: Bl+y+/IKRl+vtfY4/TtRKw==
X-CSE-MsgGUID: 2tiPRa0wRya32K51C2Aqgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="174940383"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 23:00:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLFGl-000YE6-1o;
	Sat, 31 May 2025 06:00:35 +0000
Date: Sat, 31 May 2025 13:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 21/33]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb:
 gpu@14850000 (renesas,r9a09g047-mali): compatible: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202505311301.Nzzwaeqb-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 7a5992ec241c9c4fdd89466576f18848462f9991 [21/33] arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505311301.Nzzwaeqb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311301.Nzzwaeqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311301.Nzzwaeqb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: gpu@14850000 (renesas,r9a09g047-mali): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-mali', 'arm,mali-bifrost'] is too short
   	'renesas,r9a09g047-mali' is not one of ['allwinner,sun50i-h616-mali', 'amlogic,meson-g12a-mali', 'mediatek,mt8183-mali', 'mediatek,mt8183b-mali', 'mediatek,mt8186-mali', 'realtek,rtd1619-mali', 'renesas,r9a07g044-mali', 'renesas,r9a07g054-mali', 'renesas,r9a09g057-mali', 'rockchip,px30-mali', 'rockchip,rk3562-mali', 'rockchip,rk3568-mali', 'rockchip,rk3576-mali']
   	'renesas,r9a09g047-mali' is not one of ['mediatek,mt8195-mali']
   	'renesas,r9a09g047-mali' is not one of ['mediatek,mt8188-mali', 'mediatek,mt8192-mali']
   	'mediatek,mt8192-mali' was expected
   	'arm,mali-valhall-jm' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
