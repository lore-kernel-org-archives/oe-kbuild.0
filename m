Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6B274FE3
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790487763; cv=none; b=d9naMW86JcRUcALSr9J8dv8AZcc9NT4kpBT5n/qxYCjWNzWv6ylc03pTxyyItsSA6ph9L4w1PwZq6WNrwh2ykdoiYZQe/8vBvd5VJy8giQRMTx/Ihr37Fek5a4uoJewOD4q4ktfAi0N6PNOFA2mTJXHKqP6BYHw/D+YixJTLZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790487763; c=relaxed/simple;
	bh=bKtbGhykzwK3mnpoxQIqbnvQk/84ucWNSys5SlJ6ML8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUkyP3K8dnZ2eohpHAOyzBrgwXgg/al66aLnlN0EXoWrA80b+/KbLFLfo696hq1JWPZCxIJFYgCaQ/xCLzpSxqTSKDsC+a88OXipIllFq1cmHlaTI9tOmoUrctOdrY9DuhCO9OILDo7BMojgabGAQLtMVYzZkAElzN0dTzfX0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtgdbmB0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtgdbmB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790487761; x=1822023761;
  h=date:from:to:cc:subject:message-id;
  bh=bKtbGhykzwK3mnpoxQIqbnvQk/84ucWNSys5SlJ6ML8=;
  b=NtgdbmB0I2FvNlf/nWSrolDHMci6Ij6cquRkHEhShWDfYJ7ixptIh1h5
   62Da2M2O7sbn1yO73VyweXQ9qTkv3D/ID3LLYpkBFZKuqNyzU0MOJj0G4
   srfGrxJ53+1DRLajNR35Sh4Q3yIkjW/bRGwQURxCD49qN/b+wWvSmYk19
   wHuqiOd3BQze/yldw2675j2E7tLjioGehqNSITxcd/isy7WW/3KwWSDLV
   IzqkuUKtRypH6O/VBb1Ba+WORaZSIcEif3hovai7OtQcz11ylXL86iMMq
   kcN4krcuDSaMlsjOyebfeHKwVn9w/nZA81s1TCYFIRg8D24gxLN3lvmLv
   A==;
X-CSE-ConnectionGUID: JFUk1RAnS2qGmcAtlUwuXA==
X-CSE-MsgGUID: UugvOS6DR5SDjsONwY4OoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93709526"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="93709526"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:42:40 -0700
X-CSE-ConnectionGUID: oQ/pQ777SSut7c5KQcK/IQ==
X-CSE-MsgGUID: hkDxJEvxR3eClTFeebMSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="278538102"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Sep 2026 22:42:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAhek-000000000Rz-35yG;
	Sun, 27 Sep 2026 05:42:34 +0000
Date: Sun, 27 Sep 2026 07:41:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5319/10910]
 drivers/net/ethernet/airoha/airoha_eth.c:513 airoha_fe_lro_rxq_enable() warn:
 subtract is higher precedence than shift
Message-ID: <202609270710.uw49PknB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: a952507ca094d4e77bea78b462a0482d3c546c9e [5319/10910] net: airoha: add LRO offload support
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: mips-randconfig-r2200-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270710.uw49PknB-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609270710.uw49PknB-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:513 airoha_fe_lro_rxq_enable() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:513 airoha_fe_lro_rxq_enable() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:513 airoha_fe_lro_rxq_enable() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:513 airoha_fe_lro_rxq_enable() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/net/ethernet/airoha/airoha_eth.c:2304 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2304 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2304 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2304 airoha_enable_gdm2_loopback() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2862 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2862 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2862 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift
drivers/net/ethernet/airoha/airoha_eth.c:2862 airoha_qdma_set_chan_tx_sched() warn: subtract is higher precedence than shift

vim +513 drivers/net/ethernet/airoha/airoha_eth.c

23020f04932701d drivers/net/ethernet/mediatek/airoha_eth.c Lorenzo Bianconi 2024-07-12  495  
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  496  static void airoha_fe_lro_rxq_enable(struct airoha_eth *eth, int qdma_id,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  497  				     int lro_queue_index, int qid,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  498  				     int buf_size)
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  499  {
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  500  	int id = qdma_id + 1;
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  501  
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  502  	airoha_fe_rmw(eth, REG_CDM_LRO_LIMIT(id),
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  503  		      CDM_LRO_AGG_NUM_MASK | CDM_LRO_AGG_SIZE_MASK,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  504  		      FIELD_PREP(CDM_LRO_AGG_SIZE_MASK, buf_size) |
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  505  		      FIELD_PREP(CDM_LRO_AGG_NUM_MASK,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  506  				 AIROHA_RXQ_LRO_MAX_AGG_COUNT));
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  507  	airoha_fe_rmw(eth, REG_CDM_LRO_AGE_TIME(id),
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  508  		      CDM_LRO_AGE_TIME_MASK | CDM_LRO_AGG_TIME_MASK,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  509  		      FIELD_PREP(CDM_LRO_AGE_TIME_MASK,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  510  				 AIROHA_RXQ_LRO_MAX_AGE_TIME) |
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  511  		      FIELD_PREP(CDM_LRO_AGG_TIME_MASK,
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  512  				 AIROHA_RXQ_LRO_MAX_AGG_TIME));
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09 @513  	airoha_fe_rmw(eth, REG_CDM_LRO_RXQ(id, lro_queue_index),
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  514  		      LRO_RXQ_MASK(lro_queue_index),
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  515  		      __field_prep(LRO_RXQ_MASK(lro_queue_index), qid));
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  516  	airoha_fe_set(eth, REG_CDM_LRO_EN(id), BIT(lro_queue_index));
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  517  }
a952507ca094d4e drivers/net/ethernet/airoha/airoha_eth.c   Lorenzo Bianconi 2026-09-09  518  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
