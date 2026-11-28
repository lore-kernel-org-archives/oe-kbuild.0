Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837155;
	b=yvYYIncQB3IbgaJUkJPF5h5CGVeZqfDH8FkvQEExldn6pGKOw7bRmnGlvpwzgZBg9nSY
	 vZPljEEcop+uy+w8Tkkj4FICTZs/K5nqC3G8JMmkHSHvunE6ebiADjtFDisBzTXtsWt6n
	 JCwt8a5ZQS7Q73IjucLKILU96zaPFZ06EJC2aic2/WpcSeD0T4yKH/ZiThMLozu61PCCB
	 tSUZYWtXvtevdNogYL+N3MSI/iWU4L3pa+PCKEYHzK+9adLIQb7ry6IWYxs6lRNzpfO+b
	 w6WPBAhuerKW/EdWf5T0dckGnA3c0A56zjXCe3xyTUtys0R/MoU769Uzk1bkQDPhROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837155;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mR+bNCcp+OMgGNTSPDMaXmRrXtmoOgWOeMGrYIjz8yA=;
	b=U8Yp9UCxD/iGMtPAnBMcbHTytBos3sFaHfcMPeBUkf0Bz1HO4pkemj6ltvSrZ4YQdh+U
	 6wqpA1zT9pEgwkmSZupiZEZZDFbUetBgLSxT5UAMiMWETHU2y0Q2FRQOtRd5W0FoOZkIB
	 hxYiU3MR9q4AO+AZ5bTutcSd6+/oESZ3+fnaros7nf0I1EUFn+V8lKtUyrcbUxGfvlbnx
	 0IFTbq3IDHdLR3ZTUQMmU+ZH70iZkho14BZQM7pGFb94aIQfBwsrgyLcemZL4gUvfR0zN
	 XmKs+C4PsVqyopkBmKzUWDQO00VPbrfyU63ooYNipP2vaotmtj3mUSvz72HU+jN9VsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="A/zHNXma";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406F606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 03:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7406F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/zHNXma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795837155; x=1827373155;
  h=date:from:to:cc:subject:message-id;
  bh=dgsiiA55UWMpI6kTe60tvaH7t0wh/QIHDNNRfDBuxJI=;
  b=A/zHNXmaYesl+Gy2k5xhqeT08JeGkUKrB1SF623oLfUKF/mL6ckGN/On
   ijaiDIKzigrCYBXOZBzzpKUeyfqHJHoK81EnMVMkAs/7XGxdqZXY9IAlK
   Q+0WtgaLnPNO8h9lsKC5H+81pTRJvlXOdilOX5WN3SVLBhpDj/shXIC+8
   iNnjIoOBQX5SwEmXJvyLfjqR7FA/oprPsUgT6e+oHZTf4v1Hf25aBzfhm
   ZsiN3eBiyp3xIgkcdA771beJIcMGtWp50SyweAo7OUZYfPAtWnZ8inUay
   1Ojjmsp7ulvsLdxUrBkjJEoARZOvLzI6vQtdVfgcbLYR4jSXFXFBogp60
   Q==;
X-CSE-ConnectionGUID: uqm0Dlc9RGqZKQUHvuIMow==
X-CSE-MsgGUID: ei3Vv7GHTyGTFeMxgNLQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4738610"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4738610"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 19:39:14 -0800
X-CSE-ConnectionGUID: xlMLuZS6QayV6Qic/1DbJQ==
X-CSE-MsgGUID: MJYgGlaWTAKxMoGTrkAvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12663731"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2026 19:39:13 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX9HK-000000000VE-3Gxm;
	Sat, 28 Nov 2026 03:39:10 +0000
Date: Sat, 28 Nov 2026 04:38:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/dw-edma/dw-edma-v0-core.c:211:4-25: opportunity
 for str_write_read(dir == EDMA_DIR_WRITE)
Message-ID: <20261128043040.cQpKpTlq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Koichiro Den <den@valinux.co.jp>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c639ac6b9cf100b860408a3cf8d7eab268866cd7
commit: c9c25b2f32601409a53845b41183a29c8260f33e dmaengine: dw-edma: Add core quiesce operations
date:   4 months ago
:::::: branch date: 58 minutes ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r2104-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128043040.cQpKpTlq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c9c25b2f3260 ("dmaengine: dw-edma: Add core quiesce operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261128043040.cQpKpTlq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/dw-edma/dw-edma-v0-core.c:211:4-25: opportunity for str_write_read(dir == EDMA_DIR_WRITE)

vim +211 drivers/dma/dw-edma/dw-edma-v0-core.c

c9c25b2f326014 Koichiro Den 2026-07-21  199  
c9c25b2f326014 Koichiro Den 2026-07-21  200  static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
c9c25b2f326014 Koichiro Den 2026-07-21  201  					  enum dw_edma_dir dir)
c9c25b2f326014 Koichiro Den 2026-07-21  202  {
c9c25b2f326014 Koichiro Den 2026-07-21  203  	u32 value;
c9c25b2f326014 Koichiro Den 2026-07-21  204  	int ret;
c9c25b2f326014 Koichiro Den 2026-07-21  205  
c9c25b2f326014 Koichiro Den 2026-07-21  206  	SET_RW_32(dw, dir, engine_en, 0);
c9c25b2f326014 Koichiro Den 2026-07-21  207  	ret = read_poll_timeout(GET_RW_32, value, !(value & BIT(0)), 100,
c9c25b2f326014 Koichiro Den 2026-07-21  208  				200000, false, dw, dir, engine_en);
c9c25b2f326014 Koichiro Den 2026-07-21  209  	if (ret)
c9c25b2f326014 Koichiro Den 2026-07-21  210  		dev_warn(dw->chip->dev, "%s engine did not stop within 200ms\n",
c9c25b2f326014 Koichiro Den 2026-07-21 @211  			 dir == EDMA_DIR_WRITE ? "write" : "read");
c9c25b2f326014 Koichiro Den 2026-07-21  212  
c9c25b2f326014 Koichiro Den 2026-07-21  213  	return ret;
c9c25b2f326014 Koichiro Den 2026-07-21  214  }
c9c25b2f326014 Koichiro Den 2026-07-21  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
