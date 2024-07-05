Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEF21A0B
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720146169; cv=none; b=uGXd370Vh1XSar6QHZdQsAPPHR0YDgEDGODeiSaIpDWhapYaWh1IDugHhn2J6QlSOvqQbZd6rrb1dzSPA+ES2B4S7EZ1W8OQ1p/BlsQTdeIk0W12518r4CfdnOWBpnTtD20wxlCl5cwb94t6mICaQUJBInIALDwMOyd3jpJF5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720146169; c=relaxed/simple;
	bh=50jcc4dmTxhFA0qxUAKOXGheSEcwNl7qAh+5X/EUhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaQE3h71Etw1EqrxSIrwinBWQNaQU0oCL/oWzK1k/ktQ/VLndcew/k1FbYHEtLDOjGARcN+cUTCqS2GZ1l1tts+B3rUH6Yvtziy76MLAchk2QEa+/dRWUc7GlvAucogMOyKKiIFKtokehpGIBusdoh7isnOO/jMsapEdEmm+QkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgvnLQ9V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgvnLQ9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146167; x=1751682167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50jcc4dmTxhFA0qxUAKOXGheSEcwNl7qAh+5X/EUhLw=;
  b=KgvnLQ9VWj3SVsndnM1sF0EbKvlgQwIInTxL/aeW8CUFebjW7ODO83AG
   dhgQvkdG4ljvQaxax0l5oOrexMPcRFWdwvy4C8MnUsym6jN1qDbGZa3Bf
   Z6DlS+oMFDUtqPlYlLOpV4mf1mNNDN24s2HFyfG4pywRzDdZbNdRLNJTd
   riyoclWnYNiBHEijzGiHZalmdcajOZuv2HFGrTb+NbXIXE0zN2UGfz/WZ
   A3fSNrTCV8DNYlFZcSEscoRQTZfJCuyH2m91YNjypdOjiP/QERUhj5v3u
   ndoPe9/0nxqdkueynPrtsz/02JHpPvticf7fcQ2Np8HXon8bplT5HxKhn
   g==;
X-CSE-ConnectionGUID: AxI7xtQzQZa0LC9FF/BvFQ==
X-CSE-MsgGUID: G8uOLcjVScK9nwDt4rai/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17250486"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17250486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:22:46 -0700
X-CSE-ConnectionGUID: pGVowZFeQEaRcTVKgG0IkQ==
X-CSE-MsgGUID: t6+dsgtCQiSshbDg6Id6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51172781"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 19:22:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYaw-000RnC-2W;
	Fri, 05 Jul 2024 02:22:42 +0000
Date: Fri, 5 Jul 2024 10:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v2 09/10] bnxt_en: Increase the max total
 outstanding PTP TX packets to 4
Message-ID: <202407051042.0CQIyPUn-lkp@intel.com>
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
In-Reply-To: <20240628193006.225906-10-michael.chan@broadcom.com>
References: <20240628193006.225906-10-michael.chan@broadcom.com>
TO: Michael Chan <michael.chan@broadcom.com>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Chan/bnxt_en-Add-new-TX-timestamp-completion-definitions/20240630-113445
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240628193006.225906-10-michael.chan%40broadcom.com
patch subject: [PATCH net-next v2 09/10] bnxt_en: Increase the max total outstanding PTP TX packets to 4
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051042.0CQIyPUn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407051042.0CQIyPUn-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:782 bnxt_start_xmit() error: we previously assumed 'ptp' could be null (see line 513)
drivers/net/ethernet/broadcom/bnxt/bnxt.c:782 bnxt_start_xmit() error: uninitialized symbol 'txts_prod'.

Old smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt.c:9798 bnxt_accumulate_all_stats() error: uninitialized symbol 'ring0_stats'.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:9923 bnxt_hwrm_port_qstats_ext() warn: missing error code? 'rc'

vim +/ptp +782 drivers/net/ethernet/broadcom/bnxt/bnxt.c

e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  448  
c0c050c58d8409 Michael Chan       2015-10-22  449  static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
c0c050c58d8409 Michael Chan       2015-10-22  450  {
c0c050c58d8409 Michael Chan       2015-10-22  451  	struct bnxt *bp = netdev_priv(dev);
c1056a59aee1d3 Michael Chan       2023-11-13  452  	struct tx_bd *txbd, *txbd0;
c0c050c58d8409 Michael Chan       2015-10-22  453  	struct tx_bd_ext *txbd1;
c0c050c58d8409 Michael Chan       2015-10-22  454  	struct netdev_queue *txq;
c0c050c58d8409 Michael Chan       2015-10-22  455  	int i;
c0c050c58d8409 Michael Chan       2015-10-22  456  	dma_addr_t mapping;
c0c050c58d8409 Michael Chan       2015-10-22  457  	unsigned int length, pad = 0;
c0c050c58d8409 Michael Chan       2015-10-22  458  	u32 len, free_size, vlan_tag_flags, cfa_action, flags;
0390d5d850ba88 Michael Chan       2024-06-28  459  	struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
c0c050c58d8409 Michael Chan       2015-10-22  460  	struct pci_dev *pdev = bp->pdev;
a695498267c4a9 Pavan Chebbi       2024-06-28  461  	u16 prod, last_frag, txts_prod;
c0c050c58d8409 Michael Chan       2015-10-22  462  	struct bnxt_tx_ring_info *txr;
c0c050c58d8409 Michael Chan       2015-10-22  463  	struct bnxt_sw_tx_bd *tx_buf;
dade5e15fade59 Michael Chan       2021-04-25  464  	__le32 lflags = 0;
c0c050c58d8409 Michael Chan       2015-10-22  465  
c0c050c58d8409 Michael Chan       2015-10-22  466  	i = skb_get_queue_mapping(skb);
c0c050c58d8409 Michael Chan       2015-10-22  467  	if (unlikely(i >= bp->tx_nr_rings)) {
c0c050c58d8409 Michael Chan       2015-10-22  468  		dev_kfree_skb_any(skb);
625788b5844511 Eric Dumazet       2022-03-10  469  		dev_core_stats_tx_dropped_inc(dev);
c0c050c58d8409 Michael Chan       2015-10-22  470  		return NETDEV_TX_OK;
c0c050c58d8409 Michael Chan       2015-10-22  471  	}
c0c050c58d8409 Michael Chan       2015-10-22  472  
c0c050c58d8409 Michael Chan       2015-10-22  473  	txq = netdev_get_tx_queue(dev, i);
a960dec98861b0 Michael Chan       2017-02-06  474  	txr = &bp->tx_ring[bp->tx_ring_map[i]];
c0c050c58d8409 Michael Chan       2015-10-22  475  	prod = txr->tx_prod;
c0c050c58d8409 Michael Chan       2015-10-22  476  
c0c050c58d8409 Michael Chan       2015-10-22  477  	free_size = bnxt_tx_avail(bp, txr);
c0c050c58d8409 Michael Chan       2015-10-22  478  	if (unlikely(free_size < skb_shinfo(skb)->nr_frags + 2)) {
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  479  		/* We must have raced with NAPI cleanup */
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  480  		if (net_ratelimit() && txr->kick_pending)
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  481  			netif_warn(bp, tx_err, dev,
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  482  				   "bnxt: ring busy w/ flush pending!\n");
08a096780d9239 Jakub Kicinski     2023-04-06  483  		if (!netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
08a096780d9239 Jakub Kicinski     2023-04-06  484  					bp->tx_wake_thresh))
c0c050c58d8409 Michael Chan       2015-10-22  485  			return NETDEV_TX_BUSY;
c0c050c58d8409 Michael Chan       2015-10-22  486  	}
c0c050c58d8409 Michael Chan       2015-10-22  487  
b6488b161ab297 Coco Li            2022-12-10  488  	if (unlikely(ipv6_hopopt_jumbo_remove(skb)))
b6488b161ab297 Coco Li            2022-12-10  489  		goto tx_free;
b6488b161ab297 Coco Li            2022-12-10  490  
c0c050c58d8409 Michael Chan       2015-10-22  491  	length = skb->len;
c0c050c58d8409 Michael Chan       2015-10-22  492  	len = skb_headlen(skb);
c0c050c58d8409 Michael Chan       2015-10-22  493  	last_frag = skb_shinfo(skb)->nr_frags;
c0c050c58d8409 Michael Chan       2015-10-22  494  
6d1add95536baf Michael Chan       2023-11-20  495  	txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
c0c050c58d8409 Michael Chan       2015-10-22  496  
6d1add95536baf Michael Chan       2023-11-20  497  	tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
c0c050c58d8409 Michael Chan       2015-10-22  498  	tx_buf->skb = skb;
c0c050c58d8409 Michael Chan       2015-10-22  499  	tx_buf->nr_frags = last_frag;
c0c050c58d8409 Michael Chan       2015-10-22  500  
c0c050c58d8409 Michael Chan       2015-10-22  501  	vlan_tag_flags = 0;
ee5c7fb3404724 Sathya Perla       2017-07-24  502  	cfa_action = bnxt_xmit_get_cfa_action(skb);
c0c050c58d8409 Michael Chan       2015-10-22  503  	if (skb_vlan_tag_present(skb)) {
c0c050c58d8409 Michael Chan       2015-10-22  504  		vlan_tag_flags = TX_BD_CFA_META_KEY_VLAN |
c0c050c58d8409 Michael Chan       2015-10-22  505  				 skb_vlan_tag_get(skb);
c0c050c58d8409 Michael Chan       2015-10-22  506  		/* Currently supports 8021Q, 8021AD vlan offloads
c0c050c58d8409 Michael Chan       2015-10-22  507  		 * QINQ1, QINQ2, QINQ3 vlan headers are deprecated
c0c050c58d8409 Michael Chan       2015-10-22  508  		 */
c0c050c58d8409 Michael Chan       2015-10-22  509  		if (skb->vlan_proto == htons(ETH_P_8021Q))
c0c050c58d8409 Michael Chan       2015-10-22  510  			vlan_tag_flags |= 1 << TX_BD_CFA_META_TPID_SHIFT;
c0c050c58d8409 Michael Chan       2015-10-22  511  	}
c0c050c58d8409 Michael Chan       2015-10-22  512  
0390d5d850ba88 Michael Chan       2024-06-28  513  	if (unlikely(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && ptp &&
0390d5d850ba88 Michael Chan       2024-06-28  514  	    ptp->tx_tstamp_en) {
0390d5d850ba88 Michael Chan       2024-06-28  515  		if (bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP) {
0390d5d850ba88 Michael Chan       2024-06-28  516  			lflags |= cpu_to_le32(TX_BD_FLAGS_STAMP);
0390d5d850ba88 Michael Chan       2024-06-28  517  			tx_buf->is_ts_pkt = 1;
0390d5d850ba88 Michael Chan       2024-06-28  518  			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
0390d5d850ba88 Michael Chan       2024-06-28  519  		} else if (!skb_is_gso(skb)) {
d33dcac825d976 Pavan Chebbi       2024-06-28  520  			u16 seq_id, hdr_off;
d33dcac825d976 Pavan Chebbi       2024-06-28  521  
c790275b5edf5d Vadim Fedorenko    2024-06-04  522  			if (atomic_dec_if_positive(&ptp->tx_avail) < 0) {
165f87691a898a Vadim Fedorenko    2024-05-30  523  				atomic64_inc(&ptp->stats.ts_err);
165f87691a898a Vadim Fedorenko    2024-05-30  524  				goto tx_no_ts;
165f87691a898a Vadim Fedorenko    2024-05-30  525  			}
d33dcac825d976 Pavan Chebbi       2024-06-28  526  
d33dcac825d976 Pavan Chebbi       2024-06-28  527  			if (!bnxt_ptp_parse(skb, &seq_id, &hdr_off)) {
9e26680733d5c6 Michael Chan       2021-08-07  528  				if (vlan_tag_flags)
d33dcac825d976 Pavan Chebbi       2024-06-28  529  					hdr_off += VLAN_HLEN;
83bb623c968e73 Pavan Chebbi       2021-06-27  530  				lflags |= cpu_to_le32(TX_BD_FLAGS_STAMP);
9080043cd23505 Michael Chan       2024-06-28  531  				tx_buf->is_ts_pkt = 1;
83bb623c968e73 Pavan Chebbi       2021-06-27  532  				skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
a695498267c4a9 Pavan Chebbi       2024-06-28  533  
a695498267c4a9 Pavan Chebbi       2024-06-28  534  				spin_lock_bh(&ptp->ptp_tx_lock);
a695498267c4a9 Pavan Chebbi       2024-06-28  535  				txts_prod = ptp->txts_prod;
a695498267c4a9 Pavan Chebbi       2024-06-28  536  				ptp->txts_prod = NEXT_TXTS(txts_prod);
a695498267c4a9 Pavan Chebbi       2024-06-28  537  				spin_unlock_bh(&ptp->ptp_tx_lock);
a695498267c4a9 Pavan Chebbi       2024-06-28  538  
a695498267c4a9 Pavan Chebbi       2024-06-28  539  				ptp->txts_req[txts_prod].tx_seqid = seq_id;
a695498267c4a9 Pavan Chebbi       2024-06-28  540  				ptp->txts_req[txts_prod].tx_hdr_off = hdr_off;
a695498267c4a9 Pavan Chebbi       2024-06-28  541  				tx_buf->txts_prod = txts_prod;
a695498267c4a9 Pavan Chebbi       2024-06-28  542  
83bb623c968e73 Pavan Chebbi       2021-06-27  543  			} else {
83bb623c968e73 Pavan Chebbi       2021-06-27  544  				atomic_inc(&bp->ptp_cfg->tx_avail);
dade5e15fade59 Michael Chan       2021-04-25  545  			}
83bb623c968e73 Pavan Chebbi       2021-06-27  546  		}
dade5e15fade59 Michael Chan       2021-04-25  547  	}
dade5e15fade59 Michael Chan       2021-04-25  548  
165f87691a898a Vadim Fedorenko    2024-05-30  549  tx_no_ts:
83bb623c968e73 Pavan Chebbi       2021-06-27  550  	if (unlikely(skb->no_fcs))
83bb623c968e73 Pavan Chebbi       2021-06-27  551  		lflags |= cpu_to_le32(TX_BD_FLAGS_NO_CRC);
dade5e15fade59 Michael Chan       2021-04-25  552  
83bb623c968e73 Pavan Chebbi       2021-06-27  553  	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
83bb623c968e73 Pavan Chebbi       2021-06-27  554  	    !lflags) {
4419dbe6a0f031 Michael Chan       2016-02-10  555  		struct tx_push_buffer *tx_push_buf = txr->tx_push;
4419dbe6a0f031 Michael Chan       2016-02-10  556  		struct tx_push_bd *tx_push = &tx_push_buf->push_bd;
4419dbe6a0f031 Michael Chan       2016-02-10  557  		struct tx_bd_ext *tx_push1 = &tx_push->txbd2;
697197e5a17353 Michael Chan       2018-10-14  558  		void __iomem *db = txr->tx_db.doorbell;
4419dbe6a0f031 Michael Chan       2016-02-10  559  		void *pdata = tx_push_buf->data;
4419dbe6a0f031 Michael Chan       2016-02-10  560  		u64 *end;
4419dbe6a0f031 Michael Chan       2016-02-10  561  		int j, push_len;
c0c050c58d8409 Michael Chan       2015-10-22  562  
c0c050c58d8409 Michael Chan       2015-10-22  563  		/* Set COAL_NOW to be ready quickly for the next push */
c0c050c58d8409 Michael Chan       2015-10-22  564  		tx_push->tx_bd_len_flags_type =
c0c050c58d8409 Michael Chan       2015-10-22  565  			cpu_to_le32((length << TX_BD_LEN_SHIFT) |
c0c050c58d8409 Michael Chan       2015-10-22  566  					TX_BD_TYPE_LONG_TX_BD |
c0c050c58d8409 Michael Chan       2015-10-22  567  					TX_BD_FLAGS_LHINT_512_AND_SMALLER |
c0c050c58d8409 Michael Chan       2015-10-22  568  					TX_BD_FLAGS_COAL_NOW |
c0c050c58d8409 Michael Chan       2015-10-22  569  					TX_BD_FLAGS_PACKET_END |
c0c050c58d8409 Michael Chan       2015-10-22  570  					(2 << TX_BD_FLAGS_BD_CNT_SHIFT));
c0c050c58d8409 Michael Chan       2015-10-22  571  
c0c050c58d8409 Michael Chan       2015-10-22  572  		if (skb->ip_summed == CHECKSUM_PARTIAL)
c0c050c58d8409 Michael Chan       2015-10-22  573  			tx_push1->tx_bd_hsize_lflags =
c0c050c58d8409 Michael Chan       2015-10-22  574  					cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
c0c050c58d8409 Michael Chan       2015-10-22  575  		else
c0c050c58d8409 Michael Chan       2015-10-22  576  			tx_push1->tx_bd_hsize_lflags = 0;
c0c050c58d8409 Michael Chan       2015-10-22  577  
c0c050c58d8409 Michael Chan       2015-10-22  578  		tx_push1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
ee5c7fb3404724 Sathya Perla       2017-07-24  579  		tx_push1->tx_bd_cfa_action =
ee5c7fb3404724 Sathya Perla       2017-07-24  580  			cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
c0c050c58d8409 Michael Chan       2015-10-22  581  
fbb0fa8b48892a Michael Chan       2016-02-22  582  		end = pdata + length;
fbb0fa8b48892a Michael Chan       2016-02-22  583  		end = PTR_ALIGN(end, 8) - 1;
4419dbe6a0f031 Michael Chan       2016-02-10  584  		*end = 0;
4419dbe6a0f031 Michael Chan       2016-02-10  585  
c0c050c58d8409 Michael Chan       2015-10-22  586  		skb_copy_from_linear_data(skb, pdata, len);
c0c050c58d8409 Michael Chan       2015-10-22  587  		pdata += len;
c0c050c58d8409 Michael Chan       2015-10-22  588  		for (j = 0; j < last_frag; j++) {
c0c050c58d8409 Michael Chan       2015-10-22  589  			skb_frag_t *frag = &skb_shinfo(skb)->frags[j];
c0c050c58d8409 Michael Chan       2015-10-22  590  			void *fptr;
c0c050c58d8409 Michael Chan       2015-10-22  591  
c0c050c58d8409 Michael Chan       2015-10-22  592  			fptr = skb_frag_address_safe(frag);
c0c050c58d8409 Michael Chan       2015-10-22  593  			if (!fptr)
c0c050c58d8409 Michael Chan       2015-10-22  594  				goto normal_tx;
c0c050c58d8409 Michael Chan       2015-10-22  595  
c0c050c58d8409 Michael Chan       2015-10-22  596  			memcpy(pdata, fptr, skb_frag_size(frag));
c0c050c58d8409 Michael Chan       2015-10-22  597  			pdata += skb_frag_size(frag);
c0c050c58d8409 Michael Chan       2015-10-22  598  		}
c0c050c58d8409 Michael Chan       2015-10-22  599  
4419dbe6a0f031 Michael Chan       2016-02-10  600  		txbd->tx_bd_len_flags_type = tx_push->tx_bd_len_flags_type;
4419dbe6a0f031 Michael Chan       2016-02-10  601  		txbd->tx_bd_haddr = txr->data_mapping;
5a3c585fa83f91 Michael Chan       2023-11-13  602  		txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2);
c0c050c58d8409 Michael Chan       2015-10-22  603  		prod = NEXT_TX(prod);
34eec1f29a5998 Michael Chan       2023-11-13  604  		tx_push->tx_bd_opaque = txbd->tx_bd_opaque;
6d1add95536baf Michael Chan       2023-11-20  605  		txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
c0c050c58d8409 Michael Chan       2015-10-22  606  		memcpy(txbd, tx_push1, sizeof(*txbd));
c0c050c58d8409 Michael Chan       2015-10-22  607  		prod = NEXT_TX(prod);
4419dbe6a0f031 Michael Chan       2016-02-10  608  		tx_push->doorbell =
b9e0c47ee2ec58 Michael Chan       2023-11-20  609  			cpu_to_le32(DB_KEY_TX_PUSH | DB_LONG_TX_PUSH |
b9e0c47ee2ec58 Michael Chan       2023-11-20  610  				    DB_RING_IDX(&txr->tx_db, prod));
36647b206c014a Jakub Kicinski     2023-04-11  611  		WRITE_ONCE(txr->tx_prod, prod);
c0c050c58d8409 Michael Chan       2015-10-22  612  
b9a8460a08a1e0 Michael Chan       2016-06-06  613  		tx_buf->is_push = 1;
c0c050c58d8409 Michael Chan       2015-10-22  614  		netdev_tx_sent_queue(txq, skb->len);
b9a8460a08a1e0 Michael Chan       2016-06-06  615  		wmb();	/* Sync is_push and byte queue before pushing data */
c0c050c58d8409 Michael Chan       2015-10-22  616  
4419dbe6a0f031 Michael Chan       2016-02-10  617  		push_len = (length + sizeof(*tx_push) + 7) / 8;
4419dbe6a0f031 Michael Chan       2016-02-10  618  		if (push_len > 16) {
697197e5a17353 Michael Chan       2018-10-14  619  			__iowrite64_copy(db, tx_push_buf, 16);
697197e5a17353 Michael Chan       2018-10-14  620  			__iowrite32_copy(db + 4, tx_push_buf + 1,
9d13744bb75078 Michael Chan       2016-09-05  621  					 (push_len - 16) << 1);
4419dbe6a0f031 Michael Chan       2016-02-10  622  		} else {
697197e5a17353 Michael Chan       2018-10-14  623  			__iowrite64_copy(db, tx_push_buf, push_len);
4419dbe6a0f031 Michael Chan       2016-02-10  624  		}
c0c050c58d8409 Michael Chan       2015-10-22  625  
c0c050c58d8409 Michael Chan       2015-10-22  626  		goto tx_done;
c0c050c58d8409 Michael Chan       2015-10-22  627  	}
c0c050c58d8409 Michael Chan       2015-10-22  628  
c0c050c58d8409 Michael Chan       2015-10-22  629  normal_tx:
c0c050c58d8409 Michael Chan       2015-10-22  630  	if (length < BNXT_MIN_PKT_SIZE) {
c0c050c58d8409 Michael Chan       2015-10-22  631  		pad = BNXT_MIN_PKT_SIZE - length;
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  632  		if (skb_pad(skb, pad))
c0c050c58d8409 Michael Chan       2015-10-22  633  			/* SKB already freed. */
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  634  			goto tx_kick_pending;
c0c050c58d8409 Michael Chan       2015-10-22  635  		length = BNXT_MIN_PKT_SIZE;
c0c050c58d8409 Michael Chan       2015-10-22  636  	}
c0c050c58d8409 Michael Chan       2015-10-22  637  
c0c050c58d8409 Michael Chan       2015-10-22  638  	mapping = dma_map_single(&pdev->dev, skb->data, len, DMA_TO_DEVICE);
c0c050c58d8409 Michael Chan       2015-10-22  639  
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  640  	if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  641  		goto tx_free;
c0c050c58d8409 Michael Chan       2015-10-22  642  
c0c050c58d8409 Michael Chan       2015-10-22  643  	dma_unmap_addr_set(tx_buf, mapping, mapping);
c0c050c58d8409 Michael Chan       2015-10-22  644  	flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
c0c050c58d8409 Michael Chan       2015-10-22  645  		((last_frag + 2) << TX_BD_FLAGS_BD_CNT_SHIFT);
c0c050c58d8409 Michael Chan       2015-10-22  646  
c0c050c58d8409 Michael Chan       2015-10-22  647  	txbd->tx_bd_haddr = cpu_to_le64(mapping);
5a3c585fa83f91 Michael Chan       2023-11-13  648  	txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2 + last_frag);
c0c050c58d8409 Michael Chan       2015-10-22  649  
c0c050c58d8409 Michael Chan       2015-10-22  650  	prod = NEXT_TX(prod);
c0c050c58d8409 Michael Chan       2015-10-22  651  	txbd1 = (struct tx_bd_ext *)
6d1add95536baf Michael Chan       2023-11-20  652  		&txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
c0c050c58d8409 Michael Chan       2015-10-22  653  
dade5e15fade59 Michael Chan       2021-04-25  654  	txbd1->tx_bd_hsize_lflags = lflags;
c0c050c58d8409 Michael Chan       2015-10-22  655  	if (skb_is_gso(skb)) {
feeef68f6f3d21 Michael Chan       2023-12-11  656  		bool udp_gso = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4);
c0c050c58d8409 Michael Chan       2015-10-22  657  		u32 hdr_len;
c0c050c58d8409 Michael Chan       2015-10-22  658  
feeef68f6f3d21 Michael Chan       2023-12-11  659  		if (skb->encapsulation) {
feeef68f6f3d21 Michael Chan       2023-12-11  660  			if (udp_gso)
feeef68f6f3d21 Michael Chan       2023-12-11  661  				hdr_len = skb_inner_transport_offset(skb) +
feeef68f6f3d21 Michael Chan       2023-12-11  662  					  sizeof(struct udphdr);
c0c050c58d8409 Michael Chan       2015-10-22  663  			else
feeef68f6f3d21 Michael Chan       2023-12-11  664  				hdr_len = skb_inner_tcp_all_headers(skb);
feeef68f6f3d21 Michael Chan       2023-12-11  665  		} else if (udp_gso) {
feeef68f6f3d21 Michael Chan       2023-12-11  666  			hdr_len = skb_transport_offset(skb) +
feeef68f6f3d21 Michael Chan       2023-12-11  667  				  sizeof(struct udphdr);
feeef68f6f3d21 Michael Chan       2023-12-11  668  		} else {
504148fedb8542 Eric Dumazet       2022-06-30  669  			hdr_len = skb_tcp_all_headers(skb);
feeef68f6f3d21 Michael Chan       2023-12-11  670  		}
c0c050c58d8409 Michael Chan       2015-10-22  671  
dade5e15fade59 Michael Chan       2021-04-25  672  		txbd1->tx_bd_hsize_lflags |= cpu_to_le32(TX_BD_FLAGS_LSO |
c0c050c58d8409 Michael Chan       2015-10-22  673  					TX_BD_FLAGS_T_IPID |
c0c050c58d8409 Michael Chan       2015-10-22  674  					(hdr_len << (TX_BD_HSIZE_SHIFT - 1)));
c0c050c58d8409 Michael Chan       2015-10-22  675  		length = skb_shinfo(skb)->gso_size;
c0c050c58d8409 Michael Chan       2015-10-22  676  		txbd1->tx_bd_mss = cpu_to_le32(length);
c0c050c58d8409 Michael Chan       2015-10-22  677  		length += hdr_len;
c0c050c58d8409 Michael Chan       2015-10-22  678  	} else if (skb->ip_summed == CHECKSUM_PARTIAL) {
dade5e15fade59 Michael Chan       2021-04-25  679  		txbd1->tx_bd_hsize_lflags |=
c0c050c58d8409 Michael Chan       2015-10-22  680  			cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
c0c050c58d8409 Michael Chan       2015-10-22  681  		txbd1->tx_bd_mss = 0;
c0c050c58d8409 Michael Chan       2015-10-22  682  	}
c0c050c58d8409 Michael Chan       2015-10-22  683  
c0c050c58d8409 Michael Chan       2015-10-22  684  	length >>= 9;
2b3c6885386020 Michael Chan       2019-02-27  685  	if (unlikely(length >= ARRAY_SIZE(bnxt_lhint_arr))) {
2b3c6885386020 Michael Chan       2019-02-27  686  		dev_warn_ratelimited(&pdev->dev, "Dropped oversize %d bytes TX packet.\n",
2b3c6885386020 Michael Chan       2019-02-27  687  				     skb->len);
2b3c6885386020 Michael Chan       2019-02-27  688  		i = 0;
2b3c6885386020 Michael Chan       2019-02-27  689  		goto tx_dma_error;
2b3c6885386020 Michael Chan       2019-02-27  690  	}
c0c050c58d8409 Michael Chan       2015-10-22  691  	flags |= bnxt_lhint_arr[length];
c0c050c58d8409 Michael Chan       2015-10-22  692  	txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
c0c050c58d8409 Michael Chan       2015-10-22  693  
c0c050c58d8409 Michael Chan       2015-10-22  694  	txbd1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
ee5c7fb3404724 Sathya Perla       2017-07-24  695  	txbd1->tx_bd_cfa_action =
ee5c7fb3404724 Sathya Perla       2017-07-24  696  			cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
c1056a59aee1d3 Michael Chan       2023-11-13  697  	txbd0 = txbd;
c0c050c58d8409 Michael Chan       2015-10-22  698  	for (i = 0; i < last_frag; i++) {
c0c050c58d8409 Michael Chan       2015-10-22  699  		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
c0c050c58d8409 Michael Chan       2015-10-22  700  
c0c050c58d8409 Michael Chan       2015-10-22  701  		prod = NEXT_TX(prod);
6d1add95536baf Michael Chan       2023-11-20  702  		txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
c0c050c58d8409 Michael Chan       2015-10-22  703  
c0c050c58d8409 Michael Chan       2015-10-22  704  		len = skb_frag_size(frag);
c0c050c58d8409 Michael Chan       2015-10-22  705  		mapping = skb_frag_dma_map(&pdev->dev, frag, 0, len,
c0c050c58d8409 Michael Chan       2015-10-22  706  					   DMA_TO_DEVICE);
c0c050c58d8409 Michael Chan       2015-10-22  707  
c0c050c58d8409 Michael Chan       2015-10-22  708  		if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
c0c050c58d8409 Michael Chan       2015-10-22  709  			goto tx_dma_error;
c0c050c58d8409 Michael Chan       2015-10-22  710  
6d1add95536baf Michael Chan       2023-11-20  711  		tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
c0c050c58d8409 Michael Chan       2015-10-22  712  		dma_unmap_addr_set(tx_buf, mapping, mapping);
c0c050c58d8409 Michael Chan       2015-10-22  713  
c0c050c58d8409 Michael Chan       2015-10-22  714  		txbd->tx_bd_haddr = cpu_to_le64(mapping);
c0c050c58d8409 Michael Chan       2015-10-22  715  
c0c050c58d8409 Michael Chan       2015-10-22  716  		flags = len << TX_BD_LEN_SHIFT;
c0c050c58d8409 Michael Chan       2015-10-22  717  		txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
c0c050c58d8409 Michael Chan       2015-10-22  718  	}
c0c050c58d8409 Michael Chan       2015-10-22  719  
c0c050c58d8409 Michael Chan       2015-10-22  720  	flags &= ~TX_BD_LEN;
c0c050c58d8409 Michael Chan       2015-10-22  721  	txbd->tx_bd_len_flags_type =
c0c050c58d8409 Michael Chan       2015-10-22  722  		cpu_to_le32(((len + pad) << TX_BD_LEN_SHIFT) | flags |
c0c050c58d8409 Michael Chan       2015-10-22  723  			    TX_BD_FLAGS_PACKET_END);
c0c050c58d8409 Michael Chan       2015-10-22  724  
c0c050c58d8409 Michael Chan       2015-10-22  725  	netdev_tx_sent_queue(txq, skb->len);
c0c050c58d8409 Michael Chan       2015-10-22  726  
83bb623c968e73 Pavan Chebbi       2021-06-27  727  	skb_tx_timestamp(skb);
83bb623c968e73 Pavan Chebbi       2021-06-27  728  
c0c050c58d8409 Michael Chan       2015-10-22  729  	prod = NEXT_TX(prod);
36647b206c014a Jakub Kicinski     2023-04-11  730  	WRITE_ONCE(txr->tx_prod, prod);
c0c050c58d8409 Michael Chan       2015-10-22  731  
c1056a59aee1d3 Michael Chan       2023-11-13  732  	if (!netdev_xmit_more() || netif_xmit_stopped(txq)) {
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  733  		bnxt_txr_db_kick(bp, txr, prod);
c1056a59aee1d3 Michael Chan       2023-11-13  734  	} else {
c1056a59aee1d3 Michael Chan       2023-11-13  735  		if (free_size >= bp->tx_wake_thresh)
c1056a59aee1d3 Michael Chan       2023-11-13  736  			txbd0->tx_bd_len_flags_type |=
c1056a59aee1d3 Michael Chan       2023-11-13  737  				cpu_to_le32(TX_BD_FLAGS_NO_CMPL);
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  738  		txr->kick_pending = 1;
c1056a59aee1d3 Michael Chan       2023-11-13  739  	}
c0c050c58d8409 Michael Chan       2015-10-22  740  
c0c050c58d8409 Michael Chan       2015-10-22  741  tx_done:
c0c050c58d8409 Michael Chan       2015-10-22  742  
c0c050c58d8409 Michael Chan       2015-10-22  743  	if (unlikely(bnxt_tx_avail(bp, txr) <= MAX_SKB_FRAGS + 1)) {
f12f551b5b966e Michael Chan       2023-12-11  744  		if (netdev_xmit_more() && !tx_buf->is_push) {
f12f551b5b966e Michael Chan       2023-12-11  745  			txbd0->tx_bd_len_flags_type &=
f12f551b5b966e Michael Chan       2023-12-11  746  				cpu_to_le32(~TX_BD_FLAGS_NO_CMPL);
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  747  			bnxt_txr_db_kick(bp, txr, prod);
f12f551b5b966e Michael Chan       2023-12-11  748  		}
c0c050c58d8409 Michael Chan       2015-10-22  749  
08a096780d9239 Jakub Kicinski     2023-04-06  750  		netif_txq_try_stop(txq, bnxt_tx_avail(bp, txr),
08a096780d9239 Jakub Kicinski     2023-04-06  751  				   bp->tx_wake_thresh);
c0c050c58d8409 Michael Chan       2015-10-22  752  	}
c0c050c58d8409 Michael Chan       2015-10-22  753  	return NETDEV_TX_OK;
c0c050c58d8409 Michael Chan       2015-10-22  754  
c0c050c58d8409 Michael Chan       2015-10-22  755  tx_dma_error:
c0c050c58d8409 Michael Chan       2015-10-22  756  	last_frag = i;
c0c050c58d8409 Michael Chan       2015-10-22  757  
c0c050c58d8409 Michael Chan       2015-10-22  758  	/* start back at beginning and unmap skb */
c0c050c58d8409 Michael Chan       2015-10-22  759  	prod = txr->tx_prod;
6d1add95536baf Michael Chan       2023-11-20  760  	tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
c0c050c58d8409 Michael Chan       2015-10-22  761  	dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
df70303dd14623 Christophe JAILLET 2021-08-22  762  			 skb_headlen(skb), DMA_TO_DEVICE);
c0c050c58d8409 Michael Chan       2015-10-22  763  	prod = NEXT_TX(prod);
c0c050c58d8409 Michael Chan       2015-10-22  764  
c0c050c58d8409 Michael Chan       2015-10-22  765  	/* unmap remaining mapped pages */
c0c050c58d8409 Michael Chan       2015-10-22  766  	for (i = 0; i < last_frag; i++) {
c0c050c58d8409 Michael Chan       2015-10-22  767  		prod = NEXT_TX(prod);
6d1add95536baf Michael Chan       2023-11-20  768  		tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
c0c050c58d8409 Michael Chan       2015-10-22  769  		dma_unmap_page(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
c0c050c58d8409 Michael Chan       2015-10-22  770  			       skb_frag_size(&skb_shinfo(skb)->frags[i]),
df70303dd14623 Christophe JAILLET 2021-08-22  771  			       DMA_TO_DEVICE);
c0c050c58d8409 Michael Chan       2015-10-22  772  	}
c0c050c58d8409 Michael Chan       2015-10-22  773  
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  774  tx_free:
c0c050c58d8409 Michael Chan       2015-10-22  775  	dev_kfree_skb_any(skb);
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  776  tx_kick_pending:
a6ec08beec9ea9 Jakub Kicinski     2024-06-20  777  	if (BNXT_TX_PTP_IS_SET(lflags)) {
9080043cd23505 Michael Chan       2024-06-28  778  		txr->tx_buf_ring[txr->tx_prod].is_ts_pkt = 0;
a6ec08beec9ea9 Jakub Kicinski     2024-06-20  779  		atomic64_inc(&bp->ptp_cfg->stats.ts_err);
a695498267c4a9 Pavan Chebbi       2024-06-28  780  		if (!(bp->fw_cap & BNXT_FW_CAP_TX_TS_CMP))
a695498267c4a9 Pavan Chebbi       2024-06-28  781  			/* set SKB to err so PTP worker will clean up */
a695498267c4a9 Pavan Chebbi       2024-06-28 @782  			ptp->txts_req[txts_prod].tx_skb = ERR_PTR(-EIO);
a6ec08beec9ea9 Jakub Kicinski     2024-06-20  783  	}
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  784  	if (txr->kick_pending)
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  785  		bnxt_txr_db_kick(bp, txr, txr->tx_prod);
e8d8c5d80f5e9d Jakub Kicinski     2021-08-12  786  	txr->tx_buf_ring[txr->tx_prod].skb = NULL;
625788b5844511 Eric Dumazet       2022-03-10  787  	dev_core_stats_tx_dropped_inc(dev);
c0c050c58d8409 Michael Chan       2015-10-22  788  	return NETDEV_TX_OK;
c0c050c58d8409 Michael Chan       2015-10-22  789  }
c0c050c58d8409 Michael Chan       2015-10-22  790  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
