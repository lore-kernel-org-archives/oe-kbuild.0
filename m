Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAA810
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBpQlsL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699800151; x=1731336151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSGoUtHvlpEl4qVZd5y5CwA5ENenkzPq4w9ieuRG1hg=;
  b=bBpQlsL9Ixn5PQIkneYsXkS6gjGFESBK4GHPKhRJegUoL/RJf+LuGO2h
   vFJq+IAtfJaeCIMssX2XGPxB47PTVyM83pIdE5hlY0GT2Txv+icqIkoMh
   HS+9G9O2YmOaVAdLJeY7E1HPL2kN+uK+NyJLxnHc6FPgPTsTOauav15Dj
   iuC63F0mlY80WF1MWkuGRfomRfaGKEOHb7SjD+gstFYlrwB+zMCAoa1K7
   RwUf99hjsw2mAEUzNr9q7qRey+td3WvZAE2XOJ4IqV/xiYLSPgdtnC3gg
   5wB5iRK8vh1v2GEMRnjZDdHLKqkdiXVIw6Ly01/VzfHdrGZ0PM4OpGOzE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="369660511"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="369660511"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 06:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="740562045"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="740562045"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Nov 2023 06:42:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2BfO-000BCw-2g;
	Sun, 12 Nov 2023 14:42:26 +0000
Date: Sun, 12 Nov 2023 22:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:1410 bnxt_tc_add_flow()
 warn: missing unwind goto?
Message-ID: <202311122248.ySRmMHRM-lkp@intel.com>
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
TO: Somnath Kotur <somnath.kotur@broadcom.com>
CC: Michael Chan <michael.chan@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 08f8280e8788202a67a359952cd436707f8789bd bnxt: Avoid logging an unnecessary message when a flow can't be offloaded
date:   4 years ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 years ago
config: i386-randconfig-141-20230912 (https://download.01.org/0day-ci/archive/20231112/202311122248.ySRmMHRM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311122248.ySRmMHRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311122248.ySRmMHRM-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:1410 bnxt_tc_add_flow() warn: missing unwind goto?

vim +1410 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c

e9ecc731a87912d2 Sathya Perla          2017-12-01  1367  
2ae7408fedfee979 Sathya Perla          2017-08-28  1368  /* Add a new flow or replace an existing flow.
2ae7408fedfee979 Sathya Perla          2017-08-28  1369   * Notes on locking:
2ae7408fedfee979 Sathya Perla          2017-08-28  1370   * There are essentially two critical sections here.
2ae7408fedfee979 Sathya Perla          2017-08-28  1371   * 1. while adding a new flow
2ae7408fedfee979 Sathya Perla          2017-08-28  1372   *    a) lookup l2-key
2ae7408fedfee979 Sathya Perla          2017-08-28  1373   *    b) issue HWRM cmd and get flow_handle
2ae7408fedfee979 Sathya Perla          2017-08-28  1374   *    c) link l2-key with flow
2ae7408fedfee979 Sathya Perla          2017-08-28  1375   * 2. while deleting a flow
2ae7408fedfee979 Sathya Perla          2017-08-28  1376   *    a) unlinking l2-key from flow
2ae7408fedfee979 Sathya Perla          2017-08-28  1377   * A lock is needed to protect these two critical sections.
2ae7408fedfee979 Sathya Perla          2017-08-28  1378   *
2ae7408fedfee979 Sathya Perla          2017-08-28  1379   * The hash-tables are already protected by the rhashtable API.
2ae7408fedfee979 Sathya Perla          2017-08-28  1380   */
2ae7408fedfee979 Sathya Perla          2017-08-28  1381  static int bnxt_tc_add_flow(struct bnxt *bp, u16 src_fid,
f9e30088d20016a2 Pablo Neira Ayuso     2019-07-09  1382  			    struct flow_cls_offload *tc_flow_cmd)
2ae7408fedfee979 Sathya Perla          2017-08-28  1383  {
2ae7408fedfee979 Sathya Perla          2017-08-28  1384  	struct bnxt_tc_flow_node *new_node, *old_node;
cd66358e52f74585 Sathya Perla          2017-10-26  1385  	struct bnxt_tc_info *tc_info = bp->tc_info;
2ae7408fedfee979 Sathya Perla          2017-08-28  1386  	struct bnxt_tc_flow *flow;
8c95f773b4a367f7 Sathya Perla          2017-10-26  1387  	__le32 tunnel_handle = 0;
2ae7408fedfee979 Sathya Perla          2017-08-28  1388  	__le16 ref_flow_handle;
2ae7408fedfee979 Sathya Perla          2017-08-28  1389  	int rc;
2ae7408fedfee979 Sathya Perla          2017-08-28  1390  
2ae7408fedfee979 Sathya Perla          2017-08-28  1391  	/* allocate memory for the new flow and it's node */
2ae7408fedfee979 Sathya Perla          2017-08-28  1392  	new_node = kzalloc(sizeof(*new_node), GFP_KERNEL);
2ae7408fedfee979 Sathya Perla          2017-08-28  1393  	if (!new_node) {
2ae7408fedfee979 Sathya Perla          2017-08-28  1394  		rc = -ENOMEM;
2ae7408fedfee979 Sathya Perla          2017-08-28  1395  		goto done;
2ae7408fedfee979 Sathya Perla          2017-08-28  1396  	}
2ae7408fedfee979 Sathya Perla          2017-08-28  1397  	new_node->cookie = tc_flow_cmd->cookie;
2ae7408fedfee979 Sathya Perla          2017-08-28  1398  	flow = &new_node->flow;
2ae7408fedfee979 Sathya Perla          2017-08-28  1399  
2ae7408fedfee979 Sathya Perla          2017-08-28  1400  	rc = bnxt_tc_parse_flow(bp, tc_flow_cmd, flow);
2ae7408fedfee979 Sathya Perla          2017-08-28  1401  	if (rc)
2ae7408fedfee979 Sathya Perla          2017-08-28  1402  		goto free_node;
e9ecc731a87912d2 Sathya Perla          2017-12-01  1403  
e9ecc731a87912d2 Sathya Perla          2017-12-01  1404  	bnxt_tc_set_src_fid(bp, flow, src_fid);
685ec6a81bb0d47f Venkat Duvvuru        2019-08-17  1405  	bnxt_tc_set_flow_dir(bp, flow, flow->src_fid);
abd43a13525db709 Venkat Duvvuru        2018-12-20  1406  
2ae7408fedfee979 Sathya Perla          2017-08-28  1407  	if (!bnxt_tc_can_offload(bp, flow)) {
b2d69122fd627aa3 Sriharsha Basavapatna 2019-02-19  1408  		rc = -EOPNOTSUPP;
08f8280e8788202a Somnath Kotur         2019-10-31  1409  		kfree_rcu(new_node, rcu);
08f8280e8788202a Somnath Kotur         2019-10-31 @1410  		return rc;
2ae7408fedfee979 Sathya Perla          2017-08-28  1411  	}
2ae7408fedfee979 Sathya Perla          2017-08-28  1412  
2ae7408fedfee979 Sathya Perla          2017-08-28  1413  	/* If a flow exists with the same cookie, delete it */
2ae7408fedfee979 Sathya Perla          2017-08-28  1414  	old_node = rhashtable_lookup_fast(&tc_info->flow_table,
2ae7408fedfee979 Sathya Perla          2017-08-28  1415  					  &tc_flow_cmd->cookie,
2ae7408fedfee979 Sathya Perla          2017-08-28  1416  					  tc_info->flow_ht_params);
2ae7408fedfee979 Sathya Perla          2017-08-28  1417  	if (old_node)
2ae7408fedfee979 Sathya Perla          2017-08-28  1418  		__bnxt_tc_del_flow(bp, old_node);
2ae7408fedfee979 Sathya Perla          2017-08-28  1419  
2ae7408fedfee979 Sathya Perla          2017-08-28  1420  	/* Check if the L2 part of the flow has been offloaded already.
2ae7408fedfee979 Sathya Perla          2017-08-28  1421  	 * If so, bump up it's refcnt and get it's reference handle.
2ae7408fedfee979 Sathya Perla          2017-08-28  1422  	 */
2ae7408fedfee979 Sathya Perla          2017-08-28  1423  	mutex_lock(&tc_info->lock);
2ae7408fedfee979 Sathya Perla          2017-08-28  1424  	rc = bnxt_tc_get_ref_flow_handle(bp, flow, new_node, &ref_flow_handle);
2ae7408fedfee979 Sathya Perla          2017-08-28  1425  	if (rc)
2ae7408fedfee979 Sathya Perla          2017-08-28  1426  		goto unlock;
2ae7408fedfee979 Sathya Perla          2017-08-28  1427  
8c95f773b4a367f7 Sathya Perla          2017-10-26  1428  	/* If the flow involves tunnel encap/decap, get tunnel_handle */
8c95f773b4a367f7 Sathya Perla          2017-10-26  1429  	rc = bnxt_tc_get_tunnel_handle(bp, flow, new_node, &tunnel_handle);
8c95f773b4a367f7 Sathya Perla          2017-10-26  1430  	if (rc)
8c95f773b4a367f7 Sathya Perla          2017-10-26  1431  		goto put_l2;
8c95f773b4a367f7 Sathya Perla          2017-10-26  1432  
2ae7408fedfee979 Sathya Perla          2017-08-28  1433  	/* send HWRM cmd to alloc the flow */
2ae7408fedfee979 Sathya Perla          2017-08-28  1434  	rc = bnxt_hwrm_cfa_flow_alloc(bp, flow, ref_flow_handle,
abd43a13525db709 Venkat Duvvuru        2018-12-20  1435  				      tunnel_handle, new_node);
2ae7408fedfee979 Sathya Perla          2017-08-28  1436  	if (rc)
8c95f773b4a367f7 Sathya Perla          2017-10-26  1437  		goto put_tunnel;
2ae7408fedfee979 Sathya Perla          2017-08-28  1438  
5a84acbebb22f93d Sathya Perla          2017-10-26  1439  	flow->lastused = jiffies;
5a84acbebb22f93d Sathya Perla          2017-10-26  1440  	spin_lock_init(&flow->stats_lock);
2ae7408fedfee979 Sathya Perla          2017-08-28  1441  	/* add new flow to flow-table */
2ae7408fedfee979 Sathya Perla          2017-08-28  1442  	rc = rhashtable_insert_fast(&tc_info->flow_table, &new_node->node,
2ae7408fedfee979 Sathya Perla          2017-08-28  1443  				    tc_info->flow_ht_params);
2ae7408fedfee979 Sathya Perla          2017-08-28  1444  	if (rc)
2ae7408fedfee979 Sathya Perla          2017-08-28  1445  		goto hwrm_flow_free;
2ae7408fedfee979 Sathya Perla          2017-08-28  1446  
2ae7408fedfee979 Sathya Perla          2017-08-28  1447  	mutex_unlock(&tc_info->lock);
2ae7408fedfee979 Sathya Perla          2017-08-28  1448  	return 0;
2ae7408fedfee979 Sathya Perla          2017-08-28  1449  
2ae7408fedfee979 Sathya Perla          2017-08-28  1450  hwrm_flow_free:
abd43a13525db709 Venkat Duvvuru        2018-12-20  1451  	bnxt_hwrm_cfa_flow_free(bp, new_node);
8c95f773b4a367f7 Sathya Perla          2017-10-26  1452  put_tunnel:
8c95f773b4a367f7 Sathya Perla          2017-10-26  1453  	bnxt_tc_put_tunnel_handle(bp, flow, new_node);
2ae7408fedfee979 Sathya Perla          2017-08-28  1454  put_l2:
2ae7408fedfee979 Sathya Perla          2017-08-28  1455  	bnxt_tc_put_l2_node(bp, new_node);
2ae7408fedfee979 Sathya Perla          2017-08-28  1456  unlock:
2ae7408fedfee979 Sathya Perla          2017-08-28  1457  	mutex_unlock(&tc_info->lock);
2ae7408fedfee979 Sathya Perla          2017-08-28  1458  free_node:
8c95f773b4a367f7 Sathya Perla          2017-10-26  1459  	kfree_rcu(new_node, rcu);
2ae7408fedfee979 Sathya Perla          2017-08-28  1460  done:
2ae7408fedfee979 Sathya Perla          2017-08-28  1461  	netdev_err(bp->dev, "Error: %s: cookie=0x%lx error=%d",
2ae7408fedfee979 Sathya Perla          2017-08-28  1462  		   __func__, tc_flow_cmd->cookie, rc);
2ae7408fedfee979 Sathya Perla          2017-08-28  1463  	return rc;
2ae7408fedfee979 Sathya Perla          2017-08-28  1464  }
2ae7408fedfee979 Sathya Perla          2017-08-28  1465  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
