Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8443BBFCB
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362544; cv=none; b=rPBYuMuZ8x3w9BfIHeP9CztlV6Hwr+NXfGwbCfzZfvt62aD+FxhGyDuEY4mN5X433czafg3UYLcB2JCgUMzHATl7csWSbPu/j5UxIbMchX1YR7RTjjRXv/TtajlTAyriryJ9NcX255BXFzWq37HbwG465aMRVYo358jg9eBFnDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362544; c=relaxed/simple;
	bh=TH4VhYlgW9Brww+Pg3Du+/jRHVwHmbCXIhfSjgDDRDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fdDxNCjrGgAVe25cdkhY/P42d4h1/3M5zna1PSS84Sa/H7pU0y3QTV4Yv96xJNP+0kBqVDMafjkQ1zabMK3WeiUgoHL1G5hvZxq2hwH9l9VKJdTp6ysqLWbGgFPKCA4h52Bp7SaHmDYICTEyRAMoVN7T6EA9K50gUjzkAujTPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYulvuCQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYulvuCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786362543; x=1817898543;
  h=date:from:to:cc:subject:message-id;
  bh=TH4VhYlgW9Brww+Pg3Du+/jRHVwHmbCXIhfSjgDDRDs=;
  b=WYulvuCQa3QcSi5oqHJewquwslSHi2nfXUP+2DOys1otJviJlG4txDOv
   zkhObQe7XOkFSg53mGkYnOuoMTey/5F5DaSDqTAhp96mISnSGPadGIC3N
   J1W3Rv4f7bwwulCp5Gs7c/z7KCBVnoklz7ZUTuD/Y1XwNKMsdv/xCQ1Wy
   l6ndw0c8qoJA++tWEQ5tYo4wsCCHBZk97HgXdud0q9ThJ0/eKKiK47jGu
   v2Rwz8TNN5JWFzD8kPimBwnuA/HWQxSICEDa3xsso1DpkP67snX8SaTSL
   Q92fGuZvQZsMTzx/437Guotr32w6JmDb1oBknQ0C6LS1Bxpb55oEYX9Ev
   w==;
X-CSE-ConnectionGUID: m2nHAt6HQAefKg0z5ToNLw==
X-CSE-MsgGUID: v+qDY84IR6qsbqs9ZIrQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98388726"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="98388726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:49:02 -0700
X-CSE-ConnectionGUID: Sl865bNeTpe41c2LllwUcw==
X-CSE-MsgGUID: AN1fiq2hS5+LO4JHAFzQRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263074639"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Aug 2026 04:49:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtOV0-00000000NBz-0IWq;
	Mon, 10 Aug 2026 11:48:58 +0000
Date: Mon, 10 Aug 2026 19:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:3-6:
 ERROR: invalid reference to the index variable of the iterator on line 1702
Message-ID: <202608101949.1TGzURaT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Ripan Deuri <quic_rdeuri@quicinc.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
CC: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 5d2df2aa84303a187b82ca048ae28709bef85f77 wifi: ath12k: Move srng processing to wifi7 directory
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: i386-randconfig-052-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101949.1TGzURaT-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5d2df2aa8430 ("wifi: ath12k: Move srng processing to wifi7 directory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608101949.1TGzURaT-lkp@intel.com/

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
