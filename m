Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0218B0A
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757273; cv=none; b=jC9SY2GboR3ddjAgZYC9sBF9/aJ6mPDKoowyAr1GHmdEjudLTW0+Fhv5F+V2Ddj5ifMEiJDbznpYudQDc9PbGbkZ+qUoXu47SdI4+0qLvd+3QxXH4uSoeyEORHfYxawqQarw8MvLrAwa2SbIzeAteeYksVQGJNTj8VpAb0Ds9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757273; c=relaxed/simple;
	bh=NgRHxiLvf0qn6V/FgvFvPZD0+Q5KHQtx7kZW7+WJ/LA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hp628N5NlmWdYlJ8TEn/IKSbpVrR5tJ2u501j//NQq/KGG/TrXyzbvobo/M5F6hp1Sg+DxWMvfZb7053GCOLTbfRuv7cDSUwMlfLAfW1NUrZWQHhorwec0QS+P9o4JdVJ3+JSGq4xHHmurc6hrjbJy8/Mdu51f6MAcXa2/nV4T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9pV/VTw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9pV/VTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772757271; x=1804293271;
  h=date:from:to:cc:subject:message-id;
  bh=NgRHxiLvf0qn6V/FgvFvPZD0+Q5KHQtx7kZW7+WJ/LA=;
  b=S9pV/VTw9gydLP00ZW+cT8OpuFTxF43tVodg/M98iyTUrfKQzk1lT1Bz
   DBwyzubikO/3erFURitrqYotsjv4ye8CnIR9ftGmVCAd8L9fwNx+D4JHa
   9594bV/INCs/KWapv2ynV8umuJZ9M+X7LxHp+brKl4gIs7i/hjLYBEwWy
   QyaS/ioJMW8KSHWNNg4xvyiTy0uvuta7ALUBRXFZuZKL79pzWwGH9LJjm
   xshSAN1EMy35/ub734c9AxbmzrjIu4oXEo6sMRiZEKqO0ZKYSHx771XS+
   tCs2HHdH6zqU4iJu1mw5R3V1cexAU/72C4JpmDdkDHmBH18d6iYCm7V2L
   Q==;
X-CSE-ConnectionGUID: ZzGdcy9DT6W1507smxOtFA==
X-CSE-MsgGUID: taNXzU4TQ9qgpH2TGhHJEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73735072"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73735072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 16:34:31 -0800
X-CSE-ConnectionGUID: hDywz+ORQSmhb/vitLfs3g==
X-CSE-MsgGUID: mAcshrYPT02ke/E2ul0WHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223805238"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 16:34:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyJ98-0000000007b-3QdQ;
	Fri, 06 Mar 2026 00:34:26 +0000
Date: Fri, 06 Mar 2026 08:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/qlogic/qede/qede_fp.c:989
 qede_tpa_end() error: testing array offset 'i' after use.
Message-ID: <202603060852.8GvwVQFk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
commit: 896f1a2493b59beb2b5ccdf990503dbb16cb2256 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r071-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060852.8GvwVQFk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603060852.8GvwVQFk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

vim +/i +989 drivers/net/ethernet/qlogic/qede/qede_fp.c

cdda926d409869 Mintz, Yuval   2017-01-01   957  
cdda926d409869 Mintz, Yuval   2017-01-01   958  static inline void qede_tpa_cont(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   959  				 struct qede_rx_queue *rxq,
cdda926d409869 Mintz, Yuval   2017-01-01   960  				 struct eth_fast_path_rx_tpa_cont_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   961  {
cdda926d409869 Mintz, Yuval   2017-01-01   962  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   963  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @964  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)
cdda926d409869 Mintz, Yuval   2017-01-01   965  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   966  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   967  
cdda926d409869 Mintz, Yuval   2017-01-01   968  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   969  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   970  		       "Strange - TPA cont with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   971  }
cdda926d409869 Mintz, Yuval   2017-01-01   972  
10a0176e4e6eb6 Mintz, Yuval   2017-04-07   973  static int qede_tpa_end(struct qede_dev *edev,
cdda926d409869 Mintz, Yuval   2017-01-01   974  			struct qede_fastpath *fp,
cdda926d409869 Mintz, Yuval   2017-01-01   975  			struct eth_fast_path_rx_tpa_end_cqe *cqe)
cdda926d409869 Mintz, Yuval   2017-01-01   976  {
cdda926d409869 Mintz, Yuval   2017-01-01   977  	struct qede_rx_queue *rxq = fp->rxq;
cdda926d409869 Mintz, Yuval   2017-01-01   978  	struct qede_agg_info *tpa_info;
cdda926d409869 Mintz, Yuval   2017-01-01   979  	struct sk_buff *skb;
cdda926d409869 Mintz, Yuval   2017-01-01   980  	int i;
cdda926d409869 Mintz, Yuval   2017-01-01   981  
cdda926d409869 Mintz, Yuval   2017-01-01   982  	tpa_info = &rxq->tpa_info[cqe->tpa_agg_index];
cdda926d409869 Mintz, Yuval   2017-01-01   983  	skb = tpa_info->skb;
cdda926d409869 Mintz, Yuval   2017-01-01   984  
8a8633978b842c Manish Chopra  2018-05-17   985  	if (tpa_info->buffer.page_offset == PAGE_SIZE)
8a8633978b842c Manish Chopra  2018-05-17   986  		dma_unmap_page(rxq->dev, tpa_info->buffer.mapping,
8a8633978b842c Manish Chopra  2018-05-17   987  			       PAGE_SIZE, rxq->data_direction);
8a8633978b842c Manish Chopra  2018-05-17   988  
896f1a2493b59b Pavel Zhigulin 2025-11-13  @989  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)
cdda926d409869 Mintz, Yuval   2017-01-01   990  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d409869 Mintz, Yuval   2017-01-01   991  				   le16_to_cpu(cqe->len_list[i]));
cdda926d409869 Mintz, Yuval   2017-01-01   992  	if (unlikely(i > 1))
cdda926d409869 Mintz, Yuval   2017-01-01   993  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01   994  		       "Strange - TPA emd with more than a single len_list entry\n");
cdda926d409869 Mintz, Yuval   2017-01-01   995  
cdda926d409869 Mintz, Yuval   2017-01-01   996  	if (unlikely(tpa_info->state != QEDE_AGG_STATE_START))
cdda926d409869 Mintz, Yuval   2017-01-01   997  		goto err;
cdda926d409869 Mintz, Yuval   2017-01-01   998  
cdda926d409869 Mintz, Yuval   2017-01-01   999  	/* Sanity */
cdda926d409869 Mintz, Yuval   2017-01-01  1000  	if (unlikely(cqe->num_of_bds != tpa_info->frag_id + 1))
cdda926d409869 Mintz, Yuval   2017-01-01  1001  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01  1002  		       "Strange - TPA had %02x BDs, but SKB has only %d frags\n",
cdda926d409869 Mintz, Yuval   2017-01-01  1003  		       cqe->num_of_bds, tpa_info->frag_id);
cdda926d409869 Mintz, Yuval   2017-01-01  1004  	if (unlikely(skb->len != le16_to_cpu(cqe->total_packet_len)))
cdda926d409869 Mintz, Yuval   2017-01-01  1005  		DP_ERR(edev,
cdda926d409869 Mintz, Yuval   2017-01-01  1006  		       "Strange - total packet len [cqe] is %4x but SKB has len %04x\n",
cdda926d409869 Mintz, Yuval   2017-01-01  1007  		       le16_to_cpu(cqe->total_packet_len), skb->len);
cdda926d409869 Mintz, Yuval   2017-01-01  1008  
cdda926d409869 Mintz, Yuval   2017-01-01  1009  	/* Finalize the SKB */
cdda926d409869 Mintz, Yuval   2017-01-01  1010  	skb->protocol = eth_type_trans(skb, edev->ndev);
cdda926d409869 Mintz, Yuval   2017-01-01  1011  	skb->ip_summed = CHECKSUM_UNNECESSARY;
cdda926d409869 Mintz, Yuval   2017-01-01  1012  
cdda926d409869 Mintz, Yuval   2017-01-01  1013  	/* tcp_gro_complete() will copy NAPI_GRO_CB(skb)->count
cdda926d409869 Mintz, Yuval   2017-01-01  1014  	 * to skb_shinfo(skb)->gso_segs
cdda926d409869 Mintz, Yuval   2017-01-01  1015  	 */
cdda926d409869 Mintz, Yuval   2017-01-01  1016  	NAPI_GRO_CB(skb)->count = le16_to_cpu(cqe->num_of_coalesced_segs);
cdda926d409869 Mintz, Yuval   2017-01-01  1017  
cdda926d409869 Mintz, Yuval   2017-01-01  1018  	qede_gro_receive(edev, fp, skb, tpa_info->vlan_tag);
cdda926d409869 Mintz, Yuval   2017-01-01  1019  
cdda926d409869 Mintz, Yuval   2017-01-01  1020  	tpa_info->state = QEDE_AGG_STATE_NONE;
cdda926d409869 Mintz, Yuval   2017-01-01  1021  
10a0176e4e6eb6 Mintz, Yuval   2017-04-07  1022  	return 1;
cdda926d409869 Mintz, Yuval   2017-01-01  1023  err:
cdda926d409869 Mintz, Yuval   2017-01-01  1024  	tpa_info->state = QEDE_AGG_STATE_NONE;
8a8633978b842c Manish Chopra  2018-05-17  1025  
8a8633978b842c Manish Chopra  2018-05-17  1026  	if (tpa_info->tpa_start_fail) {
8a8633978b842c Manish Chopra  2018-05-17  1027  		qede_reuse_page(rxq, &tpa_info->buffer);
8a8633978b842c Manish Chopra  2018-05-17  1028  		tpa_info->tpa_start_fail = false;
8a8633978b842c Manish Chopra  2018-05-17  1029  	}
8a8633978b842c Manish Chopra  2018-05-17  1030  
cdda926d409869 Mintz, Yuval   2017-01-01  1031  	dev_kfree_skb_any(tpa_info->skb);
cdda926d409869 Mintz, Yuval   2017-01-01  1032  	tpa_info->skb = NULL;
10a0176e4e6eb6 Mintz, Yuval   2017-04-07  1033  	return 0;
cdda926d409869 Mintz, Yuval   2017-01-01  1034  }
cdda926d409869 Mintz, Yuval   2017-01-01  1035  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
