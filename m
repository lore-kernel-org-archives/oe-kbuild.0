Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606778;
	b=sG/0t38VgxeDgwZlY7Nqn9lytG8wNEdx4lSjMc23b8Tf5O34Nv/zcj+0n4HPvxxzORLQ
	 T8Vo7zeMAdXvFL1/GSW4tVFlLmUiPjXGUplq/KvzdQLVJ9vMKDpqeqi9UiR2QAt+JNGht
	 daUUj+v7VwoH/acGRdimfsfAou9gz5XIZDxN4PBnZ3p58bt4lhp90Zy6DCuO/iLtLfNYd
	 6lfmIxfngbxZVCfpxMVJa+7i6OYY9shWSNCjvp7eFzZQ/DGFYK29uCb4XL80+x5AoqIJe
	 C/ko+0h+NMlmc2L8qd9WyZIOa6Km7+YjoyqeQH4CU5BChYoLXgxoM2SxckP0mtc3QhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606778;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dVnXYfPZiDr5ULZyiELOYrTIQcdrNt044cy7SB2zaTY=;
	b=hROdxhY2XfQjmvPnplUzNR7ofZdUcdbXnh0wbO8YIf9ENzSjtbmJ7CsuKpzjEQqpkB9x
	 oRhmaJapU1qLiJJg0XA8VGr1B2y8znaJOQ2RuN6YOquLLrr/syS19FqS4avG14hHREsR4
	 33zr2PD8bKQCgRjg7T0ETIaYi23eiboW6OEdBTLcZ7JHerSXwdKJ5dSHqV2mzpzkuT7R3
	 kIjWsklGXsgDkj35Qul+BDoAuCeX44Wd5+jgBb1ho2YSoNzLKfQpcX8uf1T6uuHI8xA/9
	 2fK91QwIbhbWGskOmjvcelwAgdQzhOAqFaJmOTOXD9lT+Q3FxTe54yaUd0TwrXGDqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLaIvdx7;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E128C606A31E
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 11:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E128C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLaIvdx7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795606778; x=1827142778;
  h=date:from:to:cc:subject:message-id;
  bh=oD8E4skDw437juNwkPdtPc8H52nhfubUozw0BwWdYGI=;
  b=dLaIvdx70Qy4oFf1G+eoUoeoUCWJKBvPprIDEE0nbakq92th7027nMCg
   YFyh/xjSo95ZGHsAFu5uQddulxAG7LnIlvnImgjlfmeRkjy1EM+WMR23H
   2pIvn3Oyu5jQrJXYDPgyw5IVco0vUAX1GckK/+rGwBA892wvkpk25SzpS
   fCceILCRxgvNSz1pws7r5bolyxSPwfjHvBJfkSkPF5Es4PsHsilVMjlMJ
   XcKfpV+gY0Fo3o09uPWJFkZydJF02iyH2YdCjY1E3nDFNtc0xwgRqe0VR
   op4FaPAwv6H7EgZmryqxelK0G3RNgTa3zuzPZdgDWMfCfLzuY5HDKn9fQ
   Q==;
X-CSE-ConnectionGUID: sc9QZmytSHWq1vcJZfF8xg==
X-CSE-MsgGUID: M9MOJYTDQ3qIrBg0vsM/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4519376"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4519376"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 03:39:37 -0800
X-CSE-ConnectionGUID: 9hJr41M5Rz6N5LK+gaqz3g==
X-CSE-MsgGUID: CQM9PadYQ4C/Urr5/Yjenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11824739"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 03:39:36 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWBLY-0000000007T-3SNa;
	Wed, 25 Nov 2026 11:39:32 +0000
Date: Wed, 25 Nov 2026 12:39:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:3-6:
 ERROR: invalid reference to the index variable of the iterator on line 1702
Message-ID: <20261125122832.glgFTcGL-lkp@intel.com>
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
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-2103-20261124 (https://download.01.org/0day-ci/archive/20261125/20261125122832.glgFTcGL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5d2df2aa8430 ("wifi: ath12k: Move srng processing to wifi7 directory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261125122832.glgFTcGL-lkp@intel.com/

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
