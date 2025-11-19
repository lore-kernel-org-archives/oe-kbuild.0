Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0AB350A2D
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558214; cv=none; b=FicJhoVF7chuE29kOLgwkwJDV60hmrIHTxSIi6Q9gIgk2aDwRdmWIfV/R4BhibcIBiQAFVNsMjXoGMAzpF11lTyWMKwHe25eboRx/m3tqJ+77ghx9IVUKDDuAhjsP5dc2+FRk2NMqka9dJWtXD9EqBIyvY7fxyAGQqVoS5nf2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558214; c=relaxed/simple;
	bh=Vi3EerSJuD6LHbFxJvy1jGqBk8fChsbKG29zprNpD9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jizgfoB4c0DwJ24q77l2VuGXv9iFmARwUIz5Ay9ornHHzSknPtLlrmFNjuCAsi0ZyWxD2mtvvA335LywpoD3xOuQSERUZy5T/oj7ZX9zp1jfaQXB9mlyXRlUyt35ghvBgbCFR+OtVvJQRG5MrlJ5Gijcf7DHWNGSfqwtfHbz/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rsalu5WE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rsalu5WE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763558212; x=1795094212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vi3EerSJuD6LHbFxJvy1jGqBk8fChsbKG29zprNpD9E=;
  b=Rsalu5WE4CqWwMMfLnb+Fo3/Fu0YO9RERhWiR7iT1BelI4HQQN9MKRS5
   BBu9KsqEQ8dI+VOAWgJoB2OTt0U101NKsKbldZ0rZ9bH6FHu4i2iS/H4+
   DEk7jvq5415cG/LKe+ilHTzPlHy3YP/ra9EtK3oLl2/FhICoD12o4x7Qr
   4/WNU7cVNzIPZyVe+DKvTkh1w+bm9HDJHyOSherxqU7vWY5R3qvI1ev+N
   XWHxq48wvABUTSLA/XDq101s5sSiIwmQjAjKEZNaoG3PuxPitS+Y/CZlR
   /eH+2WqIjab0YBdExWQhAUDdB4XnskWSC0jzfr5Io4imhx58lR4t+5pWW
   A==;
X-CSE-ConnectionGUID: qlFtwCHSRcuYoFct6EVGHw==
X-CSE-MsgGUID: /3NdkNJ7Q96+Kv7puIKGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64793914"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64793914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:16:50 -0800
X-CSE-ConnectionGUID: zeZkmgDoSQSrEunNs5JgnA==
X-CSE-MsgGUID: bJ6yjQj2Q6WHhW1GMXbGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190855636"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2025 05:16:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLi3D-0002uj-1W;
	Wed, 19 Nov 2025 13:16:47 +0000
Date: Wed, 19 Nov 2025 21:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9725/10183]
 drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing
 array offset 'i' after use.
Message-ID: <202511192128.aqouWvbT-lkp@intel.com>
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
TO: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: 896f1a2493b59beb2b5ccdf990503dbb16cb2256 [9725/10183] net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
:::::: branch date: 10 hours ago
:::::: commit date: 27 hours ago
config: xtensa-randconfig-r073-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192128.aqouWvbT-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511192128.aqouWvbT-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

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
