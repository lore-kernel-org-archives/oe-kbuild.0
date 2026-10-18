Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544962DEA89
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309957; cv=none; b=DwYzcgPaCr5xUSY0+ohho/8tvzmgDiCoQX+U+PMd3SR/b5w2mDSsKHCQ0O3DBFOSTa8xwVhe/d+D7GNHiCq2gaPoP7YB/MQD+XS8mMoBxMR2ujEk0ux2ZfyLqdA8erxIpA9ZS1td0ifHXhygcGorYTvwBrDhrP9YF6agtnCgQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309957; c=relaxed/simple;
	bh=fzz0sCBKd/Mtk+LnqXAzdGphC/+R4TXpN+mnLdNaATA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D1SYXdiX3LCxcu90+KOjtdYK7k8mUvfYgqeSlqPKJoefIFE2rBijPz1fbuqlc8Nlr9i1W5uODJXt+jrzYPQg3vXd5+G7a6g/JkgB7jlY+8CTj5saAgrPsEzJpxJpcYx8WGV6v7I+RoRYQ9P8oKexlDn1Wlx7TZZhKo4U3ay8tFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inKpnEhv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inKpnEhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309955; x=1823845955;
  h=date:from:to:cc:subject:message-id;
  bh=fzz0sCBKd/Mtk+LnqXAzdGphC/+R4TXpN+mnLdNaATA=;
  b=inKpnEhvszRmEbYTQsIrRZ0OyFGPoLm7iEalk3HSS6bQPFeMHtEE507R
   V7Ssg7pVrSJAJFmLgKX7lHa5jnWMuVNjeQGfkMfds/tBll4SDM4x8DMR0
   IzAujJeHhL5inwoOXTPKFiHGfCxO+ynnxw79E4u8iPi2S2DdC95B6z1IF
   Kr52K7R+yuoibw4/Oe3z2Di2pSSDjV6PE78raiVQwJpoaDqyt/gIps2h1
   r43xFvKfGfKzDfNFVMpPmGo/Ar2TJouq0ro0P37P5rg09UsNIXmc2fa+N
   w+1n63OavPC8qw48rEuYm9YYcey9tEfv3Fbj+eYqa7ay5c/+p91mH/Fxx
   w==;
X-CSE-ConnectionGUID: 2NiwKplDR0ms9ZJao2Rz0w==
X-CSE-MsgGUID: cU6WnJqsQdm/+9Mt7vGueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916664"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: cJ/81YniRtyvGw0tEN0m2g==
X-CSE-MsgGUID: XDxx7HZZSPuuJi0a0E/XzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340763"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004v7-1rmu;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:46:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing
 array offset 'i' after use.
Message-ID: <202610170859.A5yMshUF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: 917a9d02182ac8b4f25eb47dc02f3ec679608c24 [1/1] net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170859.A5yMshUF-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170859.A5yMshUF-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:989 qede_tpa_end() error: testing array offset 'i' after use.

Old smatch warnings:
drivers/net/ethernet/qlogic/qede/qede_fp.c:964 qede_tpa_cont() error: testing array offset 'i' after use.

vim +/i +989 drivers/net/ethernet/qlogic/qede/qede_fp.c

cdda926d4098690 Mintz, Yuval   2017-01-01   972  
10a0176e4e6eb62 Mintz, Yuval   2017-04-07   973  static int qede_tpa_end(struct qede_dev *edev,
cdda926d4098690 Mintz, Yuval   2017-01-01   974  			struct qede_fastpath *fp,
cdda926d4098690 Mintz, Yuval   2017-01-01   975  			struct eth_fast_path_rx_tpa_end_cqe *cqe)
cdda926d4098690 Mintz, Yuval   2017-01-01   976  {
cdda926d4098690 Mintz, Yuval   2017-01-01   977  	struct qede_rx_queue *rxq = fp->rxq;
cdda926d4098690 Mintz, Yuval   2017-01-01   978  	struct qede_agg_info *tpa_info;
cdda926d4098690 Mintz, Yuval   2017-01-01   979  	struct sk_buff *skb;
cdda926d4098690 Mintz, Yuval   2017-01-01   980  	int i;
cdda926d4098690 Mintz, Yuval   2017-01-01   981  
cdda926d4098690 Mintz, Yuval   2017-01-01   982  	tpa_info = &rxq->tpa_info[cqe->tpa_agg_index];
cdda926d4098690 Mintz, Yuval   2017-01-01   983  	skb = tpa_info->skb;
cdda926d4098690 Mintz, Yuval   2017-01-01   984  
8a8633978b842c8 Manish Chopra  2018-05-17   985  	if (tpa_info->buffer.page_offset == PAGE_SIZE)
8a8633978b842c8 Manish Chopra  2018-05-17   986  		dma_unmap_page(rxq->dev, tpa_info->buffer.mapping,
8a8633978b842c8 Manish Chopra  2018-05-17   987  			       PAGE_SIZE, rxq->data_direction);
8a8633978b842c8 Manish Chopra  2018-05-17   988  
917a9d02182ac8b Pavel Zhigulin 2025-11-13  @989  	for (i = 0; cqe->len_list[i] && i < ARRAY_SIZE(cqe->len_list); i++)
cdda926d4098690 Mintz, Yuval   2017-01-01   990  		qede_fill_frag_skb(edev, rxq, cqe->tpa_agg_index,
cdda926d4098690 Mintz, Yuval   2017-01-01   991  				   le16_to_cpu(cqe->len_list[i]));
cdda926d4098690 Mintz, Yuval   2017-01-01   992  	if (unlikely(i > 1))
cdda926d4098690 Mintz, Yuval   2017-01-01   993  		DP_ERR(edev,
cdda926d4098690 Mintz, Yuval   2017-01-01   994  		       "Strange - TPA emd with more than a single len_list entry\n");
cdda926d4098690 Mintz, Yuval   2017-01-01   995  
cdda926d4098690 Mintz, Yuval   2017-01-01   996  	if (unlikely(tpa_info->state != QEDE_AGG_STATE_START))
cdda926d4098690 Mintz, Yuval   2017-01-01   997  		goto err;
cdda926d4098690 Mintz, Yuval   2017-01-01   998  
cdda926d4098690 Mintz, Yuval   2017-01-01   999  	/* Sanity */
cdda926d4098690 Mintz, Yuval   2017-01-01  1000  	if (unlikely(cqe->num_of_bds != tpa_info->frag_id + 1))
cdda926d4098690 Mintz, Yuval   2017-01-01  1001  		DP_ERR(edev,
cdda926d4098690 Mintz, Yuval   2017-01-01  1002  		       "Strange - TPA had %02x BDs, but SKB has only %d frags\n",
cdda926d4098690 Mintz, Yuval   2017-01-01  1003  		       cqe->num_of_bds, tpa_info->frag_id);
cdda926d4098690 Mintz, Yuval   2017-01-01  1004  	if (unlikely(skb->len != le16_to_cpu(cqe->total_packet_len)))
cdda926d4098690 Mintz, Yuval   2017-01-01  1005  		DP_ERR(edev,
cdda926d4098690 Mintz, Yuval   2017-01-01  1006  		       "Strange - total packet len [cqe] is %4x but SKB has len %04x\n",
cdda926d4098690 Mintz, Yuval   2017-01-01  1007  		       le16_to_cpu(cqe->total_packet_len), skb->len);
cdda926d4098690 Mintz, Yuval   2017-01-01  1008  
cdda926d4098690 Mintz, Yuval   2017-01-01  1009  	/* Finalize the SKB */
cdda926d4098690 Mintz, Yuval   2017-01-01  1010  	skb->protocol = eth_type_trans(skb, edev->ndev);
cdda926d4098690 Mintz, Yuval   2017-01-01  1011  	skb->ip_summed = CHECKSUM_UNNECESSARY;
cdda926d4098690 Mintz, Yuval   2017-01-01  1012  
cdda926d4098690 Mintz, Yuval   2017-01-01  1013  	/* tcp_gro_complete() will copy NAPI_GRO_CB(skb)->count
cdda926d4098690 Mintz, Yuval   2017-01-01  1014  	 * to skb_shinfo(skb)->gso_segs
cdda926d4098690 Mintz, Yuval   2017-01-01  1015  	 */
cdda926d4098690 Mintz, Yuval   2017-01-01  1016  	NAPI_GRO_CB(skb)->count = le16_to_cpu(cqe->num_of_coalesced_segs);
cdda926d4098690 Mintz, Yuval   2017-01-01  1017  
cdda926d4098690 Mintz, Yuval   2017-01-01  1018  	qede_gro_receive(edev, fp, skb, tpa_info->vlan_tag);
cdda926d4098690 Mintz, Yuval   2017-01-01  1019  
cdda926d4098690 Mintz, Yuval   2017-01-01  1020  	tpa_info->state = QEDE_AGG_STATE_NONE;
cdda926d4098690 Mintz, Yuval   2017-01-01  1021  
10a0176e4e6eb62 Mintz, Yuval   2017-04-07  1022  	return 1;
cdda926d4098690 Mintz, Yuval   2017-01-01  1023  err:
cdda926d4098690 Mintz, Yuval   2017-01-01  1024  	tpa_info->state = QEDE_AGG_STATE_NONE;
8a8633978b842c8 Manish Chopra  2018-05-17  1025  
8a8633978b842c8 Manish Chopra  2018-05-17  1026  	if (tpa_info->tpa_start_fail) {
8a8633978b842c8 Manish Chopra  2018-05-17  1027  		qede_reuse_page(rxq, &tpa_info->buffer);
8a8633978b842c8 Manish Chopra  2018-05-17  1028  		tpa_info->tpa_start_fail = false;
8a8633978b842c8 Manish Chopra  2018-05-17  1029  	}
8a8633978b842c8 Manish Chopra  2018-05-17  1030  
cdda926d4098690 Mintz, Yuval   2017-01-01  1031  	dev_kfree_skb_any(tpa_info->skb);
cdda926d4098690 Mintz, Yuval   2017-01-01  1032  	tpa_info->skb = NULL;
10a0176e4e6eb62 Mintz, Yuval   2017-04-07  1033  	return 0;
cdda926d4098690 Mintz, Yuval   2017-01-01  1034  }
cdda926d4098690 Mintz, Yuval   2017-01-01  1035  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
