Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5A2AF1B
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717168; cv=none; b=Saujzxaw4eeNlU9geP9PPWCv+0ifyDO4CJXt9RaFs8I0zG5VOhi6Sje62M8dZ9ZQA2B8riVSK9fdBWsWGpAVcBxYJrUPDANqXqMXLFa+NkWAkyd9YhHFWioJE2hNT03NS1iWnIyh3qOLZvspus740RhJ/g+TQwDxE2vtNPVcOsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717168; c=relaxed/simple;
	bh=IrgOao0I5lpME4Y+LK3u2jkaQRmxhrO2YJchBcDyL4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9vjSXoYhVCo1NtJbGE1gCc9uObJgN3Wo3lCMBx+F8TUrYO623OlRYKrdCo8qoEK+8PfTxWYxz2AYCRwcoO4TFMziyo1HOGGjcXIzajAWtprgZjZv+X/9+6klpSVnwFAxYB6egw66sSVC+PpNkj6wSzf+5xG0ac6CkewvnU/OCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUJyVVd+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUJyVVd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717167; x=1765253167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrgOao0I5lpME4Y+LK3u2jkaQRmxhrO2YJchBcDyL4U=;
  b=WUJyVVd+jrxmkWsJLVRm4ksm2dxV5HTCfG9RAtaoZ+QcHDfufXrVeeTP
   FjC5Y3poyyFF8tCh5WKJNVd6edqSWSrYhfuvejqPfEN1sBlkoSQNBzLkG
   0ibP8wT9aovLw/wQmOzorwVJJ2nDVmXcrGB+9WSahVLbnOp1bf0AJ/8Ir
   n+KNX7wiFmkf7WeVErXHk/6gRfKsyMUdlxXHel7cKqgD1GCi7Y8B8wb+9
   dkN22pV19lDvKm+IwAgv2EVnXFQA/ooYNX9f42+Unw9Jrz5PDIxmM8g1Y
   uHJn04+uhZuxHImOgXC9RpDA/yPCst9y10TmOZXqZSJYkMN7eCh7II89m
   A==;
X-CSE-ConnectionGUID: pKlCSS5fSnqWMrzvZmSruA==
X-CSE-MsgGUID: yeFVSLueT/O8c6xIUa/g3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="59402284"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="59402284"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:06:06 -0800
X-CSE-ConnectionGUID: K3sG4QieSGW45B1VWyvQrA==
X-CSE-MsgGUID: zPaBdj6IQ4er3ymuugL1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99987597"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2024 20:06:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV22-0003mv-1A;
	Mon, 09 Dec 2024 04:06:02 +0000
Date: Mon, 9 Dec 2024 12:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_txrx.c:1385
 idpf_txq_group_alloc() error: uninitialized symbol 'stashes'.
Message-ID: <202412071114.2bCcCFa2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: e4891e4687c8dd136d80d6c1b857a02931ed6fc8 idpf: split &idpf_queue into 4 strictly-typed queue structures
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r072-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071114.2bCcCFa2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071114.2bCcCFa2-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_txrx.c:1385 idpf_txq_group_alloc() error: uninitialized symbol 'stashes'.

vim +/stashes +1385 drivers/net/ethernet/intel/idpf/idpf_txrx.c

1c325aac10a82f1 Alan Brady        2023-08-07  1318  
1c325aac10a82f1 Alan Brady        2023-08-07  1319  /**
1c325aac10a82f1 Alan Brady        2023-08-07  1320   * idpf_txq_group_alloc - Allocate all txq group resources
1c325aac10a82f1 Alan Brady        2023-08-07  1321   * @vport: vport to allocate txq groups for
1c325aac10a82f1 Alan Brady        2023-08-07  1322   * @num_txq: number of txqs to allocate for each group
1c325aac10a82f1 Alan Brady        2023-08-07  1323   *
1c325aac10a82f1 Alan Brady        2023-08-07  1324   * Returns 0 on success, negative on failure
1c325aac10a82f1 Alan Brady        2023-08-07  1325   */
1c325aac10a82f1 Alan Brady        2023-08-07  1326  static int idpf_txq_group_alloc(struct idpf_vport *vport, u16 num_txq)
1c325aac10a82f1 Alan Brady        2023-08-07  1327  {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1328  	bool split, flow_sch_en;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1329  	int i;
1c325aac10a82f1 Alan Brady        2023-08-07  1330  
1c325aac10a82f1 Alan Brady        2023-08-07  1331  	vport->txq_grps = kcalloc(vport->num_txq_grp,
1c325aac10a82f1 Alan Brady        2023-08-07  1332  				  sizeof(*vport->txq_grps), GFP_KERNEL);
1c325aac10a82f1 Alan Brady        2023-08-07  1333  	if (!vport->txq_grps)
1c325aac10a82f1 Alan Brady        2023-08-07  1334  		return -ENOMEM;
1c325aac10a82f1 Alan Brady        2023-08-07  1335  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1336  	split = idpf_is_queue_model_split(vport->txq_model);
d38b4d0d95bc0c7 Michal Kubiak     2023-10-23  1337  	flow_sch_en = !idpf_is_cap_ena(vport->adapter, IDPF_OTHER_CAPS,
d38b4d0d95bc0c7 Michal Kubiak     2023-10-23  1338  				       VIRTCHNL2_CAP_SPLITQ_QSCHED);
d38b4d0d95bc0c7 Michal Kubiak     2023-10-23  1339  
1c325aac10a82f1 Alan Brady        2023-08-07  1340  	for (i = 0; i < vport->num_txq_grp; i++) {
1c325aac10a82f1 Alan Brady        2023-08-07  1341  		struct idpf_txq_group *tx_qgrp = &vport->txq_grps[i];
1c325aac10a82f1 Alan Brady        2023-08-07  1342  		struct idpf_adapter *adapter = vport->adapter;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1343  		struct idpf_txq_stash *stashes;
1c325aac10a82f1 Alan Brady        2023-08-07  1344  		int j;
1c325aac10a82f1 Alan Brady        2023-08-07  1345  
1c325aac10a82f1 Alan Brady        2023-08-07  1346  		tx_qgrp->vport = vport;
1c325aac10a82f1 Alan Brady        2023-08-07  1347  		tx_qgrp->num_txq = num_txq;
1c325aac10a82f1 Alan Brady        2023-08-07  1348  
1c325aac10a82f1 Alan Brady        2023-08-07  1349  		for (j = 0; j < tx_qgrp->num_txq; j++) {
1c325aac10a82f1 Alan Brady        2023-08-07  1350  			tx_qgrp->txqs[j] = kzalloc(sizeof(*tx_qgrp->txqs[j]),
1c325aac10a82f1 Alan Brady        2023-08-07  1351  						   GFP_KERNEL);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1352  			if (!tx_qgrp->txqs[j])
1c325aac10a82f1 Alan Brady        2023-08-07  1353  				goto err_alloc;
1c325aac10a82f1 Alan Brady        2023-08-07  1354  		}
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1355  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1356  		if (split && flow_sch_en) {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1357  			stashes = kcalloc(num_txq, sizeof(*stashes),
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1358  					  GFP_KERNEL);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1359  			if (!stashes)
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1360  				goto err_alloc;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1361  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1362  			tx_qgrp->stashes = stashes;
1c325aac10a82f1 Alan Brady        2023-08-07  1363  		}
1c325aac10a82f1 Alan Brady        2023-08-07  1364  
1c325aac10a82f1 Alan Brady        2023-08-07  1365  		for (j = 0; j < tx_qgrp->num_txq; j++) {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1366  			struct idpf_tx_queue *q = tx_qgrp->txqs[j];
1c325aac10a82f1 Alan Brady        2023-08-07  1367  
1c325aac10a82f1 Alan Brady        2023-08-07  1368  			q->dev = &adapter->pdev->dev;
1c325aac10a82f1 Alan Brady        2023-08-07  1369  			q->desc_count = vport->txq_desc_count;
1c325aac10a82f1 Alan Brady        2023-08-07  1370  			q->tx_max_bufs = idpf_get_max_tx_bufs(adapter);
1c325aac10a82f1 Alan Brady        2023-08-07  1371  			q->tx_min_pkt_len = idpf_get_min_tx_pkt_len(adapter);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1372  			q->netdev = vport->netdev;
1c325aac10a82f1 Alan Brady        2023-08-07  1373  			q->txq_grp = tx_qgrp;
1c325aac10a82f1 Alan Brady        2023-08-07  1374  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1375  			if (!split) {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1376  				q->clean_budget = vport->compln_clean_budget;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1377  				idpf_queue_assign(CRC_EN, q,
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1378  						  vport->crc_enable);
1c325aac10a82f1 Alan Brady        2023-08-07  1379  			}
1c325aac10a82f1 Alan Brady        2023-08-07  1380  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1381  			if (!flow_sch_en)
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1382  				continue;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1383  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1384  			if (split) {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20 @1385  				q->stash = &stashes[j];
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1386  				hash_init(q->stash->sched_buf_hash);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1387  			}
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1388  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1389  			idpf_queue_set(FLOW_SCH_EN, q);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1390  		}
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1391  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1392  		if (!split)
1c325aac10a82f1 Alan Brady        2023-08-07  1393  			continue;
1c325aac10a82f1 Alan Brady        2023-08-07  1394  
1c325aac10a82f1 Alan Brady        2023-08-07  1395  		tx_qgrp->complq = kcalloc(IDPF_COMPLQ_PER_GROUP,
1c325aac10a82f1 Alan Brady        2023-08-07  1396  					  sizeof(*tx_qgrp->complq),
1c325aac10a82f1 Alan Brady        2023-08-07  1397  					  GFP_KERNEL);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1398  		if (!tx_qgrp->complq)
1c325aac10a82f1 Alan Brady        2023-08-07  1399  			goto err_alloc;
1c325aac10a82f1 Alan Brady        2023-08-07  1400  
1c325aac10a82f1 Alan Brady        2023-08-07  1401  		tx_qgrp->complq->desc_count = vport->complq_desc_count;
1c325aac10a82f1 Alan Brady        2023-08-07  1402  		tx_qgrp->complq->txq_grp = tx_qgrp;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1403  		tx_qgrp->complq->netdev = vport->netdev;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1404  		tx_qgrp->complq->clean_budget = vport->compln_clean_budget;
d38b4d0d95bc0c7 Michal Kubiak     2023-10-23  1405  
d38b4d0d95bc0c7 Michal Kubiak     2023-10-23  1406  		if (flow_sch_en)
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1407  			idpf_queue_set(FLOW_SCH_EN, tx_qgrp->complq);
1c325aac10a82f1 Alan Brady        2023-08-07  1408  	}
1c325aac10a82f1 Alan Brady        2023-08-07  1409  
1c325aac10a82f1 Alan Brady        2023-08-07  1410  	return 0;
1c325aac10a82f1 Alan Brady        2023-08-07  1411  
1c325aac10a82f1 Alan Brady        2023-08-07  1412  err_alloc:
1c325aac10a82f1 Alan Brady        2023-08-07  1413  	idpf_txq_group_rel(vport);
1c325aac10a82f1 Alan Brady        2023-08-07  1414  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  1415  	return -ENOMEM;
1c325aac10a82f1 Alan Brady        2023-08-07  1416  }
1c325aac10a82f1 Alan Brady        2023-08-07  1417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
