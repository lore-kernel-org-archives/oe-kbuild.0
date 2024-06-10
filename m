Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9021C3E
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 02:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717985222; cv=none; b=i8cl49ygCrJpE2nlOoHBu3pzZAuhX3OAsa+Rl/lJ1MKAawAtM1Gp7hHe4MeGMpNiy1BdfYhXJEijegb320ENBMxFzuJaMTUx2qLKO93JnO2+q70hUihU5opTH/RWp76gD+xnlvLY+FqgdjGEVY7dQDviYD1mECtP1fwYrndAi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717985222; c=relaxed/simple;
	bh=0t4Nb5Lp3jHaUveEJ/kCABBY+KkTc4GX/lSq/k6/fzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqnwj6fJIibz4MYo3ugz/v5j3Wm0O7UsGOkewcMRy0Tjsilx0MjSF2txJ4JczFXQIlZUZ6n11ERoABJORu6dtjk6Sins2raouk2WfAhZukEwSL1VUGgPSfvw7oqG3pHdZNEyltff1sZnbzbVYuJFYqyqwqJPI543F1GwRYd8RFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlFtf7cV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlFtf7cV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717985220; x=1749521220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0t4Nb5Lp3jHaUveEJ/kCABBY+KkTc4GX/lSq/k6/fzI=;
  b=hlFtf7cV8Xltv+wS5QXYjS43Noq/cXF3hDnVGFxF7MmvfhZSRaWbeSXV
   vArcfHCC+1xpDGVJSyaIAkliGxGcDX00r/hMciSsP3VqJsTFtdaEZQhED
   kCo+3CdaRiWgMd2nRPNWjN+NCsywwVE5rspejQHP5V2pRld3J+Z0v4EVT
   7ja7AMeq1jMcBa2szwReJ6Uqqr1TmJThOSef2bBWPnIxt2p8vghqhrIjR
   fzL1Lc1rYPEVWo/SZTb94F6pVV270EWJmD2RslLC9o+y4MoX9vqKiauWe
   YLBScj/UTUM/afSPDkLX6NKQZz1Jj7sO7QhserwZPwupzCJsNzao7ogpq
   Q==;
X-CSE-ConnectionGUID: hNQQkVrNRGW/dhsNXRBEYw==
X-CSE-MsgGUID: iTrsKlH4R1Osmmzppheq0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="37158539"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="37158539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 19:07:00 -0700
X-CSE-ConnectionGUID: oR0t7qZEREmfsb39s3kObg==
X-CSE-MsgGUID: 9HkJQ6EAQNq+c+L1Pp/pKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="69699943"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 19:06:59 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGUQy-0001lM-0A;
	Mon, 10 Jun 2024 02:06:56 +0000
Date: Mon, 10 Jun 2024 10:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 44/95]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:3372 idpf_rx_splitq_clean()
 error: we previously assumed 'skb' could be null (see line 3321)
Message-ID: <202406101002.VDMMCfvP-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   2746dc17cbf54ef20cc09a7ec6862477a326fae1
commit: da7a732ecd33e343155f2304d590eaab2a22837c [44/95] idpf: use libeth Rx buffer management for payload buffer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101002.VDMMCfvP-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406101002.VDMMCfvP-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_txrx.c:3372 idpf_rx_splitq_clean() error: we previously assumed 'skb' could be null (see line 3321)

Old smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_txrx.c:1404 idpf_txq_group_alloc() error: uninitialized symbol 'stashes'.

vim +/skb +3372 drivers/net/ethernet/intel/idpf/idpf_txrx.c

f940ee36f31497 Alexander Lobakin 2024-05-28  3318  
f940ee36f31497 Alexander Lobakin 2024-05-28  3319  		hdr = &rx_bufq->hdr_buf[buf_id];
f940ee36f31497 Alexander Lobakin 2024-05-28  3320  
f940ee36f31497 Alexander Lobakin 2024-05-28 @3321  		if (unlikely(!hdr_len && !skb)) {
f940ee36f31497 Alexander Lobakin 2024-05-28  3322  			hdr_len = idpf_rx_hsplit_wa(hdr, rx_buf, pkt_len);
f940ee36f31497 Alexander Lobakin 2024-05-28  3323  			pkt_len -= hdr_len;
f940ee36f31497 Alexander Lobakin 2024-05-28  3324  
f940ee36f31497 Alexander Lobakin 2024-05-28  3325  			u64_stats_update_begin(&rxq->stats_sync);
f940ee36f31497 Alexander Lobakin 2024-05-28  3326  			u64_stats_inc(&rxq->q_stats.hsplit_buf_ovf);
f940ee36f31497 Alexander Lobakin 2024-05-28  3327  			u64_stats_update_end(&rxq->stats_sync);
f940ee36f31497 Alexander Lobakin 2024-05-28  3328  		}
3a8845af66edb3 Alan Brady        2023-08-07  3329  
f940ee36f31497 Alexander Lobakin 2024-05-28  3330  		if (libeth_rx_sync_for_cpu(hdr, hdr_len)) {
f940ee36f31497 Alexander Lobakin 2024-05-28  3331  			skb = idpf_rx_build_skb(hdr, hdr_len);
f940ee36f31497 Alexander Lobakin 2024-05-28  3332  			if (!skb)
f940ee36f31497 Alexander Lobakin 2024-05-28  3333  				break;
3a8845af66edb3 Alan Brady        2023-08-07  3334  
3a8845af66edb3 Alan Brady        2023-08-07  3335  			u64_stats_update_begin(&rxq->stats_sync);
16e352917f5ac9 Alexander Lobakin 2024-05-28  3336  			u64_stats_inc(&rxq->q_stats.hsplit_pkts);
3a8845af66edb3 Alan Brady        2023-08-07  3337  			u64_stats_update_end(&rxq->stats_sync);
3a8845af66edb3 Alan Brady        2023-08-07  3338  		}
3a8845af66edb3 Alan Brady        2023-08-07  3339  
f940ee36f31497 Alexander Lobakin 2024-05-28  3340  		hdr->page = NULL;
f940ee36f31497 Alexander Lobakin 2024-05-28  3341  
f940ee36f31497 Alexander Lobakin 2024-05-28  3342  payload:
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3343  		if (!libeth_rx_sync_for_cpu(rx_buf, pkt_len))
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3344  			goto skip_data;
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3345  
3a8845af66edb3 Alan Brady        2023-08-07  3346  		if (skb)
3a8845af66edb3 Alan Brady        2023-08-07  3347  			idpf_rx_add_frag(rx_buf, skb, pkt_len);
3a8845af66edb3 Alan Brady        2023-08-07  3348  		else
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3349  			skb = idpf_rx_build_skb(rx_buf, pkt_len);
3a8845af66edb3 Alan Brady        2023-08-07  3350  
3a8845af66edb3 Alan Brady        2023-08-07  3351  		/* exit if we failed to retrieve a buffer */
3a8845af66edb3 Alan Brady        2023-08-07  3352  		if (!skb)
3a8845af66edb3 Alan Brady        2023-08-07  3353  			break;
3a8845af66edb3 Alan Brady        2023-08-07  3354  
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3355  skip_data:
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3356  		rx_buf->page = NULL;
3a8845af66edb3 Alan Brady        2023-08-07  3357  
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3358  		idpf_rx_post_buf_refill(refillq, buf_id);
3a8845af66edb3 Alan Brady        2023-08-07  3359  		IDPF_RX_BUMP_NTC(rxq, ntc);
da7a732ecd33e3 Alexander Lobakin 2024-05-28  3360  
3a8845af66edb3 Alan Brady        2023-08-07  3361  		/* skip if it is non EOP desc */
3a8845af66edb3 Alan Brady        2023-08-07  3362  		if (!idpf_rx_splitq_is_eop(rx_desc))
3a8845af66edb3 Alan Brady        2023-08-07  3363  			continue;
3a8845af66edb3 Alan Brady        2023-08-07  3364  
3a8845af66edb3 Alan Brady        2023-08-07  3365  		/* pad skb if needed (to make valid ethernet frame) */
3a8845af66edb3 Alan Brady        2023-08-07  3366  		if (eth_skb_pad(skb)) {
3a8845af66edb3 Alan Brady        2023-08-07  3367  			skb = NULL;
3a8845af66edb3 Alan Brady        2023-08-07  3368  			continue;
3a8845af66edb3 Alan Brady        2023-08-07  3369  		}
3a8845af66edb3 Alan Brady        2023-08-07  3370  
3a8845af66edb3 Alan Brady        2023-08-07  3371  		/* probably a little skewed due to removing CRC */
3a8845af66edb3 Alan Brady        2023-08-07 @3372  		total_rx_bytes += skb->len;
3a8845af66edb3 Alan Brady        2023-08-07  3373  
3a8845af66edb3 Alan Brady        2023-08-07  3374  		/* protocol */
3a8845af66edb3 Alan Brady        2023-08-07  3375  		if (unlikely(idpf_rx_process_skb_fields(rxq, skb, rx_desc))) {
3a8845af66edb3 Alan Brady        2023-08-07  3376  			dev_kfree_skb_any(skb);
3a8845af66edb3 Alan Brady        2023-08-07  3377  			skb = NULL;
3a8845af66edb3 Alan Brady        2023-08-07  3378  			continue;
3a8845af66edb3 Alan Brady        2023-08-07  3379  		}
3a8845af66edb3 Alan Brady        2023-08-07  3380  
3a8845af66edb3 Alan Brady        2023-08-07  3381  		/* send completed skb up the stack */
16e352917f5ac9 Alexander Lobakin 2024-05-28  3382  		napi_gro_receive(rxq->napi, skb);
3a8845af66edb3 Alan Brady        2023-08-07  3383  		skb = NULL;
3a8845af66edb3 Alan Brady        2023-08-07  3384  
3a8845af66edb3 Alan Brady        2023-08-07  3385  		/* update budget accounting */
3a8845af66edb3 Alan Brady        2023-08-07  3386  		total_rx_pkts++;
3a8845af66edb3 Alan Brady        2023-08-07  3387  	}
3a8845af66edb3 Alan Brady        2023-08-07  3388  
3a8845af66edb3 Alan Brady        2023-08-07  3389  	rxq->next_to_clean = ntc;
3a8845af66edb3 Alan Brady        2023-08-07  3390  
3a8845af66edb3 Alan Brady        2023-08-07  3391  	rxq->skb = skb;
3a8845af66edb3 Alan Brady        2023-08-07  3392  	u64_stats_update_begin(&rxq->stats_sync);
16e352917f5ac9 Alexander Lobakin 2024-05-28  3393  	u64_stats_add(&rxq->q_stats.packets, total_rx_pkts);
16e352917f5ac9 Alexander Lobakin 2024-05-28  3394  	u64_stats_add(&rxq->q_stats.bytes, total_rx_bytes);
3a8845af66edb3 Alan Brady        2023-08-07  3395  	u64_stats_update_end(&rxq->stats_sync);
3a8845af66edb3 Alan Brady        2023-08-07  3396  
3a8845af66edb3 Alan Brady        2023-08-07  3397  	/* guarantee a trip back through this routine if there was a failure */
3a8845af66edb3 Alan Brady        2023-08-07  3398  	return total_rx_pkts;
3a8845af66edb3 Alan Brady        2023-08-07  3399  }
3a8845af66edb3 Alan Brady        2023-08-07  3400  

:::::: The code at line 3372 was first introduced by commit
:::::: 3a8845af66edb340ba9210bb8a0da040c7d6e590 idpf: add RX splitq napi poll support

:::::: TO: Alan Brady <alan.brady@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
