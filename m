Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652837;
	b=IxOUCl0KR/ixNmHZAHkC9mBWd6aARL4H4dXxu06N2p7ERSsDJlPKBMDq2lIfsaqnOOaz
	 MU1IeN8mf4C8TYAdZIVAzhEtC6lLwgBJaFWg7SBUC0IqUBEGAVgUnMdfOm407Ve36cu45
	 s2+wcELTaiJWj5g5bWsbtZTe3/50Bp4XW8wdcaQxbx/00iNzlHyRRsMO24Zg4arm7MmCk
	 IPdxOiqwd/a1J/AFmzCGAQkpSexn1kapBUBARPT9dNQwaN2xelklCa9YwbdtuSCbpNbe1
	 jVEVrkApZpuhvT15xibWj7g85wlM9TXLJHhUA5d4+ybVLFcPXlXQiwMcE3LVKSOnh8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652837;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hdhuQx38Uw7AQEjk1I/bgvGKXb4UZ3QU546EemP0vvI=;
	b=ILXyv6BN+qikKDrathTPARV7eq1KSNpw56Qt/MqdwDFFvskNumrbtI2D2SHBvQCnLTUo
	 ae3fDLRNwOCcp/dUDvDtjg+kDto0RY7q67tMMIMCh1s7Pa14iPnDyInAjSJ9DjHg7I9KL
	 ufKRgHsgKJxRz9MdLBi8SJiSyHtu1Npa9wQuASjQhUKeLrQ/WUYzp+GJy7Vyt5tJvUbPR
	 8xPfULhHSkUYRs4NLb7TiVQ7kKk2acOFte9A2uTtTmjUCjYV8G5q87/HIs8L3/zIxo6SV
	 A/zARuny025exXFYt4s6Uw/NVdCEPo4qY7yzBzWPNEFG2lsPMXYbw5fihOBfHpUURzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjGRnoLw;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B57606A323
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 00:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NjGRnoLw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795652837; x=1827188837;
  h=date:from:to:cc:subject:message-id;
  bh=Dbf5j1r7CB+hTVo0Fl8gZfYqH7JYdpcGkWCrH7htZKM=;
  b=NjGRnoLwLZ+/rExVLayGWE85iFqtQAes2p41GiGfU4hh3HqM6FgCSYGZ
   RqQyHHrCox7UUMSahjPnjgFcWRlJLs6AERB+dYRWqrvy2vp9QyzBP1Jcl
   ShAgQSnWi5Xug9Q1mLZy4quThdDeoHxS2L6r0tEPxS3oaFIajca2C5qqU
   osAnHft9/tiz8mFRIves2E2vqe9UzIhnIcF1bP6AsQdwErMPlom39nnfu
   UEdbVe5qd1LeMNwn47Ainud+d+WgTcaJw7I38/0eTXUrRS81u3l3UOfPF
   u5iawMSp3zOJ/SJEA8jnvlfjQUbYcN/749dvl+3uBSBwRAXblgiC6kj5R
   Q==;
X-CSE-ConnectionGUID: LAwFSfmlSX+r9uqRKSNbjQ==
X-CSE-MsgGUID: y1gqp0ITRNmMcTCB6UE0Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4520482"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4520482"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:27:16 -0800
X-CSE-ConnectionGUID: oVAUk/+DTLeqNLz0tIMw+w==
X-CSE-MsgGUID: E09SzJnQRo+xuqGQ8qoYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11902363"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 16:27:14 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWNKQ-000000000An-43Li;
	Thu, 26 Nov 2026 00:27:10 +0000
Date: Thu, 26 Nov 2026 01:26:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:3-6:
 ERROR: invalid reference to the index variable of the iterator on line 1702
Message-ID: <20261126012312.ijWIgd3I-lkp@intel.com>
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
TO: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Ripan Deuri <quic_rdeuri@quicinc.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
CC: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: 5d2df2aa84303a187b82ca048ae28709bef85f77 wifi: ath12k: Move srng processing to wifi7 directory
date:   1 year, 3 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-2103-20261124 (https://download.01.org/0day-ci/archive/20261126/20261126012312.ijWIgd3I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5d2df2aa8430 ("wifi: ath12k: Move srng processing to wifi7 directory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261126012312.ijWIgd3I-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:3-6: ERROR: invalid reference to the index variable of the iterator on line 1702
   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:29-32: ERROR: invalid reference to the index variable of the iterator on line 1702

vim +1712 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c

5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1645  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1646  void ath12k_dp_rx_process_reo_status(struct ath12k_base *ab)
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1647  {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1648  	struct ath12k_dp *dp = &ab->dp;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1649  	struct hal_tlv_64_hdr *hdr;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1650  	struct hal_srng *srng;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1651  	struct ath12k_dp_rx_reo_cmd *cmd, *tmp;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1652  	bool found = false;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1653  	u16 tag;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1654  	struct hal_reo_status reo_status;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1655  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1656  	srng = &ab->hal.srng_list[dp->reo_status_ring.ring_id];
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1657  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1658  	memset(&reo_status, 0, sizeof(reo_status));
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1659  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1660  	spin_lock_bh(&srng->lock);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1661  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1662  	ath12k_hal_srng_access_begin(ab, srng);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1663  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1664  	while ((hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1665  		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1666  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1667  		switch (tag) {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1668  		case HAL_REO_GET_QUEUE_STATS_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1669  			ath12k_hal_reo_status_queue_stats(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1670  							  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1671  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1672  		case HAL_REO_FLUSH_QUEUE_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1673  			ath12k_hal_reo_flush_queue_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1674  							  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1675  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1676  		case HAL_REO_FLUSH_CACHE_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1677  			ath12k_hal_reo_flush_cache_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1678  							  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1679  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1680  		case HAL_REO_UNBLOCK_CACHE_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1681  			ath12k_hal_reo_unblk_cache_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1682  							  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1683  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1684  		case HAL_REO_FLUSH_TIMEOUT_LIST_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1685  			ath12k_hal_reo_flush_timeout_list_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1686  								 &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1687  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1688  		case HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1689  			ath12k_hal_reo_desc_thresh_reached_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1690  								  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1691  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1692  		case HAL_REO_UPDATE_RX_REO_QUEUE_STATUS:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1693  			ath12k_hal_reo_update_rx_reo_queue_status(ab, hdr,
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1694  								  &reo_status);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1695  			break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1696  		default:
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1697  			ath12k_warn(ab, "Unknown reo status type %d\n", tag);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1698  			continue;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1699  		}
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1700  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1701  		spin_lock_bh(&dp->reo_cmd_lock);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28 @1702  		list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1703  			if (reo_status.uniform_hdr.cmd_num == cmd->cmd_num) {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1704  				found = true;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1705  				list_del(&cmd->list);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1706  				break;
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1707  			}
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1708  		}
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1709  		spin_unlock_bh(&dp->reo_cmd_lock);
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1710  
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28  1711  		if (found) {
5d2df2aa84303a Pavankumar Nandeshwar 2025-08-28 @1712  			cmd->handler(dp, (void *)&cmd->data,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
