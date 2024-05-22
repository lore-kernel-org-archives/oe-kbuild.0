Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0352F7A
	for <oe-kbuild@lists.linux.dev>; Wed, 22 May 2024 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369914; cv=none; b=EuUbUSH3YoT6Dg5o3gQSZjR4qGs2utQVl5jxvcqUjJhMbydBfHtstFeaAGHLw1ceEfw9DHvdhYwTf9di4zHuoebjOAdQZ6YaMJbq5dDg8c5GIH/1rtetK6ldo65fKsA+Mx7MdrqFWgpshRHZtrWYWg+TsLLjlqsWE4C3AkOYVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369914; c=relaxed/simple;
	bh=gWEfM2dyl5AMB636vqSbuu7TjWwXbvVBBgXyj5dBfvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+g+Yb139V/FWhs8Ot6QAm3CuWS86DBxUAVJd1pb+Z8YLXrRWkBDY14ehWtGIAxsWXmOd1xAbU8TCRtp44+lwJyVaZec3xxpRb5EVJDJJ8846x7eEmAqRtJatXYa66X8j9UFLC39vdXuKjcYCp3c7LRklZmIIIW9fKpKLVoEflk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBwSuvD1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBwSuvD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716369912; x=1747905912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWEfM2dyl5AMB636vqSbuu7TjWwXbvVBBgXyj5dBfvA=;
  b=jBwSuvD1lyUViBNqyhEv1usJzqdpH6ag/2GBZbfldZCWVWQIUNxfV0yd
   HYqZFNmsyhDbQkX0KuABn2RAvxk6zGX5ROkFaxSIvCJKiNzSehVMUeUZl
   5bN637OE4crlpryVwf1SP1Uw3803qw9i9QLY7G2qEAYAqZPneOWY/gemF
   pdiel36+8mfGugjMWP0d/yE8Ube6v0UNfIknTfNLYHVjBBjagdcISSt1x
   T+KZJyQZ1vJk196VmGUP2G0tHL6fQhZP0bmXx2e7SKgBT7jlQ7yFFSI/3
   4HfBfcGTmNWuwZVOmMv8mtdkhefXqPNnKXPOS9O7l/8ZCXoNWzggNyp9l
   Q==;
X-CSE-ConnectionGUID: BVACNOgYTTekzSOcl/4Peg==
X-CSE-MsgGUID: Xv+7suDfR36Q3wc/HYY49g==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12723335"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12723335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 02:25:11 -0700
X-CSE-ConnectionGUID: jH5Xu/+bRWOjbnE9i7/i8g==
X-CSE-MsgGUID: pePqV2w6SSeqEHG2C1c9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33645436"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2024 02:25:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9iDb-0001E5-21;
	Wed, 22 May 2024 09:25:07 +0000
Date: Wed, 22 May 2024 17:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [alobakin:idpf-libie-new 12/63]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:1385 idpf_txq_group_alloc()
 error: uninitialized symbol 'stashes'.
Message-ID: <202405221707.iiMY3YCG-lkp@intel.com>
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
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   e0f15f92530432c10486607c676825d5dd2d35f0
commit: 9793c512a876b33ec415998510e36d49398bb87e [12/63] idpf: split &idpf_queue into 4 strictly-typed queue structures
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240522 (https://download.01.org/0day-ci/archive/20240522/202405221707.iiMY3YCG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405221707.iiMY3YCG-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_txrx.c:1385 idpf_txq_group_alloc() error: uninitialized symbol 'stashes'.

vim +/stashes +1385 drivers/net/ethernet/intel/idpf/idpf_txrx.c

1c325aac10a82f Alan Brady        2023-08-07  1318  
1c325aac10a82f Alan Brady        2023-08-07  1319  /**
1c325aac10a82f Alan Brady        2023-08-07  1320   * idpf_txq_group_alloc - Allocate all txq group resources
1c325aac10a82f Alan Brady        2023-08-07  1321   * @vport: vport to allocate txq groups for
1c325aac10a82f Alan Brady        2023-08-07  1322   * @num_txq: number of txqs to allocate for each group
1c325aac10a82f Alan Brady        2023-08-07  1323   *
1c325aac10a82f Alan Brady        2023-08-07  1324   * Returns 0 on success, negative on failure
1c325aac10a82f Alan Brady        2023-08-07  1325   */
1c325aac10a82f Alan Brady        2023-08-07  1326  static int idpf_txq_group_alloc(struct idpf_vport *vport, u16 num_txq)
1c325aac10a82f Alan Brady        2023-08-07  1327  {
9793c512a876b3 Alexander Lobakin 2023-11-29  1328  	bool split, flow_sch_en;
9793c512a876b3 Alexander Lobakin 2023-11-29  1329  	int i;
1c325aac10a82f Alan Brady        2023-08-07  1330  
1c325aac10a82f Alan Brady        2023-08-07  1331  	vport->txq_grps = kcalloc(vport->num_txq_grp,
1c325aac10a82f Alan Brady        2023-08-07  1332  				  sizeof(*vport->txq_grps), GFP_KERNEL);
1c325aac10a82f Alan Brady        2023-08-07  1333  	if (!vport->txq_grps)
1c325aac10a82f Alan Brady        2023-08-07  1334  		return -ENOMEM;
1c325aac10a82f Alan Brady        2023-08-07  1335  
9793c512a876b3 Alexander Lobakin 2023-11-29  1336  	split = idpf_is_queue_model_split(vport->txq_model);
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1337  	flow_sch_en = !idpf_is_cap_ena(vport->adapter, IDPF_OTHER_CAPS,
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1338  				       VIRTCHNL2_CAP_SPLITQ_QSCHED);
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1339  
1c325aac10a82f Alan Brady        2023-08-07  1340  	for (i = 0; i < vport->num_txq_grp; i++) {
1c325aac10a82f Alan Brady        2023-08-07  1341  		struct idpf_txq_group *tx_qgrp = &vport->txq_grps[i];
1c325aac10a82f Alan Brady        2023-08-07  1342  		struct idpf_adapter *adapter = vport->adapter;
9793c512a876b3 Alexander Lobakin 2023-11-29  1343  		struct idpf_txq_stash *stashes;
1c325aac10a82f Alan Brady        2023-08-07  1344  		int j;
1c325aac10a82f Alan Brady        2023-08-07  1345  
1c325aac10a82f Alan Brady        2023-08-07  1346  		tx_qgrp->vport = vport;
1c325aac10a82f Alan Brady        2023-08-07  1347  		tx_qgrp->num_txq = num_txq;
1c325aac10a82f Alan Brady        2023-08-07  1348  
1c325aac10a82f Alan Brady        2023-08-07  1349  		for (j = 0; j < tx_qgrp->num_txq; j++) {
1c325aac10a82f Alan Brady        2023-08-07  1350  			tx_qgrp->txqs[j] = kzalloc(sizeof(*tx_qgrp->txqs[j]),
1c325aac10a82f Alan Brady        2023-08-07  1351  						   GFP_KERNEL);
9793c512a876b3 Alexander Lobakin 2023-11-29  1352  			if (!tx_qgrp->txqs[j])
1c325aac10a82f Alan Brady        2023-08-07  1353  				goto err_alloc;
1c325aac10a82f Alan Brady        2023-08-07  1354  		}
9793c512a876b3 Alexander Lobakin 2023-11-29  1355  
9793c512a876b3 Alexander Lobakin 2023-11-29  1356  		if (split && flow_sch_en) {
9793c512a876b3 Alexander Lobakin 2023-11-29  1357  			stashes = kcalloc(num_txq, sizeof(*stashes),
9793c512a876b3 Alexander Lobakin 2023-11-29  1358  					  GFP_KERNEL);
9793c512a876b3 Alexander Lobakin 2023-11-29  1359  			if (!stashes)
9793c512a876b3 Alexander Lobakin 2023-11-29  1360  				goto err_alloc;
9793c512a876b3 Alexander Lobakin 2023-11-29  1361  
9793c512a876b3 Alexander Lobakin 2023-11-29  1362  			tx_qgrp->stashes = stashes;
1c325aac10a82f Alan Brady        2023-08-07  1363  		}
1c325aac10a82f Alan Brady        2023-08-07  1364  
1c325aac10a82f Alan Brady        2023-08-07  1365  		for (j = 0; j < tx_qgrp->num_txq; j++) {
9793c512a876b3 Alexander Lobakin 2023-11-29  1366  			struct idpf_tx_queue *q = tx_qgrp->txqs[j];
1c325aac10a82f Alan Brady        2023-08-07  1367  
1c325aac10a82f Alan Brady        2023-08-07  1368  			q->dev = &adapter->pdev->dev;
1c325aac10a82f Alan Brady        2023-08-07  1369  			q->desc_count = vport->txq_desc_count;
1c325aac10a82f Alan Brady        2023-08-07  1370  			q->tx_max_bufs = idpf_get_max_tx_bufs(adapter);
1c325aac10a82f Alan Brady        2023-08-07  1371  			q->tx_min_pkt_len = idpf_get_min_tx_pkt_len(adapter);
9793c512a876b3 Alexander Lobakin 2023-11-29  1372  			q->netdev = vport->netdev;
1c325aac10a82f Alan Brady        2023-08-07  1373  			q->txq_grp = tx_qgrp;
1c325aac10a82f Alan Brady        2023-08-07  1374  
9793c512a876b3 Alexander Lobakin 2023-11-29  1375  			if (!split) {
9793c512a876b3 Alexander Lobakin 2023-11-29  1376  				q->clean_budget = vport->compln_clean_budget;
9793c512a876b3 Alexander Lobakin 2023-11-29  1377  				idpf_queue_assign(CRC_EN, q,
9793c512a876b3 Alexander Lobakin 2023-11-29  1378  						  vport->crc_enable);
1c325aac10a82f Alan Brady        2023-08-07  1379  			}
1c325aac10a82f Alan Brady        2023-08-07  1380  
9793c512a876b3 Alexander Lobakin 2023-11-29  1381  			if (!flow_sch_en)
9793c512a876b3 Alexander Lobakin 2023-11-29  1382  				continue;
9793c512a876b3 Alexander Lobakin 2023-11-29  1383  
9793c512a876b3 Alexander Lobakin 2023-11-29  1384  			if (split) {
9793c512a876b3 Alexander Lobakin 2023-11-29 @1385  				q->stash = &stashes[j];
9793c512a876b3 Alexander Lobakin 2023-11-29  1386  				hash_init(q->stash->sched_buf_hash);
9793c512a876b3 Alexander Lobakin 2023-11-29  1387  			}
9793c512a876b3 Alexander Lobakin 2023-11-29  1388  
9793c512a876b3 Alexander Lobakin 2023-11-29  1389  			idpf_queue_set(FLOW_SCH_EN, q);
9793c512a876b3 Alexander Lobakin 2023-11-29  1390  		}
9793c512a876b3 Alexander Lobakin 2023-11-29  1391  
9793c512a876b3 Alexander Lobakin 2023-11-29  1392  		if (!split)
1c325aac10a82f Alan Brady        2023-08-07  1393  			continue;
1c325aac10a82f Alan Brady        2023-08-07  1394  
1c325aac10a82f Alan Brady        2023-08-07  1395  		tx_qgrp->complq = kcalloc(IDPF_COMPLQ_PER_GROUP,
1c325aac10a82f Alan Brady        2023-08-07  1396  					  sizeof(*tx_qgrp->complq),
1c325aac10a82f Alan Brady        2023-08-07  1397  					  GFP_KERNEL);
9793c512a876b3 Alexander Lobakin 2023-11-29  1398  		if (!tx_qgrp->complq)
1c325aac10a82f Alan Brady        2023-08-07  1399  			goto err_alloc;
1c325aac10a82f Alan Brady        2023-08-07  1400  
1c325aac10a82f Alan Brady        2023-08-07  1401  		tx_qgrp->complq->desc_count = vport->complq_desc_count;
1c325aac10a82f Alan Brady        2023-08-07  1402  		tx_qgrp->complq->txq_grp = tx_qgrp;
9793c512a876b3 Alexander Lobakin 2023-11-29  1403  		tx_qgrp->complq->netdev = vport->netdev;
9793c512a876b3 Alexander Lobakin 2023-11-29  1404  		tx_qgrp->complq->clean_budget = vport->compln_clean_budget;
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1405  
d38b4d0d95bc0c Michal Kubiak     2023-10-23  1406  		if (flow_sch_en)
9793c512a876b3 Alexander Lobakin 2023-11-29  1407  			idpf_queue_set(FLOW_SCH_EN, tx_qgrp->complq);
1c325aac10a82f Alan Brady        2023-08-07  1408  	}
1c325aac10a82f Alan Brady        2023-08-07  1409  
1c325aac10a82f Alan Brady        2023-08-07  1410  	return 0;
1c325aac10a82f Alan Brady        2023-08-07  1411  
1c325aac10a82f Alan Brady        2023-08-07  1412  err_alloc:
1c325aac10a82f Alan Brady        2023-08-07  1413  	idpf_txq_group_rel(vport);
1c325aac10a82f Alan Brady        2023-08-07  1414  
9793c512a876b3 Alexander Lobakin 2023-11-29  1415  	return -ENOMEM;
1c325aac10a82f Alan Brady        2023-08-07  1416  }
1c325aac10a82f Alan Brady        2023-08-07  1417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
