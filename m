Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB723EAAF
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 05:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767850898; cv=none; b=sEF+1d0Gil1KEY1ae/+6Umj7uPQOHfgI5pNh7inWcHvihEaxvRWHOqTd8gZWhRDkATvHysWfPelY3XpdfQAJ29Rs75bgjdm76JNjVfCRHieNc10clD2p3ICYTgUIY52hXzpX140UKDbeoJV0I69K8hZgACbZtzVdX59exuooUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767850898; c=relaxed/simple;
	bh=ZN12qU505waS6nuRDXvSeoX7mc7GK2HHDBvf0m8Qx4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GOz+FPILg5KagpZNsLhTr9C6Gf4sXDQiwk45I1FEftZL3BKLLksBdThvFhsceoPrsePX5aEuVpWyZyryKEiBSuG02IyOTeKA9tyi/W6YZSnXBvjhf7V9USc/nRUGtw3znVktWf7u1jErM1yM9ebqbvtDd3d+eXXZLb72YS7ZCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh4awKrM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh4awKrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767850896; x=1799386896;
  h=date:from:to:cc:subject:message-id;
  bh=ZN12qU505waS6nuRDXvSeoX7mc7GK2HHDBvf0m8Qx4U=;
  b=Sh4awKrMNalEQJOVbf2DbBFvU7FKrjLH2ldHLiqhcgt96F9t/H7mdXht
   sx8t3kMiMS4pkojb8/ej0Xt+nWqWpgPfNVRim0tOckiaCJ9mllyHxoMiF
   Srehs75z6TuSBhn1GHUH5fYoCDOToxYN28oSMNUEvFQ5sFvdPhHE4ejyK
   0E4wYmf9GerLXqToXgGqjnf/o4Myfjcq6WqZZYiduw522lLqkKVuhll5m
   WQf/+Dtf2vqt88jF69NxZHmQf9zLoGIjxzGceNHKJntYUJkUfTQVQrozP
   0u06AWQmoiVa3eBi1CTouxpO3xpQEFMEUmo51sPX9bYowXt57WCdcSUD+
   A==;
X-CSE-ConnectionGUID: D8AeQX/7QKGVkMz5mXRRXQ==
X-CSE-MsgGUID: VZqGxg+rQyCuvrrFWXclyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86813569"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="86813569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 21:41:35 -0800
X-CSE-ConnectionGUID: UXyrz+l3SES4oeVBqyXhTQ==
X-CSE-MsgGUID: T7ECm4SrQ3SHYsK8W8tMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202896346"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2026 21:41:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdim3-000000004Qu-3lOI;
	Thu, 08 Jan 2026 05:41:31 +0000
Date: Thu, 08 Jan 2026 13:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 28/4438]
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1712:3-6: ERROR: invalid
 reference to the index variable of the iterator on line 1702
Message-ID: <202601081310.iz9Ibez7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Ripan Deuri <quic_rdeuri@quicinc.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
CC: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: 5d2df2aa84303a187b82ca048ae28709bef85f77 [28/4438] wifi: ath12k: Move srng processing to wifi7 directory
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20260107 (https://download.01.org/0day-ci/archive/20260108/202601081310.iz9Ibez7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601081310.iz9Ibez7-lkp@intel.com/

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
