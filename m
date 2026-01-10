Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE65239086
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 19:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072279; cv=none; b=IrxXUU7VbcZrqc9f46/wYHKKnJsc7LXB7lD42Vzcu4a5bqJHJsqg53EC2/SSL+CKGgd1qijkg6Hombg0nnd5h1rmkUIf517BeLvDIhpLs0/VNzWSvEW0DpSfo361XYQF1VSNEmYHk9nFJNPG0tZ+Zt56LTyWAGB5XgLJblcIAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072279; c=relaxed/simple;
	bh=phRU7UEEbZg1fm/ccVT8D78lSERiHI2nw9+uzMIIwoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u013b1Bnc22hue9a4f7GN3tGFir+b9qRUIxP2bP8MapmhEifxVItxkGH0UP3aRKOuBN2S1cy8O2p/Ziqv6BaE2p9rdhgps8qZtglJNi/H2zwstzM0zvCK1a7iSxMw/o7FJJvZgio14JeKW5+Y6YjOkckdGm1p8qVSXDLFlC6NG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYoWmAo1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYoWmAo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768072277; x=1799608277;
  h=date:from:to:cc:subject:message-id;
  bh=phRU7UEEbZg1fm/ccVT8D78lSERiHI2nw9+uzMIIwoY=;
  b=DYoWmAo1sXe4/fjzlCGNIZ+th75RuKLOTSkduysTEacWTjyJsGE7pg/Q
   2JGSvO6/N4Hsc10PlTfsGRITAAUGbcaVQlWvjuLbyxtC59hz5NddMMgDX
   4Y6I9iKudm0V5l5RHoM2ETR/SRgNXwC1AsK8zo9ZjfSz1qovJYvtwPEbB
   h1kOsss77SUy4P3pzb5Gc6VLrRALsU0TiEsWSBGJrjjML+0qnNJP1UI81
   0MmJf0QoTe9VuiTh3pX6jfMfUzv+HC2qdD318SyXjw2W/A7WnVDHz4qSg
   A1uhbC87cCduYl6uGMGBE3Vhw6vdLWXM2gn12nVQEFTmKfP8pmRrnvyFF
   Q==;
X-CSE-ConnectionGUID: I7veaVEoSeCpqdxIwj8XWg==
X-CSE-MsgGUID: TzZVDBxBRyeY5CMKoNMLYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="71988896"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="71988896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 11:11:17 -0800
X-CSE-ConnectionGUID: zBms/rW+SK2yegd0eh2cRg==
X-CSE-MsgGUID: f/CsBt3SQ4WS2b4HZtI4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="227060617"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2026 11:11:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veeMj-00000000937-434P;
	Sat, 10 Jan 2026 19:11:13 +0000
Date: Sun, 11 Jan 2026 03:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:for-next 21/23]
 drivers/clk/spacemit/ccu-k3.c:1485:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601110334.J7MRYCVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/spacemit/ccu-k3.c:1485:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Yixun Lan <dlan@gentoo.org>
TO: Yixun Lan <dlan@gentoo.org>

tree:   https://github.com/spacemit-com/linux for-next
head:   0552cbce4bce08087313cdb599acf6f9616de0d7
commit: e371a77255b837f5d64c9d2520f87e41ea5350b9 [21/23] clk: spacemit: k3: add the clock tree
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r112-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110334.J7MRYCVl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110334.J7MRYCVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601110334.J7MRYCVl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/spacemit/ccu-k3.c:1485:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu-k3.c:1485:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/clk/spacemit/ccu-k3.c:1486:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu-k3.c:1486:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/spacemit/ccu-k3.c:1487:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu-k3.c:1487:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/spacemit/ccu-k3.c:1487:1: sparse: sparse: bad integer constant expression
   drivers/clk/spacemit/ccu-k3.c:1487:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1485 drivers/clk/spacemit/ccu-k3.c

e371a77255b837f Yixun Lan 2025-11-02  1484  
e371a77255b837f Yixun Lan 2025-11-02 @1485  MODULE_IMPORT_NS("CLK_SPACEMIT");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
