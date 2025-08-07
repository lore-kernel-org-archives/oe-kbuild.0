Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8533086
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754577227; cv=none; b=HqaP/9APfrY9ygJ2qXJSy3RusAggU266JEzUsrUwlt1x3j5KUh7IaIAy+NpjR7BbbhcZQaeVqXA3H90fgvbQqZhCTVrjToLIwbkp0OTw/8MBT7DE/5SdoqCNfk+hn29ecwSkCHct7fEekiTbqmp+lU2E0oe9mM+4/co9fxLGweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754577227; c=relaxed/simple;
	bh=ERbxyw0ew6f5cHPJu2wYjOWARb/gwRs8f+Hx2D/EBys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+2DjkFRaEAXAQKkJs7JmBuSeYDbi2FRn/W4E49LiO+nMyPpg9/d4KXjM8vo/Ib3GQtZw+rT3B7cHzIVgxMOhcmWif74adiFsjv9CibdacMs06R4uD2pU0rJyiwN+TMeqRia6uwbpn/s/gnKjrwLMiexRVrkCnvDCk9hS7Fl+1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax9P1l1p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax9P1l1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754577226; x=1786113226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERbxyw0ew6f5cHPJu2wYjOWARb/gwRs8f+Hx2D/EBys=;
  b=Ax9P1l1plBKbW3LID4LfvK9O8CYZ3Ru3nnH7vykEp3hW9koWjP1swgE7
   VgNA15FmpQefK6PtvDxzdjc1mbVw4s0L47Xe63/E7hkU9+81pxOjsBQzA
   zOnJeccdg/P6HaPm681e9C28eqpAzRMQRHOIirAgq1hUc+b/jcgU8aV7t
   BQPsCTRQTDERWewJETtEdZBCYBOtV0zg85Ydjr49a/VfZ7ClTizQA9zN7
   ey6c9TaMrgCsatyXHuTeB21io+ItRdqXS8orximkPTRimHDEGPCM7bzqa
   LSVi4tQ4UL9shg4hQ9ADesaDT8ErU7FZdQNZ/SdvhdwFKCI2xuIOsWrOO
   Q==;
X-CSE-ConnectionGUID: 2sRUnP1aQ4mBEs/a39lfBQ==
X-CSE-MsgGUID: jLqJ+LlNRQ+kY5IuM+pvww==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74492095"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74492095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:33:45 -0700
X-CSE-ConnectionGUID: jyAfHoFhSoy2pHxaKgiKCA==
X-CSE-MsgGUID: 6e8moDp5QXam4dXdVmK7kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202239542"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 07:33:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1gb-0002t0-1b;
	Thu, 07 Aug 2025 14:33:41 +0000
Date: Thu, 7 Aug 2025 22:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 293/801]
 Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml:
 atmel,smc-page-mode: missing type definition
Message-ID: <202508072239.yGGVzc10-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 79b777b41e2cc4eb3adfb16ed44b175c51d0dbbb [293/801] dt-bindings: memory-controllers: Convert atmel,ebi to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072239.yGGVzc10-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072239.yGGVzc10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072239.yGGVzc10-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
