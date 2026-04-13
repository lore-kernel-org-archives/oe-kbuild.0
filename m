Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F0233704
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120595; cv=none; b=quxPNzNBdijMBjD0Cw0WLWnuJ7+sFQlEOARnJ1B56kpEeO6DP+OOPZjQBP9FVI0ZZdGPA1WUBJBmOlVbJE/A1xj6h5xXrrjgFK5sKe75JEg3eFQIdPKZbZuGTUHfe3SrnAI6AeBJRthk0LrnfHNHE/tBxQPR0BVm9/H392lqjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120595; c=relaxed/simple;
	bh=ta1+VucBBDpTp4mwI6mfXBFE7BQxaS15xLc2slkgPL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LnjRKaPMk5rsRRiHGZg6e40q8nW+SEle6NyB1o184sKNSc1Rr2zhgJM+7Nl24BvZgpGdarig5KH8AHOUHaKN/LPW4lTSn0OiGF13N4drxt5EMB/PtPvGG6pZYzZwgMyxnkIVqYbPp8DHLO0bYoQtlS+FNWXjEnPz4SPIedrEGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mL+8iwWY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mL+8iwWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776120593; x=1807656593;
  h=date:from:to:cc:subject:message-id;
  bh=ta1+VucBBDpTp4mwI6mfXBFE7BQxaS15xLc2slkgPL8=;
  b=mL+8iwWY2P5vkAKnRyDuI0ySqVaUAoDRSIUbBYXZBOlaTkKXrwr15pF9
   HNf6PY3b9m7MWjv0g/wqsVvWFIOotcvK0bWXBmEqa+wk93ykA5u8sAWuc
   HtXuFrfuYl4pN8VwwGLUwbhvtTi1h1wqAQqz+madQ8xvZy3w8xuWAx5s3
   Ia9Qt5tRDx+0u6u6NZgC8z9f14H/lRCxIwyRLS6pT2o2fa1AoysFBUWrt
   yaPot+xtiH3WMoILkVskARgUuLS9FxXa3vTBNga6itSmRSihQu7GlzP8y
   6+4vDnrH3Dmh64I5OJD/amVQtCbTT79CE6gWni9FEUO2vSWLImf15U7fU
   w==;
X-CSE-ConnectionGUID: 28Vva4AwSTyY9HE/H0o25g==
X-CSE-MsgGUID: CF3+U5ZuSNKptJMGdos5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76946711"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="76946711"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 15:49:53 -0700
X-CSE-ConnectionGUID: JhCtbzRnSkuRoYYoDy/L0w==
X-CSE-MsgGUID: 058aaiazSIKSDZxOooi3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="229855821"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Apr 2026 15:49:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQ6I-000000000ED-0ukj;
	Mon, 13 Apr 2026 22:49:50 +0000
Date: Tue, 14 Apr 2026 00:49:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml:55:4:
 [error] no new line character at the end of file (new-line-at-end-of-file)
Message-ID: <202604140054.K2G6zf04-lkp@intel.com>
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
TO: Dawid Glazik <dawid.glazik@linux.intel.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Dawid-Glazik/ARM-dts-aspeed-g6-move-i2c-controllers-directly-into-apb-node/20260413-201411
head:   82919687ddc68d07d411841dd7838bc754461fdb
commit: 82919687ddc68d07d411841dd7838bc754461fdb dt-bindings: i3c: Add AST2600 I3C global registers
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: openrisc-randconfig-2052-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140054.K2G6zf04-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140054.K2G6zf04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140054.K2G6zf04-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml:55:4: [error] no new line character at the end of file (new-line-at-end-of-file)

vim +55 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml

82919687ddc68d Dawid Glazik 2026-04-08  40  
82919687ddc68d Dawid Glazik 2026-04-08  41  examples:
82919687ddc68d Dawid Glazik 2026-04-08  42    - |
82919687ddc68d Dawid Glazik 2026-04-08  43      bus@1e7a0000 {
82919687ddc68d Dawid Glazik 2026-04-08  44          compatible = "simple-bus";
82919687ddc68d Dawid Glazik 2026-04-08  45          #address-cells = <1>;
82919687ddc68d Dawid Glazik 2026-04-08  46          #size-cells = <1>;
82919687ddc68d Dawid Glazik 2026-04-08  47          ranges = <0 0x1e7a0000 0x8000>;
82919687ddc68d Dawid Glazik 2026-04-08  48  
82919687ddc68d Dawid Glazik 2026-04-08  49          i3c-global@0 {
82919687ddc68d Dawid Glazik 2026-04-08  50              compatible = "aspeed,ast2600-i3c-global", "syscon";
82919687ddc68d Dawid Glazik 2026-04-08  51              reg = <0x0 0x1000>;
82919687ddc68d Dawid Glazik 2026-04-08  52              resets = <&syscon ASPEED_RESET_I3C_DMA>;
82919687ddc68d Dawid Glazik 2026-04-08  53          };
82919687ddc68d Dawid Glazik 2026-04-08  54      };
82919687ddc68d Dawid Glazik 2026-04-08 @55  ...

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
