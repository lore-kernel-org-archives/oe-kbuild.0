Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485FA3DF003
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493254; cv=none; b=WwSAsJOQKBvzeP6JPfKj/yV2oHmFdB0wWGHrxI8ejDPjyIuODhTVLaUxXlkD1VH/flXdXLYxWrHHX0T0hCjKzaFECtN8la5kXhJ1J8TasbMTZdzj7iQ77/SmxF+YFEPnxklmOubhWNvQn077JqaeMBxW7ZOAdAfpovERmoIFQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493254; c=relaxed/simple;
	bh=2Cx9Kx+eHbBnq6ocRI/w9z3DbGyS81iPQ9k2WexjZpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYVUodQSR1aQYHDhx4XrLLHlcdhItphGfj56QJyVTSFA9mj6jQxyoh04F/cSwRQjJXTHpbcuQeF2hUE9AlXfY4M2k/EXCwUI+2yMFK+IaL2wvJc/TiZIQuTOuewzi1DTttEhs4GMdNUh7P1Ya9UFmeCHDqkXVkTExtjAHr8GWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhrghoFJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhrghoFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782493253; x=1814029253;
  h=date:from:to:cc:subject:message-id;
  bh=2Cx9Kx+eHbBnq6ocRI/w9z3DbGyS81iPQ9k2WexjZpk=;
  b=OhrghoFJGEDbfDd9K4SjxpyXqkx+1uBGBjTyEPEC/vxZnNlimzWxbOcl
   oe/Rh3DUah5YD3u2EGhYWcz8DjAzHmQSV9dJaoA6Fr2bZXY2wj0GaK0x3
   78fKz4MaCNLLwh/8ad0ZsUkelIOTSbm2/YEqvxg0ovA1CY6CUA7mk2eXY
   /ZA6nfwrKRVCQ+e0dX5UotgUC57Z9dbN6wTgR1xnUYdlszryY2Af6H6Ea
   S0EAH1yEVsO9+LhnC99q6TJ5da+wDk7IMBcW2zcHOknFJOps49CGTSqcl
   X86w5DXMA+TbCxrQX0EpVZDTzitVVSYvRJODmn8n6DrtGDEthuRNDSh/s
   g==;
X-CSE-ConnectionGUID: VQhoElbTRM6sBynhkGMWWA==
X-CSE-MsgGUID: sAdmEJ6sR8qBeRpq8vUO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94439059"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="94439059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 10:00:52 -0700
X-CSE-ConnectionGUID: S4oeYyQvRGuFUT0sDi1QnQ==
X-CSE-MsgGUID: bLr2RMaBSdCBtujE9X5c0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="254980557"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Jun 2026 10:00:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd9v5-000000005H3-47E2;
	Fri, 26 Jun 2026 17:00:47 +0000
Date: Sat, 27 Jun 2026 01:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/emt 2/2]
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2098:75: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202606270049.bFfzE6vZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2098:75: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: 2da8fe5a1092edb8ab2dcac37e5a8ba052e5312e [2/2] bnxt_en: Fix ethtool -d byte order for 32-bit values
:::::: branch date: 4 weeks ago
:::::: commit date: 1 year, 2 months ago
config: csky-randconfig-r111-20260626 (https://download.01.org/0day-ci/archive/20260627/202606270049.bFfzE6vZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270049.bFfzE6vZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606270049.bFfzE6vZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2098:75: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2108:27: sparse: signed value source

vim +2098 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c

2da8fe5a1092ed Michael Chan     2025-04-28  2054  
b5d600b027eb27 Vasundhara Volam 2020-07-27  2055  static void bnxt_get_regs(struct net_device *dev, struct ethtool_regs *regs,
b5d600b027eb27 Vasundhara Volam 2020-07-27  2056  			  void *_p)
b5d600b027eb27 Vasundhara Volam 2020-07-27  2057  {
b5d600b027eb27 Vasundhara Volam 2020-07-27  2058  	struct pcie_ctx_hw_stats *hw_pcie_stats;
bbf33d1d9805fc Edwin Peer       2021-08-29  2059  	struct hwrm_pcie_qstats_input *req;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2060  	struct bnxt *bp = netdev_priv(dev);
b5d600b027eb27 Vasundhara Volam 2020-07-27  2061  	dma_addr_t hw_pcie_stats_addr;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2062  	int rc;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2063  
b5d600b027eb27 Vasundhara Volam 2020-07-27  2064  	regs->version = 0;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2065  	bnxt_dbg_hwrm_rd_reg(bp, 0, BNXT_PXP_REG_LEN / 4, _p);
b5d600b027eb27 Vasundhara Volam 2020-07-27  2066  
b5d600b027eb27 Vasundhara Volam 2020-07-27  2067  	if (!(bp->fw_cap & BNXT_FW_CAP_PCIE_STATS_SUPPORTED))
b5d600b027eb27 Vasundhara Volam 2020-07-27  2068  		return;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2069  
bbf33d1d9805fc Edwin Peer       2021-08-29  2070  	if (hwrm_req_init(bp, req, HWRM_PCIE_QSTATS))
b5d600b027eb27 Vasundhara Volam 2020-07-27  2071  		return;
b5d600b027eb27 Vasundhara Volam 2020-07-27  2072  
bbf33d1d9805fc Edwin Peer       2021-08-29  2073  	hw_pcie_stats = hwrm_req_dma_slice(bp, req, sizeof(*hw_pcie_stats),
bbf33d1d9805fc Edwin Peer       2021-08-29  2074  					   &hw_pcie_stats_addr);
bbf33d1d9805fc Edwin Peer       2021-08-29  2075  	if (!hw_pcie_stats) {
bbf33d1d9805fc Edwin Peer       2021-08-29  2076  		hwrm_req_drop(bp, req);
bbf33d1d9805fc Edwin Peer       2021-08-29  2077  		return;
bbf33d1d9805fc Edwin Peer       2021-08-29  2078  	}
bbf33d1d9805fc Edwin Peer       2021-08-29  2079  
b5d600b027eb27 Vasundhara Volam 2020-07-27  2080  	regs->version = 1;
bbf33d1d9805fc Edwin Peer       2021-08-29  2081  	hwrm_req_hold(bp, req); /* hold on to slice */
bbf33d1d9805fc Edwin Peer       2021-08-29  2082  	req->pcie_stat_size = cpu_to_le16(sizeof(*hw_pcie_stats));
bbf33d1d9805fc Edwin Peer       2021-08-29  2083  	req->pcie_stat_host_addr = cpu_to_le64(hw_pcie_stats_addr);
bbf33d1d9805fc Edwin Peer       2021-08-29  2084  	rc = hwrm_req_send(bp, req);
b5d600b027eb27 Vasundhara Volam 2020-07-27  2085  	if (!rc) {
2da8fe5a1092ed Michael Chan     2025-04-28  2086  		u8 *dst = (u8 *)(_p + BNXT_PXP_REG_LEN);
2da8fe5a1092ed Michael Chan     2025-04-28  2087  		u8 *src = (u8 *)hw_pcie_stats;
2da8fe5a1092ed Michael Chan     2025-04-28  2088  		int i, j;
2da8fe5a1092ed Michael Chan     2025-04-28  2089  
2da8fe5a1092ed Michael Chan     2025-04-28  2090  		for (i = 0, j = 0; i < sizeof(*hw_pcie_stats); ) {
2da8fe5a1092ed Michael Chan     2025-04-28  2091  			if (i >= bnxt_pcie_32b_entries[j].start &&
2da8fe5a1092ed Michael Chan     2025-04-28  2092  			    i <= bnxt_pcie_32b_entries[j].end) {
2da8fe5a1092ed Michael Chan     2025-04-28  2093  				u32 *dst32 = (u32 *)(dst + i);
2da8fe5a1092ed Michael Chan     2025-04-28  2094  
2da8fe5a1092ed Michael Chan     2025-04-28  2095  				*dst32 = le32_to_cpu(*(__le32 *)(src + i));
2da8fe5a1092ed Michael Chan     2025-04-28  2096  				i += 4;
2da8fe5a1092ed Michael Chan     2025-04-28  2097  				if (i > bnxt_pcie_32b_entries[j].end &&
2da8fe5a1092ed Michael Chan     2025-04-28 @2098  				    j < ARRAY_SIZE(bnxt_pcie_32b_entries) - 1)
2da8fe5a1092ed Michael Chan     2025-04-28  2099  					j++;
2da8fe5a1092ed Michael Chan     2025-04-28  2100  			} else {
2da8fe5a1092ed Michael Chan     2025-04-28  2101  				u64 *dst64 = (u64 *)(dst + i);
b5d600b027eb27 Vasundhara Volam 2020-07-27  2102  
2da8fe5a1092ed Michael Chan     2025-04-28  2103  				*dst64 = le64_to_cpu(*(__le64 *)(src + i));
2da8fe5a1092ed Michael Chan     2025-04-28  2104  				i += 8;
2da8fe5a1092ed Michael Chan     2025-04-28  2105  			}
2da8fe5a1092ed Michael Chan     2025-04-28  2106  		}
b5d600b027eb27 Vasundhara Volam 2020-07-27  2107  	}
bbf33d1d9805fc Edwin Peer       2021-08-29  2108  	hwrm_req_drop(bp, req);
b5d600b027eb27 Vasundhara Volam 2020-07-27  2109  }
b5d600b027eb27 Vasundhara Volam 2020-07-27  2110  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
