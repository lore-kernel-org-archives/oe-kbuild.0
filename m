Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183208;
	b=PPL2QgvPzO/EkqgKFEDH85kHbuoEcFIT4ZTkVQO+Ucd+qxvFQp95eGZV6TPbjgCF69R5
	 QU6DNUgaEKD/aN5AKBhUyBJZG+vg3Qvro53IVsp0LCstH+6sWXElgufpjtAUxd9XMQLlp
	 x1vC5IwFoOVagJvG0sHzP/PC37mtjoKAfG9TyHgNkWBkwmBI9I+wBRXD3dJf9jIUQQfEB
	 oT+F/VuPmcv6lgS3dpkbyJYKg4xUu98TlBGMS608oO1ne6WoBOyBpthu4szA6SWBrXbFK
	 sYkygNMB/S9N4QS4A5XPmTj3PunR5ZFr37og+Pw/Nm8Nst07YHNWcpgtHWbjWra7u6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1BkM8f6hTcpOLGguIITkmM4mErXaMJ683Lt47tveI1M=;
	b=sd1ZqV0NS1UenjUy1RthlkOT5Ar1iQSDF4ddE4HcYszznt+aqK523/i+JS5FK1RjCkDO
	 0qIU+a4FjhN+mKbbroNaiWqpRW/kBY6DiFOqWRBQ8ct0rXYsVsfYRdT4lX6xAc+GmVWc4
	 asitpfwOgZdGb26gzNf2nWhTMb9Jg1o72VPHub/0ImdcMfogEm/AMTOt9g+m/tR7eka2j
	 LS6Mh6X4dCtgYlYHC0lIcLj8ezkK/H1y6vbaHJltwUai6hJRUnbxEUZWlITgzbNP8i7LM
	 BvnGGTCMVBR111Nhf39uPT2BdZv6Ggirzqrr/Jmw932i0U/vRxMelo8eol8ATut8L+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eoHHygeB;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376B606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 10:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C376B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eoHHygeB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793183206; x=1824719206;
  h=date:from:to:cc:subject:message-id;
  bh=X6/JIIUW9bVjmgtMCmlwcD0D7xz7Z3VO2OFoTCYQFjM=;
  b=eoHHygeBFDNj+jkNkV9IbVcjgoVLekVl/067yNM+Heja+pNHB0WcJk+7
   qiDznzSYDO1ibed5/44ofd7miRwKMu1nL7lrE3D5gAfnFgXjA+B+H+3FQ
   vlslA3TfPVmkn34h6qF3QfHyUIR7ZZhVmoSU77cE3IJdEIGFgjWOMyhWH
   tbzMJWguYqqUJLss1HZShg2inHewQk27HH8P/IWaC/BPgTEZNaQw7+skk
   Kw+kgI1W5kcXtJDt5RM+7t97U4aPqXFSig1InACa74i9iQ0Z6fHPgt1go
   K//JMhzn4dsZkj4qgpvQVQXHIyWwJpdmhpGnsjqzhX/kkscPQvYB1v3Pp
   Q==;
X-CSE-ConnectionGUID: 40ZvI/31SRK0SrVvxbSG7A==
X-CSE-MsgGUID: i8sPd7rPTpOpyl+K4eKAzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1801646"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1801646"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:26:45 -0700
X-CSE-ConnectionGUID: jHQZJRO2SSaCU9eofSVUNQ==
X-CSE-MsgGUID: 5NpW5OhXQdKOcE1ja+IrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5321286"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2026 03:26:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM0rh-000000004pz-3K58;
	Wed, 28 Oct 2026 10:26:41 +0000
Date: Wed, 28 Oct 2026 11:25:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [alobakin:libeth 2/10]
 drivers/net/ethernet/intel/ice/ice_xsk.c:905 ice_xmit_zc() error: we
 previously assumed 'xctx.ts_ring' could be null (see line 898)
Message-ID: <202610281121.DETM1zSp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux libeth
head:   3ec9e9b6c3814a1b55faddacd55112935868722c
commit: cc74882e6f96d8c3ce10cef17b0fb559886f980d [2/10] ice: add Tx launch time XSk Tx metadata
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: loongarch-randconfig-r2202-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281121.DETM1zSp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610281121.DETM1zSp-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_xsk.c:905 ice_xmit_zc() error: we previously assumed 'xctx.ts_ring' could be null (see line 898)

vim +905 drivers/net/ethernet/intel/ice/ice_xsk.c

2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  844  
126cdfe1007acb Maciej Fijalkowski     2022-01-25  845  /**
126cdfe1007acb Maciej Fijalkowski     2022-01-25  846   * ice_xmit_zc - take entries from XSK Tx ring and place them onto HW Tx ring
126cdfe1007acb Maciej Fijalkowski     2022-01-25  847   * @xdp_ring: XDP ring to produce the HW Tx descriptors on
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  848   * @xsk_pool: AF_XDP buffer pool pointer
126cdfe1007acb Maciej Fijalkowski     2022-01-25  849   *
126cdfe1007acb Maciej Fijalkowski     2022-01-25  850   * Returns true if there is no more work that needs to be done, false otherwise
126cdfe1007acb Maciej Fijalkowski     2022-01-25  851   */
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  852  bool ice_xmit_zc(struct ice_tx_ring *xdp_ring, struct xsk_buff_pool *xsk_pool)
126cdfe1007acb Maciej Fijalkowski     2022-01-25  853  {
126cdfe1007acb Maciej Fijalkowski     2022-01-25  854  	u32 nb_pkts, nb_processed = 0;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  855  	struct ice_xsk_xmit_ctx xctx;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  856  	struct xdp_desc *descs;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  857  	u64 total_bytes;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  858  	u32 budget;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  859  
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  860  	ice_clean_xdp_irq_zc(xdp_ring, xsk_pool);
29322791bc8b4f Maciej Fijalkowski     2022-09-01  861  
ec145a18687fec Michal Kubiak          2024-07-26  862  	if (!netif_carrier_ok(xdp_ring->vsi->netdev) ||
ec145a18687fec Michal Kubiak          2024-07-26  863  	    !netif_running(xdp_ring->vsi->netdev))
ec145a18687fec Michal Kubiak          2024-07-26  864  		return true;
ec145a18687fec Michal Kubiak          2024-07-26  865  
29322791bc8b4f Maciej Fijalkowski     2022-09-01  866  	budget = ICE_DESC_UNUSED(xdp_ring);
29322791bc8b4f Maciej Fijalkowski     2022-09-01  867  	budget = min_t(u16, budget, ICE_RING_QUARTER(xdp_ring));
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  868  
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  869  	nb_pkts = xsk_tx_peek_release_desc_batch(xsk_pool, budget);
126cdfe1007acb Maciej Fijalkowski     2022-01-25  870  	if (!nb_pkts)
126cdfe1007acb Maciej Fijalkowski     2022-01-25  871  		return true;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  872  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  873  	descs = xsk_pool->tx_descs;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  874  	total_bytes = 0;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  875  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  876  	xctx = (struct ice_xsk_xmit_ctx){
cc74882e6f96d8 Alexander Lobakin      2026-10-12  877  		.xdp_ring		= xdp_ring,
cc74882e6f96d8 Alexander Lobakin      2026-10-12  878  		.xdp_ntu		= xdp_ring->next_to_use,
cc74882e6f96d8 Alexander Lobakin      2026-10-12  879  	};
cc74882e6f96d8 Alexander Lobakin      2026-10-12  880  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  881  	if (ice_is_txtime_cfg(xdp_ring)) {
cc74882e6f96d8 Alexander Lobakin      2026-10-12  882  		xctx.ts_ring = xdp_ring->tstamp_ring;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  883  		xctx.ts_ntu = xctx.ts_ring->next_to_use;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  884  	}
cc74882e6f96d8 Alexander Lobakin      2026-10-12  885  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  886  	if (xctx.xdp_ntu + nb_pkts >= xdp_ring->count) {
cc74882e6f96d8 Alexander Lobakin      2026-10-12  887  		nb_processed = xdp_ring->count - xctx.xdp_ntu;
cc74882e6f96d8 Alexander Lobakin      2026-10-12  888  		total_bytes += ice_fill_tx_hw_ring(&xctx, xsk_pool, descs,
cc74882e6f96d8 Alexander Lobakin      2026-10-12  889  						   nb_processed);
cc74882e6f96d8 Alexander Lobakin      2026-10-12  890  		xctx.xdp_ntu = 0;
126cdfe1007acb Maciej Fijalkowski     2022-01-25  891  	}
126cdfe1007acb Maciej Fijalkowski     2022-01-25  892  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  893  	total_bytes += ice_fill_tx_hw_ring(&xctx, xsk_pool,
cc74882e6f96d8 Alexander Lobakin      2026-10-12  894  					   &descs[nb_processed],
cc74882e6f96d8 Alexander Lobakin      2026-10-12  895  					   nb_pkts - nb_processed);
cc74882e6f96d8 Alexander Lobakin      2026-10-12  896  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  897  	xdp_ring->next_to_use = xctx.xdp_ntu;
cc74882e6f96d8 Alexander Lobakin      2026-10-12 @898  	if (xctx.ts_ring)
cc74882e6f96d8 Alexander Lobakin      2026-10-12  899  		xctx.ts_ring->next_to_use = xctx.ts_ntu;
126cdfe1007acb Maciej Fijalkowski     2022-01-25  900  
29322791bc8b4f Maciej Fijalkowski     2022-09-01  901  	ice_set_rs_bit(xdp_ring);
cc74882e6f96d8 Alexander Lobakin      2026-10-12  902  	dma_wmb();
cc74882e6f96d8 Alexander Lobakin      2026-10-12  903  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  904  	if (xctx.ts_cnt)
cc74882e6f96d8 Alexander Lobakin      2026-10-12 @905  		writel_relaxed(xctx.ts_ntu, xctx.ts_ring->tail);
cc74882e6f96d8 Alexander Lobakin      2026-10-12  906  
cc74882e6f96d8 Alexander Lobakin      2026-10-12  907  	if (xctx.xdp_cnt != xctx.ts_cnt)
cc74882e6f96d8 Alexander Lobakin      2026-10-12  908  		writel_relaxed(xctx.xdp_ntu, xdp_ring->tail);
cc74882e6f96d8 Alexander Lobakin      2026-10-12  909  
126cdfe1007acb Maciej Fijalkowski     2022-01-25  910  	ice_update_tx_ring_stats(xdp_ring, nb_pkts, total_bytes);
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  911  
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  912  	if (xsk_uses_need_wakeup(xsk_pool))
ebc33a3f8d0aed Maciej Fijalkowski     2024-07-26  913  		xsk_set_tx_need_wakeup(xsk_pool);
5fa23e0b23fb14 Krzysztof Kazimierczak 2020-02-13  914  
126cdfe1007acb Maciej Fijalkowski     2022-01-25  915  	return nb_pkts < budget;
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  916  }
2d4238f5569722 Krzysztof Kazimierczak 2019-11-04  917  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
