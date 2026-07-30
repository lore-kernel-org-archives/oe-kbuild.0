Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A33F54D8
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409274; cv=none; b=iT4EBagDANX5u5O+jV33iVDeIrzqwABUkXJvMH4QO2cE6hgRlk6/UQ2nMO+eCiA3N6jyOzOwba5qDV+4kmer2V5M0Kui92WHOwIwShDiyTPhdAOXAU/75Xsc4/tJ6lthFC+ELdgMdn0Pot/CHzgBM1jOBqzJDpZiL3LSzoT6Pao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409274; c=relaxed/simple;
	bh=284VjdJjNRzARhpGtHQu+HJlWmtQi5aXEVThBf1NqfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a9o+jnH9Hgk2h23Z1c7O3NRgH9tt9SKK48HsRBhVzx/nbFvD4IdWXBVq8yibKGw0UH+HS4Ks9l43RPC9FHDTFoT/eCmY7MGvKS4gy+V2Sp4lFZqORQakMw886QEaZuslzjVa/mP1Sx66/9F94Wc0KTVQrP989Og29LwlfVmt7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awIXwXSc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awIXwXSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785409272; x=1816945272;
  h=date:from:to:cc:subject:message-id;
  bh=284VjdJjNRzARhpGtHQu+HJlWmtQi5aXEVThBf1NqfE=;
  b=awIXwXScM3Y+xfN/NL1WaTaxysVRsx9NOI7OqJsai8/805nFb7TRaCbF
   mKcfti+S2CloivnwIxzKannnlmc/guISdTEy8zO9IaBXTYzWanxAqWrAr
   RUQsQrhvY1U5T1BozHB3hLJcmxUGuG2FGQRFIWCVjELOiBTHH4sLNAjRI
   JHRkIcmSuKG7mGppn5J1+beFaJwokPtmxixKV5b4aY9hgws9hjhS5I/68
   iPrX+CGeaAggcAO9KxQJHa4CsFD+6cUzJPtf5MA44pZ/QJklLqE8L1Dv/
   AV0etLN4dZxq0Rhtr+MsXFjQl7Pr9wRoPbtpgMnPEsItBl1481QaGR9Mo
   Q==;
X-CSE-ConnectionGUID: zS3N/MiMSr+/P/Y3b+7Myg==
X-CSE-MsgGUID: dV3R63QfQzWeCDioIoIFKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85900156"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85900156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 04:01:11 -0700
X-CSE-ConnectionGUID: BbweZ7aGTHGW2Y1uyYpI5A==
X-CSE-MsgGUID: 0BQV7rdFTpCLTdOEMczA3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="258490125"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2026 04:01:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpOVc-00000000gSU-2eSX;
	Thu, 30 Jul 2026 11:01:06 +0000
Date: Thu, 30 Jul 2026 18:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 6630/10444]
 drivers/dma/dw-edma/dw-edma-v0-core.c:211:4-25: opportunity for
 str_write_read(dir == EDMA_DIR_WRITE)
Message-ID: <202607301807.y3QJVk4u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: c9c25b2f32601409a53845b41183a29c8260f33e [6630/10444] dmaengine: dw-edma: Add core quiesce operations
:::::: branch date: 19 hours ago
:::::: commit date: 9 days ago
config: s390-randconfig-r064-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301807.y3QJVk4u-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607301807.y3QJVk4u-lkp@intel.com/

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
