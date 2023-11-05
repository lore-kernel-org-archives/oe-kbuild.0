Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA185FBF9
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljbhNmko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699199503; x=1730735503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrGsVeIEzoZPmwZdujZbex5ugCAvIZ18JH9HBJhEJ8Y=;
  b=ljbhNmko8/5SEl5Vgq+bIx/e1cH7iy8n9E10ztgn/s6QfL3hiY4sB7BC
   z5uwJeOqbSgdHZBfthiM0gAYGeiQw2Q4F3NqKS+1n2PvAqx1FR4Al5pyA
   1iGsCDAwzN/apJ3cHlzYcdFh4tymlosoi5v9CKPDS60kMsHnEw4+utepU
   RLn+HFXBUfycJaEqjNicBJeKEeOSZwGIwrppKuxqrfjY1wu4NIrddbg1m
   cheywIzdUiWX8wARf1rJeeiybZgOc1Ljwzt+LnBF5kS0HDGjVGYVe8pF5
   B8EwLTYxGUMP+Y2S8CEeQl8BBwwt81ZHFkrt1YAcawXA8MvW0J4IESi0d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453461402"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453461402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 07:51:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="3219111"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 07:51:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfPX-0005Zc-1X;
	Sun, 05 Nov 2023 15:51:39 +0000
Date: Sun, 5 Nov 2023 23:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1420
 cxgb4_port_mirror_alloc_queues() warn: 'mirror_rxq->msix->vec' from
 request_irq() not released on lines: 1420.
Message-ID: <202311052355.MQn9dQ6J-lkp@intel.com>
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
TO: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 2b465ed00f7db9c5b2aca95a91671f86282b1822 cxgb4: add support for mirror Rxqs
date:   3 years, 4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-141-20231026 (https://download.01.org/0day-ci/archive/20231105/202311052355.MQn9dQ6J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311052355.MQn9dQ6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311052355.MQn9dQ6J-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1420 cxgb4_port_mirror_alloc_queues() warn: 'mirror_rxq->msix->vec' from request_irq() not released on lines: 1420.

Old smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1456 cxgb4_port_mirror_alloc() warn: missing error code 'ret'

vim +1420 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c

2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1315  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1316  static int cxgb4_port_mirror_alloc_queues(struct net_device *dev)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1317  {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1318  	struct port_info *pi = netdev2pinfo(dev);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1319  	struct adapter *adap = netdev2adap(dev);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1320  	struct sge_eth_rxq *mirror_rxq;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1321  	struct sge *s = &adap->sge;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1322  	int ret = 0, msix = 0;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1323  	u16 i, rxqid;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1324  	u16 *rss;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1325  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1326  	if (!pi->vi_mirror_count)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1327  		return 0;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1328  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1329  	if (s->mirror_rxq[pi->port_id])
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1330  		return 0;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1331  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1332  	mirror_rxq = kcalloc(pi->nmirrorqsets, sizeof(*mirror_rxq), GFP_KERNEL);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1333  	if (!mirror_rxq)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1334  		return -ENOMEM;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1335  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1336  	s->mirror_rxq[pi->port_id] = mirror_rxq;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1337  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1338  	if (!(adap->flags & CXGB4_USING_MSIX))
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1339  		msix = -((int)adap->sge.intrq.abs_id + 1);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1340  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1341  	for (i = 0, rxqid = 0; i < pi->nmirrorqsets; i++, rxqid++) {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1342  		mirror_rxq = &s->mirror_rxq[pi->port_id][i];
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1343  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1344  		/* Allocate Mirror Rxqs */
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1345  		if (msix >= 0) {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1346  			msix = cxgb4_get_msix_idx_from_bmap(adap);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1347  			if (msix < 0) {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1348  				ret = msix;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1349  				goto out_free_queues;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1350  			}
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1351  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1352  			mirror_rxq->msix = &adap->msix_info[msix];
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1353  			snprintf(mirror_rxq->msix->desc,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1354  				 sizeof(mirror_rxq->msix->desc),
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1355  				 "%s-mirrorrxq%d", dev->name, i);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1356  		}
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1357  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1358  		init_rspq(adap, &mirror_rxq->rspq,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1359  			  CXGB4_MIRROR_RXQ_DEFAULT_INTR_USEC,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1360  			  CXGB4_MIRROR_RXQ_DEFAULT_PKT_CNT,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1361  			  CXGB4_MIRROR_RXQ_DEFAULT_DESC_NUM,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1362  			  CXGB4_MIRROR_RXQ_DEFAULT_DESC_SIZE);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1363  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1364  		mirror_rxq->fl.size = CXGB4_MIRROR_FLQ_DEFAULT_DESC_NUM;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1365  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1366  		ret = t4_sge_alloc_rxq(adap, &mirror_rxq->rspq, false,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1367  				       dev, msix, &mirror_rxq->fl,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1368  				       t4_ethrx_handler, NULL, 0);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1369  		if (ret)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1370  			goto out_free_msix_idx;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1371  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1372  		/* Setup MSI-X vectors for Mirror Rxqs */
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1373  		if (adap->flags & CXGB4_USING_MSIX) {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1374  			ret = request_irq(mirror_rxq->msix->vec,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1375  					  t4_sge_intr_msix, 0,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1376  					  mirror_rxq->msix->desc,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1377  					  &mirror_rxq->rspq);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1378  			if (ret)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1379  				goto out_free_rxq;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1380  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1381  			cxgb4_set_msix_aff(adap, mirror_rxq->msix->vec,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1382  					   &mirror_rxq->msix->aff_mask, i);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1383  		}
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1384  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1385  		/* Start NAPI for Mirror Rxqs */
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1386  		cxgb4_enable_rx(adap, &mirror_rxq->rspq);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1387  	}
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1388  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1389  	/* Setup RSS for Mirror Rxqs */
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1390  	rss = kcalloc(pi->rss_size, sizeof(u16), GFP_KERNEL);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1391  	if (!rss) {
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1392  		ret = -ENOMEM;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1393  		goto out_free_queues;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1394  	}
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1395  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1396  	mirror_rxq = &s->mirror_rxq[pi->port_id][0];
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1397  	for (i = 0; i < pi->rss_size; i++)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1398  		rss[i] = mirror_rxq[i % pi->nmirrorqsets].rspq.abs_id;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1399  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1400  	ret = cxgb4_config_rss(pi, rss, pi->rss_size, pi->viid_mirror);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1401  	kfree(rss);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1402  	if (ret)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1403  		goto out_free_queues;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1404  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1405  	return 0;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1406  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1407  out_free_rxq:
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1408  	free_rspq_fl(adap, &mirror_rxq->rspq, &mirror_rxq->fl);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1409  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1410  out_free_msix_idx:
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1411  	cxgb4_free_msix_idx_in_bmap(adap, mirror_rxq->msix->idx);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1412  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1413  out_free_queues:
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1414  	while (rxqid-- > 0)
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1415  		cxgb4_port_mirror_free_rxq(adap,
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1416  					   &s->mirror_rxq[pi->port_id][rxqid]);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1417  
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1418  	kfree(s->mirror_rxq[pi->port_id]);
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1419  	s->mirror_rxq[pi->port_id] = NULL;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30 @1420  	return ret;
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1421  }
2b465ed00f7db9 Rahul Lakkireddy 2020-06-30  1422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
