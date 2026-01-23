Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E24A1917CD
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206711; cv=none; b=rbtTjEfck1469raYoujOnVGHOgPgCFAYdxA+6NvW+XCthF74HByHvQWUzcwm4vQSAHZGXkjLV/EImavPHcJfzTHg4Xl6EzDIZz1Q8QFGkthGa1/HkNQy+egzO+hw4nlBp2/F8Z6Nx9KjjNKtFs486NVGeZ8mmrSKef99yTQl1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206711; c=relaxed/simple;
	bh=fQqpO+FeCog0SqhsJayJ43fxBcRZJmJ+wNDwP/x/Bx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M2rr7ENzW62xt7YYTmkdwwxtccwym+86grPVIfMKA4YVMT3RZkwjkRh9lZk+2p6Am3LPsk65M3YSek8++xlONgpCqyieK0N7uuvZTWNSw++H6Jn7RDr4Zjz4eg69CvBxKa7I9Nobc/pSBMz0NPYwbECMH8HMpQ1kAGZwJol0cyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nITMFkpX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nITMFkpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769206710; x=1800742710;
  h=date:from:to:cc:subject:message-id;
  bh=fQqpO+FeCog0SqhsJayJ43fxBcRZJmJ+wNDwP/x/Bx4=;
  b=nITMFkpXukfdv29uHD11Fhi7Eum+5b5kb+bOMpeEmlWIdjClLEvbmcV7
   lnwj163uTgXclk7rv550bO/6KVq8YrBIMkxwTX0/OpXqdj57AQxjSdTqq
   R78HUl673wlLnDTDt3y14P29XCQzCsVIkJYlod/BBmtPkNhfqQHpuYrku
   reeQat7VmngZF81uNu3pVKuy885XvHG3aUyN9UsKyshmpcZ3776Sohg3n
   vP1N5ZIZ7rMSh6mYKiRvLnLFesOeAtQRUAY2B1ukC3DIz2HaI/3nN+8zT
   VV24Ej4G0xuWmIACX5fY8qwtYoe/9d6MzgOHHwTx04B79lBTq9DQAYTpG
   Q==;
X-CSE-ConnectionGUID: El4dHkE7QTe6Ovne8DUzrw==
X-CSE-MsgGUID: 2pTRaeneS/+4TxzrC715bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69660511"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="69660511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:18:29 -0800
X-CSE-ConnectionGUID: EovW1pp8TdGDWnZ28Etl5g==
X-CSE-MsgGUID: jEFl/GrzTvCOqwJeXnlIsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207046404"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 14:18:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjPU2-00000000UWm-15Le;
	Fri, 23 Jan 2026 22:18:26 +0000
Date: Sat, 24 Jan 2026 06:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [baylibre-clk-meson:clk-meson-next 5/11]
 drivers/clk/meson/t7-peripherals.c:1268:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601240612.tclKAkms-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/meson/t7-peripherals.c:1268:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jian Hu <jian.hu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>

tree:   https://github.com/baylibre/clk-meson.git clk-meson-next
head:   2fe1ef40b58c2256f4682594f48bfbd584501ec5
commit: fab4d651b592b3ebc836e410ae27b8b832a5bff2 [5/11] clk: meson: t7: add t7 clock peripherals controller driver
:::::: branch date: 3 weeks ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r121-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240612.tclKAkms-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240612.tclKAkms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240612.tclKAkms-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/t7-peripherals.c:1268:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-peripherals.c:1268:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-peripherals.c:1269:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-peripherals.c:1269:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-peripherals.c:1270:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-peripherals.c:1270:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-peripherals.c:1270:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-peripherals.c:1270:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-peripherals.c:1271:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-peripherals.c:1271:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +1268 drivers/clk/meson/t7-peripherals.c

fab4d651b592b3 Jian Hu 2025-12-12  1267  
fab4d651b592b3 Jian Hu 2025-12-12 @1268  MODULE_DESCRIPTION("Amlogic T7 Peripherals Clock Controller driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
