Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819B36D4E7
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763854095; cv=none; b=aNUNPoe0r+2LZY5jcrREu09zAIjtienLR46KG6Q2PB9Qb4bV7Afi++4kDEYWKQGinQ2pPx1YqzSvW6pfFuKbhApfJzymVunw2dzLNUl7eOllCeQLEPB/wFiWDgrvEGNGCeWZw0V+/Hk1GhrCIfKbl2osCS7btCC4nh8tSSpfU6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763854095; c=relaxed/simple;
	bh=ayrIz4Zfz6Zc7k++7md3/qRU+WFwfrS1RXNOZSzs2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmSvQ82K0Z0S5vCnEcoZ9V+oW4zza3/DjrsYeMjE1IQ/wcWC+XO0qAGsX0yitjS6BqUyNDHgRNiU3RLs1WxeM1pVRHbymI5mvhYkivmMrTmxcw0sGEpHWaT2sBQPBiCtXsueHfmT4Dg8/qMeF+ZO3yPqOU+/m/whD58/Z/Co+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ1ndItv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ1ndItv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763854092; x=1795390092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayrIz4Zfz6Zc7k++7md3/qRU+WFwfrS1RXNOZSzs2/c=;
  b=kQ1ndItvUccgvieSRPGBQ822H8Y1ZBDNI0d6zlbTkQpm/qmwUSrcY2cw
   PBy00e5/YU2wBFhVkLJiAz1jRHyml0JtO6QUQ7cFnWbr7RYg8nnTURR4W
   C4pNp+wuqjGVGfnvIJXSWScmJtfJzlFv/av5JqpM5z1Q3hmWtJrOyXP0X
   NkeujXvg6q/25OWxOVTMgHIrBxtgb0HlLdTtohgZfsY8b+mf+0xaZByMN
   f9ujdvWULEa1UEeafAvnlyWLuWLRw1bVmj0juKJ/ESieA9pI1pqVf2UTI
   06HovrSsX1m3R5HI+zThfOFB6F+lVNreOTRPF+li2QM1D6QQYq2qBkkon
   w==;
X-CSE-ConnectionGUID: PHOJ0bZvS+GSpoDBKEfonQ==
X-CSE-MsgGUID: BO8p10ejSGeejdbIefXrYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="91387824"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="91387824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 15:28:11 -0800
X-CSE-ConnectionGUID: 5LPzK5oeSkiTS5UZK8qHMA==
X-CSE-MsgGUID: 8Vs0lxVESsGpE+FBkDB6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192021700"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 15:28:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMx1T-0007u3-2w;
	Sat, 22 Nov 2025 23:28:07 +0000
Date: Sun, 23 Nov 2025 07:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4194/11041]
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1416
 otx2_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be
 null (see line 1388)
Message-ID: <202511230718.EHBCviEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linu Cherian <lcherian@marvell.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: d322fbd1720382a37ec4d2cf3f3eda7e59439d40 [4194/11041] octeontx2-pf: Initialize cn20k specific aura and pool contexts
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r073-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230718.EHBCviEY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511230718.EHBCviEY-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1416 otx2_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be null (see line 1388)
drivers/net/ethernet/marvell/octeontx2/nic/cn20k.c:296 cn20k_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be null (see line 267)

vim +1416 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c

d322fbd1720382 Linu Cherian      2025-10-25  1375  
d322fbd1720382 Linu Cherian      2025-10-25  1376  int otx2_aura_aq_init(struct otx2_nic *pfvf, int aura_id,
d322fbd1720382 Linu Cherian      2025-10-25  1377  		      int pool_id, int numptrs)
caa2da34fd25a3 Sunil Goutham     2020-01-27  1378  {
caa2da34fd25a3 Sunil Goutham     2020-01-27  1379  	struct npa_aq_enq_req *aq;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1380  	struct otx2_pool *pool;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1381  	int err;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1382  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1383  	pool = &pfvf->qset.pool[pool_id];
caa2da34fd25a3 Sunil Goutham     2020-01-27  1384  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1385  	/* Allocate memory for HW to update Aura count.
caa2da34fd25a3 Sunil Goutham     2020-01-27  1386  	 * Alloc one cache line, so that it fits all FC_STYPE modes.
caa2da34fd25a3 Sunil Goutham     2020-01-27  1387  	 */
caa2da34fd25a3 Sunil Goutham     2020-01-27 @1388  	if (!pool->fc_addr) {
caa2da34fd25a3 Sunil Goutham     2020-01-27  1389  		err = qmem_alloc(pfvf->dev, &pool->fc_addr, 1, OTX2_ALIGN);
caa2da34fd25a3 Sunil Goutham     2020-01-27  1390  		if (err)
caa2da34fd25a3 Sunil Goutham     2020-01-27  1391  			return err;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1392  	}
caa2da34fd25a3 Sunil Goutham     2020-01-27  1393  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1394  	/* Initialize this aura's context via AF */
caa2da34fd25a3 Sunil Goutham     2020-01-27  1395  	aq = otx2_mbox_alloc_msg_npa_aq_enq(&pfvf->mbox);
caa2da34fd25a3 Sunil Goutham     2020-01-27  1396  	if (!aq) {
caa2da34fd25a3 Sunil Goutham     2020-01-27  1397  		/* Shared mbox memory buffer is full, flush it and retry */
caa2da34fd25a3 Sunil Goutham     2020-01-27  1398  		err = otx2_sync_mbox_msg(&pfvf->mbox);
caa2da34fd25a3 Sunil Goutham     2020-01-27  1399  		if (err)
caa2da34fd25a3 Sunil Goutham     2020-01-27  1400  			return err;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1401  		aq = otx2_mbox_alloc_msg_npa_aq_enq(&pfvf->mbox);
caa2da34fd25a3 Sunil Goutham     2020-01-27  1402  		if (!aq)
caa2da34fd25a3 Sunil Goutham     2020-01-27  1403  			return -ENOMEM;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1404  	}
caa2da34fd25a3 Sunil Goutham     2020-01-27  1405  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1406  	aq->aura_id = aura_id;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1407  	/* Will be filled by AF with correct pool context address */
caa2da34fd25a3 Sunil Goutham     2020-01-27  1408  	aq->aura.pool_addr = pool_id;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1409  	aq->aura.pool_caching = 1;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1410  	aq->aura.shift = ilog2(numptrs) - 8;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1411  	aq->aura.count = numptrs;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1412  	aq->aura.limit = numptrs;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1413  	aq->aura.avg_level = 255;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1414  	aq->aura.ena = 1;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1415  	aq->aura.fc_ena = 1;
caa2da34fd25a3 Sunil Goutham     2020-01-27 @1416  	aq->aura.fc_addr = pool->fc_addr->iova;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1417  	aq->aura.fc_hyst_bits = 0; /* Store count on all updates */
caa2da34fd25a3 Sunil Goutham     2020-01-27  1418  
75f36270990c78 Geetha sowjanya   2020-03-02  1419  	/* Enable backpressure for RQ aura */
4c85e57575fb9e Hariprasad Kelam  2021-07-25  1420  	if (aura_id < pfvf->hw.rqpool_cnt && !is_otx2_lbkvf(pfvf->pdev)) {
75f36270990c78 Geetha sowjanya   2020-03-02  1421  		aq->aura.bp_ena = 0;
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1422  		/* If NIX1 LF is attached then specify NIX1_RX.
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1423  		 *
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1424  		 * Below NPA_AURA_S[BP_ENA] is set according to the
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1425  		 * NPA_BPINTF_E enumeration given as:
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1426  		 * 0x0 + a*0x1 where 'a' is 0 for NIX0_RX and 1 for NIX1_RX so
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1427  		 * NIX0_RX is 0x0 + 0*0x1 = 0
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1428  		 * NIX1_RX is 0x0 + 1*0x1 = 1
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1429  		 * But in HRM it is given that
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1430  		 * "NPA_AURA_S[BP_ENA](w1[33:32]) - Enable aura backpressure to
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1431  		 * NIX-RX based on [BP] level. One bit per NIX-RX; index
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1432  		 * enumerated by NPA_BPINTF_E."
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1433  		 */
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1434  		if (pfvf->nix_blkaddr == BLKADDR_NIX1)
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1435  			aq->aura.bp_ena = 1;
8e67558177f8f5 Hariprasad Kelam  2022-02-09  1436  #ifdef CONFIG_DCB
8e67558177f8f5 Hariprasad Kelam  2022-02-09  1437  		aq->aura.nix0_bpid = pfvf->bpid[pfvf->queue_to_pfc_map[aura_id]];
8e67558177f8f5 Hariprasad Kelam  2022-02-09  1438  #else
75f36270990c78 Geetha sowjanya   2020-03-02  1439  		aq->aura.nix0_bpid = pfvf->bpid[0];
8e67558177f8f5 Hariprasad Kelam  2022-02-09  1440  #endif
e8fb4df1f5d84b Subbaraya Sundeep 2021-08-22  1441  
75f36270990c78 Geetha sowjanya   2020-03-02  1442  		/* Set backpressure level for RQ's Aura */
75f36270990c78 Geetha sowjanya   2020-03-02  1443  		aq->aura.bp = RQ_BP_LVL_AURA;
75f36270990c78 Geetha sowjanya   2020-03-02  1444  	}
75f36270990c78 Geetha sowjanya   2020-03-02  1445  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1446  	/* Fill AQ info */
caa2da34fd25a3 Sunil Goutham     2020-01-27  1447  	aq->ctype = NPA_AQ_CTYPE_AURA;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1448  	aq->op = NPA_AQ_INSTOP_INIT;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1449  
caa2da34fd25a3 Sunil Goutham     2020-01-27  1450  	return 0;
caa2da34fd25a3 Sunil Goutham     2020-01-27  1451  }
caa2da34fd25a3 Sunil Goutham     2020-01-27  1452  

:::::: The code at line 1416 was first introduced by commit
:::::: caa2da34fd25a37e9fd43343b6966fb9d730a6d5 octeontx2-pf: Initialize and config queues

:::::: TO: Sunil Goutham <sgoutham@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
