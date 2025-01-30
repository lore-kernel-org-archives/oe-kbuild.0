Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35DC611E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 00:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738196473; cv=none; b=Lq4qGRXrJqmg5WwWZsHfr50inhRx8YtTWq2Be1jvZmAV3w3jLrgKxj0eyj7S7CYfXwlDiPT9gfEim+sDjExe4nqPEB1c1OdQAhQdViTD5DGbwK6P3g/MWcgfXYjNVHEVZ0vOPskZlI/WE1bBz3YoR33YAGaMt4nMcyHAAy0557E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738196473; c=relaxed/simple;
	bh=oiM1KZyG+mVg4OzrNR5Cw6EppB90g+jWPZ5WBJTXlCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ry8NQSdqBLHjN5YPSjXaW0h+pEk0ZGjMKKe3zL+vw0GtVBToyI/qFe1+jkMrtx3BBLn/m633DG6VLFqeT0Y3Sq56akudyYbGfn+4exDaWGYa5cpC/JJUG6MSvjmxhT2zrwo4PGWwDGMBBCIqz3qyCT4R6JE2ETIiNHOgZkUPK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BO5IXCFe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BO5IXCFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738196471; x=1769732471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiM1KZyG+mVg4OzrNR5Cw6EppB90g+jWPZ5WBJTXlCc=;
  b=BO5IXCFeSWsW+OkBjXmIGe/TgfckxglzEabkomNBW2lIJJ8jPSCGNQHk
   YegGHpe/1U1TZS9VjDGe/hHXFzEIm081gOCM0xcfbnxMijUIuvLV1ITBq
   LHDbJCR/qXjfCN9O/e8YYwFjlQ15m+MiCRUjwFClE2zPpTeTuaVRqt9op
   gtLI9A3qUaHFmCeaggiiyWuX48yltYqn0hxHg4QWPZPLSvmJpXsWHF7Hp
   dU2FUGoEKdax2/NurhZcL4Su4E9BXvWbGdKnzkwnEG79fcxgnHcNPeT3/
   cu94Ir0O5ch1C5PQqNHlLHd+GUsdyLj9x3obUIkBW2OejAmIexh/s7YCU
   A==;
X-CSE-ConnectionGUID: blqdXdMzTe6g0fB7S0LJRw==
X-CSE-MsgGUID: Igz2JBxUTX+SuIRoBqke9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56160229"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="56160229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 16:21:09 -0800
X-CSE-ConnectionGUID: 539DwbKgSLmg+MWbpYaELw==
X-CSE-MsgGUID: cjw9IX6BQTGwYnRDZz5xxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="114195840"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2025 16:21:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdIIr-000jUN-28;
	Thu, 30 Jan 2025 00:21:05 +0000
Date: Thu, 30 Jan 2025 08:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v2 09/10] bnxt_en: Extend queue stop/start for
 TX rings
Message-ID: <202501300808.5bqgHMA6-lkp@intel.com>
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
In-Reply-To: <20250116192343.34535-10-michael.chan@broadcom.com>
References: <20250116192343.34535-10-michael.chan@broadcom.com>
TO: Michael Chan <michael.chan@broadcom.com>
TO: davem@davemloft.net
CC: netdev@vger.kernel.org
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: andrew+netdev@lunn.ch
CC: pavan.chebbi@broadcom.com
CC: andrew.gospodarek@broadcom.com
CC: michal.swiatkowski@linux.intel.com
CC: helgaas@kernel.org
CC: Somnath Kotur <somnath.kotur@broadcom.com>
CC: Ajit Khaparde <ajit.khaparde@broadcom.com>
CC: David Wei <dw@davidwei.uk>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Set-NAPR-1-2-support-when-registering-with-firmware/20250117-032822
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250116192343.34535-10-michael.chan%40broadcom.com
patch subject: [PATCH net-next v2 09/10] bnxt_en: Extend queue stop/start for TX rings
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250130/202501300808.5bqgHMA6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501300808.5bqgHMA6-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:15769 bnxt_queue_start() error: uninitialized symbol 'cpr'.

Old smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:779 bnxt_start_xmit() error: we previously assumed 'ptp' could be null (see line 524)
drivers/net/ethernet/broadcom/bnxt/bnxt.c:779 bnxt_start_xmit() error: uninitialized symbol 'txts_prod'.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:10237 bnxt_accumulate_all_stats() error: uninitialized symbol 'ring0_stats'.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:10362 bnxt_hwrm_port_qstats_ext() warn: missing error code? 'rc'
drivers/net/ethernet/broadcom/bnxt/bnxt.c:11415 bnxt_request_irq() warn: 'irq->vector' from request_irq() not released on lines: 11415.

vim +/cpr +15769 drivers/net/ethernet/broadcom/bnxt/bnxt.c

2d694c27d32efc David Wei     2024-06-18  15690  
2d694c27d32efc David Wei     2024-06-18  15691  static int bnxt_queue_start(struct net_device *dev, void *qmem, int idx)
2d694c27d32efc David Wei     2024-06-18  15692  {
2d694c27d32efc David Wei     2024-06-18  15693  	struct bnxt *bp = netdev_priv(dev);
2d694c27d32efc David Wei     2024-06-18  15694  	struct bnxt_rx_ring_info *rxr, *clone;
2d694c27d32efc David Wei     2024-06-18  15695  	struct bnxt_cp_ring_info *cpr;
b9d2956e869c78 David Wei     2024-08-07  15696  	struct bnxt_vnic_info *vnic;
5d2310614bc883 Somnath Kotur 2025-01-16  15697  	struct bnxt_napi *bnapi;
b9d2956e869c78 David Wei     2024-08-07  15698  	int i, rc;
2d694c27d32efc David Wei     2024-06-18  15699  
2d694c27d32efc David Wei     2024-06-18  15700  	rxr = &bp->rx_ring[idx];
2d694c27d32efc David Wei     2024-06-18  15701  	clone = qmem;
2d694c27d32efc David Wei     2024-06-18  15702  
2d694c27d32efc David Wei     2024-06-18  15703  	rxr->rx_prod = clone->rx_prod;
2d694c27d32efc David Wei     2024-06-18  15704  	rxr->rx_agg_prod = clone->rx_agg_prod;
2d694c27d32efc David Wei     2024-06-18  15705  	rxr->rx_sw_agg_prod = clone->rx_sw_agg_prod;
2d694c27d32efc David Wei     2024-06-18  15706  	rxr->rx_next_cons = clone->rx_next_cons;
bd649c5cc95816 David Wei     2024-12-03  15707  	rxr->rx_tpa = clone->rx_tpa;
bd649c5cc95816 David Wei     2024-12-03  15708  	rxr->rx_tpa_idx_map = clone->rx_tpa_idx_map;
2d694c27d32efc David Wei     2024-06-18  15709  	rxr->page_pool = clone->page_pool;
bd649c5cc95816 David Wei     2024-12-03  15710  	rxr->head_pool = clone->head_pool;
b537633ce57b29 Taehee Yoo    2024-07-21  15711  	rxr->xdp_rxq = clone->xdp_rxq;
2d694c27d32efc David Wei     2024-06-18  15712  
2d694c27d32efc David Wei     2024-06-18  15713  	bnxt_copy_rx_ring(bp, rxr, clone);
2d694c27d32efc David Wei     2024-06-18  15714  
5d2310614bc883 Somnath Kotur 2025-01-16  15715  	bnapi = rxr->bnapi;
2d694c27d32efc David Wei     2024-06-18  15716  	rc = bnxt_hwrm_rx_ring_alloc(bp, rxr);
2d694c27d32efc David Wei     2024-06-18  15717  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15718  		goto err_reset_rx;
377e78a9e08ce5 Somnath Kotur 2025-01-16  15719  
377e78a9e08ce5 Somnath Kotur 2025-01-16  15720  	rc = bnxt_hwrm_cp_ring_alloc_p5(bp, rxr->rx_cpr);
2d694c27d32efc David Wei     2024-06-18  15721  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15722  		goto err_reset_rx;
2d694c27d32efc David Wei     2024-06-18  15723  
377e78a9e08ce5 Somnath Kotur 2025-01-16  15724  	rc = bnxt_hwrm_rx_agg_ring_alloc(bp, rxr);
377e78a9e08ce5 Somnath Kotur 2025-01-16  15725  	if (rc)
5d2310614bc883 Somnath Kotur 2025-01-16  15726  		goto err_reset_rx;
377e78a9e08ce5 Somnath Kotur 2025-01-16  15727  
2d694c27d32efc David Wei     2024-06-18  15728  	bnxt_db_write(bp, &rxr->rx_db, rxr->rx_prod);
2d694c27d32efc David Wei     2024-06-18  15729  	if (bp->flags & BNXT_FLAG_AGG_RINGS)
2d694c27d32efc David Wei     2024-06-18  15730  		bnxt_db_write(bp, &rxr->rx_agg_db, rxr->rx_agg_prod);
2d694c27d32efc David Wei     2024-06-18  15731  
5d2310614bc883 Somnath Kotur 2025-01-16  15732  	cpr = &bnapi->cp_ring;
2d694c27d32efc David Wei     2024-06-18  15733  	cpr->sw_stats->rx.rx_resets++;
2d694c27d32efc David Wei     2024-06-18  15734  
5d2310614bc883 Somnath Kotur 2025-01-16  15735  	if (bp->flags & BNXT_FLAG_SHARED_RINGS) {
5d2310614bc883 Somnath Kotur 2025-01-16  15736  		cpr->sw_stats->tx.tx_resets++;
5d2310614bc883 Somnath Kotur 2025-01-16  15737  		rc = bnxt_tx_queue_start(bp, idx);
5d2310614bc883 Somnath Kotur 2025-01-16  15738  		if (rc) {
5d2310614bc883 Somnath Kotur 2025-01-16  15739  			netdev_warn(bp->dev,
5d2310614bc883 Somnath Kotur 2025-01-16  15740  				    "tx queue restart failed: rc=%d\n", rc);
5d2310614bc883 Somnath Kotur 2025-01-16  15741  			bnapi->tx_fault = 1;
5d2310614bc883 Somnath Kotur 2025-01-16  15742  			goto err_reset;
5d2310614bc883 Somnath Kotur 2025-01-16  15743  		}
5d2310614bc883 Somnath Kotur 2025-01-16  15744  	}
5d2310614bc883 Somnath Kotur 2025-01-16  15745  
5d2310614bc883 Somnath Kotur 2025-01-16  15746  	napi_enable(&bnapi->napi);
5d2310614bc883 Somnath Kotur 2025-01-16  15747  	bnxt_db_nq_arm(bp, &cpr->cp_db, cpr->cp_raw_cons);
5d2310614bc883 Somnath Kotur 2025-01-16  15748  
b9d2956e869c78 David Wei     2024-08-07  15749  	for (i = 0; i <= BNXT_VNIC_NTUPLE; i++) {
b9d2956e869c78 David Wei     2024-08-07  15750  		vnic = &bp->vnic_info[i];
5ac066b7b062ee Somnath Kotur 2024-11-22  15751  
5ac066b7b062ee Somnath Kotur 2024-11-22  15752  		rc = bnxt_hwrm_vnic_set_rss_p5(bp, vnic, true);
5ac066b7b062ee Somnath Kotur 2024-11-22  15753  		if (rc) {
5ac066b7b062ee Somnath Kotur 2024-11-22  15754  			netdev_err(bp->dev, "hwrm vnic %d set rss failure rc: %d\n",
5ac066b7b062ee Somnath Kotur 2024-11-22  15755  				   vnic->vnic_id, rc);
5ac066b7b062ee Somnath Kotur 2024-11-22  15756  			return rc;
5ac066b7b062ee Somnath Kotur 2024-11-22  15757  		}
b9d2956e869c78 David Wei     2024-08-07  15758  		vnic->mru = bp->dev->mtu + ETH_HLEN + VLAN_HLEN;
b9d2956e869c78 David Wei     2024-08-07  15759  		bnxt_hwrm_vnic_update(bp, vnic,
b9d2956e869c78 David Wei     2024-08-07  15760  				      VNIC_UPDATE_REQ_ENABLES_MRU_VALID);
b9d2956e869c78 David Wei     2024-08-07  15761  	}
b9d2956e869c78 David Wei     2024-08-07  15762  
2d694c27d32efc David Wei     2024-06-18  15763  	return 0;
2d694c27d32efc David Wei     2024-06-18  15764  
5d2310614bc883 Somnath Kotur 2025-01-16  15765  err_reset_rx:
5d2310614bc883 Somnath Kotur 2025-01-16  15766  	rxr->bnapi->in_reset = true;
5d2310614bc883 Somnath Kotur 2025-01-16  15767  err_reset:
5d2310614bc883 Somnath Kotur 2025-01-16  15768  	napi_enable(&bnapi->napi);
5d2310614bc883 Somnath Kotur 2025-01-16 @15769  	bnxt_db_nq_arm(bp, &cpr->cp_db, cpr->cp_raw_cons);
5d2310614bc883 Somnath Kotur 2025-01-16  15770  	bnxt_reset_task(bp, true);
2d694c27d32efc David Wei     2024-06-18  15771  	return rc;
2d694c27d32efc David Wei     2024-06-18  15772  }
2d694c27d32efc David Wei     2024-06-18  15773  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
