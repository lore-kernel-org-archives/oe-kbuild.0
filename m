Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20718259C82
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727591; cv=none; b=gYMHppd/mE+CVzUxSR4fSQ/VPYv5ll8VyiqhDAbSvg5wy6PGp94AW0y0C8AitJ6RwjRBb0T7CILNChSd8odQUgSzGgxmAsXQ291g3X/ATfYLOInn22kMZcNPpW5GT4jWTS4WFdpVY5jT/ajfYWArFtN0bDufywUaZpyMeCCh15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727591; c=relaxed/simple;
	bh=RTZGoYaj4KcXtwj8lPu669TPh+AeHlFEsoCpg36Gyv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJAoHzkFk1y9IGIlted003ZLEO1vWFWBWzNPoM17i1Srcy8OIeMt5nEqVbbz7XCvQCUw4WIVf+JiYQorrEKQwoLOu2oL5ODjYjM0Y0r9io+AT/bm+sfXv92h38bVv1n8GeJxFvikC90VS9XWN2P83WfXjnQXtqBiP2YP1GksZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV532SIa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV532SIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777727590; x=1809263590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTZGoYaj4KcXtwj8lPu669TPh+AeHlFEsoCpg36Gyv4=;
  b=KV532SIaqvVhq9ArbCEp2xZXuJc6sSi7W9kqKVhZvGINY0Op1r3z0j+a
   vOS/P74zap37hVzOP3uAV0rmhPRYmfi6+21yGhf6YzknPdKtszTu3YWce
   l9OGc58ufUOU/Qv1WUfGyjYIyYf8ikYINt/dB0GZM+26qorLVnZQjX39J
   5sKBmihUwx3wqHE20QLzaProiynq1rgZ8ZONj2KPPCesBhZB+9ANgKC/m
   b1PV69BrcYIUciuGxye0GRChWbfq7iaJovAa0jkbT5D9NpNDE2z8Itxwx
   3W100wXPbxRER7FaDYIt4BzgLpygep7r4ei9kFYsPzedlk9SzLamLuxKY
   g==;
X-CSE-ConnectionGUID: w1z9BMQeTh2KjjdNqqKtqA==
X-CSE-MsgGUID: fi+oOpWTSnGBmuEszgKr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82268899"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="82268899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 06:13:10 -0700
X-CSE-ConnectionGUID: akou27lhQ62P2AsCQHdw6w==
X-CSE-MsgGUID: qvT3wMWZR8GV+4Po3UDYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235355875"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 May 2026 06:13:08 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJA9Z-000000001Pd-0Mjj;
	Sat, 02 May 2026 13:13:05 +0000
Date: Sat, 2 May 2026 21:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] bitfield: wire __bf_shf to __builtin_ctzll
Message-ID: <202605022150.8Jv9y4LN-lkp@intel.com>
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
In-Reply-To: <20260427225705.418802-1-ynorov@nvidia.com>
References: <20260427225705.418802-1-ynorov@nvidia.com>
TO: Yury Norov <ynorov@nvidia.com>
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
CC: Frank Binns <frank.binns@imgtec.com>
CC: Alessio Belle <alessio.belle@imgtec.com>
CC: Brajesh Gupta <brajesh.gupta@imgtec.com>
CC: Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: Vincent Mailhol <mailhol@kernel.org>
CC: Matt Coster <matt.coster@imgtec.com>

Hi Yury,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitfield-wire-__bf_shf-to-__builtin_ctzll/20260428-114754
base:   linus/master
patch link:    https://lore.kernel.org/r/20260427225705.418802-1-ynorov%40nvidia.com
patch subject: [PATCH] bitfield: wire __bf_shf to __builtin_ctzll
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260502/202605022150.8Jv9y4LN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605022150.8Jv9y4LN-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:1655 ath11k_htt_backpressure_event_handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.umac_ring_bp_stats' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1662 ath11k_htt_backpressure_event_handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.lmac_ring_bp_stats' [r] (local cap)
drivers/net/wireless/ath/ath11k/dp_rx.c:1662 ath11k_htt_backpressure_event_handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.lmac_ring_bp_stats[ring_id]' [r] (local cap)

vim +1655 drivers/net/wireless/ath/ath11k/dp_rx.c

d5c65159f28953 Kalle Valo 2019-11-23  1627  
678e8414bf4ead Sriram R   2020-03-16  1628  static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
678e8414bf4ead Sriram R   2020-03-16  1629  						  struct sk_buff *skb)
678e8414bf4ead Sriram R   2020-03-16  1630  {
678e8414bf4ead Sriram R   2020-03-16  1631  	u32 *data = (u32 *)skb->data;
71fbc847978f51 Sriram R   2020-06-11  1632  	u8 pdev_id, ring_type, ring_id, pdev_idx;
678e8414bf4ead Sriram R   2020-03-16  1633  	u16 hp, tp;
678e8414bf4ead Sriram R   2020-03-16  1634  	u32 backpressure_time;
71fbc847978f51 Sriram R   2020-06-11  1635  	struct ath11k_bp_stats *bp_stats;
678e8414bf4ead Sriram R   2020-03-16  1636  
678e8414bf4ead Sriram R   2020-03-16  1637  	pdev_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_PDEV_ID_M, *data);
678e8414bf4ead Sriram R   2020-03-16  1638  	ring_type = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_TYPE_M, *data);
678e8414bf4ead Sriram R   2020-03-16  1639  	ring_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_ID_M, *data);
678e8414bf4ead Sriram R   2020-03-16  1640  	++data;
678e8414bf4ead Sriram R   2020-03-16  1641  
678e8414bf4ead Sriram R   2020-03-16  1642  	hp = FIELD_GET(HTT_BACKPRESSURE_EVENT_HP_M, *data);
678e8414bf4ead Sriram R   2020-03-16  1643  	tp = FIELD_GET(HTT_BACKPRESSURE_EVENT_TP_M, *data);
678e8414bf4ead Sriram R   2020-03-16  1644  	++data;
678e8414bf4ead Sriram R   2020-03-16  1645  
678e8414bf4ead Sriram R   2020-03-16  1646  	backpressure_time = *data;
678e8414bf4ead Sriram R   2020-03-16  1647  
fc3b984a7d99bc Kalle Valo 2023-06-09  1648  	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "backpressure event, pdev %d, ring type %d,ring id %d, hp %d tp %d, backpressure time %d\n",
678e8414bf4ead Sriram R   2020-03-16  1649  		   pdev_id, ring_type, ring_id, hp, tp, backpressure_time);
71fbc847978f51 Sriram R   2020-06-11  1650  
71fbc847978f51 Sriram R   2020-06-11  1651  	if (ring_type == HTT_BACKPRESSURE_UMAC_RING_TYPE) {
71fbc847978f51 Sriram R   2020-06-11  1652  		if (ring_id >= HTT_SW_UMAC_RING_IDX_MAX)
71fbc847978f51 Sriram R   2020-06-11  1653  			return;
71fbc847978f51 Sriram R   2020-06-11  1654  
71fbc847978f51 Sriram R   2020-06-11 @1655  		bp_stats = &ab->soc_stats.bp_stats.umac_ring_bp_stats[ring_id];
71fbc847978f51 Sriram R   2020-06-11  1656  	} else if (ring_type == HTT_BACKPRESSURE_LMAC_RING_TYPE) {
71fbc847978f51 Sriram R   2020-06-11  1657  		pdev_idx = DP_HW2SW_MACID(pdev_id);
71fbc847978f51 Sriram R   2020-06-11  1658  
71fbc847978f51 Sriram R   2020-06-11  1659  		if (ring_id >= HTT_SW_LMAC_RING_IDX_MAX || pdev_idx >= MAX_RADIOS)
71fbc847978f51 Sriram R   2020-06-11  1660  			return;
71fbc847978f51 Sriram R   2020-06-11  1661  
71fbc847978f51 Sriram R   2020-06-11 @1662  		bp_stats = &ab->soc_stats.bp_stats.lmac_ring_bp_stats[ring_id][pdev_idx];
71fbc847978f51 Sriram R   2020-06-11  1663  	} else {
71fbc847978f51 Sriram R   2020-06-11  1664  		ath11k_warn(ab, "unknown ring type received in htt bp event %d\n",
71fbc847978f51 Sriram R   2020-06-11  1665  			    ring_type);
71fbc847978f51 Sriram R   2020-06-11  1666  		return;
71fbc847978f51 Sriram R   2020-06-11  1667  	}
71fbc847978f51 Sriram R   2020-06-11  1668  
71fbc847978f51 Sriram R   2020-06-11  1669  	spin_lock_bh(&ab->base_lock);
71fbc847978f51 Sriram R   2020-06-11  1670  	bp_stats->hp = hp;
71fbc847978f51 Sriram R   2020-06-11  1671  	bp_stats->tp = tp;
71fbc847978f51 Sriram R   2020-06-11  1672  	bp_stats->count++;
71fbc847978f51 Sriram R   2020-06-11  1673  	bp_stats->jiffies = jiffies;
71fbc847978f51 Sriram R   2020-06-11  1674  	spin_unlock_bh(&ab->base_lock);
678e8414bf4ead Sriram R   2020-03-16  1675  }
678e8414bf4ead Sriram R   2020-03-16  1676  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
