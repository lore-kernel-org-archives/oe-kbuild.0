Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938B91F5413
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737962311; cv=none; b=SwKTqIwf7WZM9qTy5Fkvfo9M2tYBPqOpWrFEX0G0l9I4cj+abUIbALDvsQRvXcG9+ziH7OO3ZNbRVQ6UD8q8RLG9Kzk/WjWpl3UNeTmpGPeEZPIO49XZ2oD6Q37uhMY9M23ESzjhpla7qFT4DElc3TgRE0tDqtW37dUItUCoBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737962311; c=relaxed/simple;
	bh=NqsRMQoEWpy3CPpktsqy7qDkrXrqki5hYpxCVOLHzwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pltMqzDVg4IC/gbXKHQA+M0COwR28jY8u7wHF3Ga6s9yLigWJt/fC79JALkdM1ETuqqz9T2zu6XzdrLl/jzUPzk/as5KK+UkUWcE54mfw9qv9cR/XzQ7eyuLGaCxZuvHznav/UVZzJAMsA+CJEkpZWkH4Z+MPAWU1+4yE/dh8vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZFNkKvV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZFNkKvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737962310; x=1769498310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqsRMQoEWpy3CPpktsqy7qDkrXrqki5hYpxCVOLHzwM=;
  b=dZFNkKvVntPFETEMi9movj7I0FGvYQMqKyxChC5aQNelKfzDIdmDaBng
   zoNylpdT2BVkuZ3yu/nBRmv3hBbmfGHY23wYNPapCNvJdyKiJB0aktLSi
   cm6j1PxrRVAQNhbiB/lE2xtK5JhWJbjmpaF+BEFy4TdoXY86Oas1yFCzg
   x3A+xIPbpqgggyoJ+jCjNJvml0+Idw48Uo82QuqxY+8iimQSe2MHBe2AI
   8L9af0WHJZP12T5VVe3KZLFHDleDm+l4XG3Jd9rye+1rDUrOyMdRN7KKE
   sWKwRKaIC7HSi+oEJpHayRAHFpORy13rX4U/Tscho4CV68x1B7fIZ1wQY
   A==;
X-CSE-ConnectionGUID: PP0xYuqLQ/OOaMHFzYn0Pg==
X-CSE-MsgGUID: 7u2vI8rVQcKdtCOySM4aaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="26012169"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="26012169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 23:18:27 -0800
X-CSE-ConnectionGUID: miiMFcqNQzqdPvhzk3xHNw==
X-CSE-MsgGUID: ozAT3NioQQm44mZIkJA2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112381946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2025 23:18:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcJO3-000gWH-2U;
	Mon, 27 Jan 2025 07:18:23 +0000
Date: Mon, 27 Jan 2025 15:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/pensando/ionic/ionic_txrx.c:264
 ionic_rx_build_skb() warn: variable dereferenced before check
 'buf_info->page' (see line 248)
Message-ID: <202501271507.A4iO93ed-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Shannon Nelson <shannon.nelson@amd.com>
CC: Brett Creeley <brett.creeley@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c5968db9e625019a0ee5226c7eebef5519d366a
commit: 36a47c906b23240b3d7fd0cc3f36d511d5b36700 ionic: refactor skb building
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250127/202501271507.A4iO93ed-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501271507.A4iO93ed-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:264 ionic_rx_build_skb() warn: variable dereferenced before check 'buf_info->page' (see line 248)

vim +264 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

36a47c906b2324 Shannon Nelson 2024-03-06  231  
36a47c906b2324 Shannon Nelson 2024-03-06  232  static struct sk_buff *ionic_rx_build_skb(struct ionic_queue *q,
4dcd4575bfb17d Shannon Nelson 2024-03-06  233  					  struct ionic_rx_desc_info *desc_info,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  234  					  unsigned int headroom,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  235  					  unsigned int len,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  236  					  unsigned int num_sg_elems,
180e35cdf035d1 Shannon Nelson 2024-02-14  237  					  bool synced)
0f3154e6bcb354 Shannon Nelson 2019-09-03  238  {
4b0a7539a3728f Shannon Nelson 2021-03-10  239  	struct ionic_buf_info *buf_info;
89e572e7369fd9 Shannon Nelson 2021-03-10  240  	struct ionic_rx_stats *stats;
08f2e4b2b2008c Shannon Nelson 2019-10-23  241  	struct sk_buff *skb;
08f2e4b2b2008c Shannon Nelson 2019-10-23  242  	unsigned int i;
08f2e4b2b2008c Shannon Nelson 2019-10-23  243  	u16 frag_len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  244  
89e572e7369fd9 Shannon Nelson 2021-03-10  245  	stats = q_to_rx_stats(q);
89e572e7369fd9 Shannon Nelson 2021-03-10  246  
4b0a7539a3728f Shannon Nelson 2021-03-10  247  	buf_info = &desc_info->bufs[0];
e75ccac1d0644c Shannon Nelson 2021-07-27 @248  	prefetchw(buf_info->page);
08f2e4b2b2008c Shannon Nelson 2019-10-23  249  
89e572e7369fd9 Shannon Nelson 2021-03-10  250  	skb = napi_get_frags(&q_to_qcq(q)->napi);
89e572e7369fd9 Shannon Nelson 2021-03-10  251  	if (unlikely(!skb)) {
89e572e7369fd9 Shannon Nelson 2021-03-10  252  		net_warn_ratelimited("%s: SKB alloc failed on %s!\n",
36a47c906b2324 Shannon Nelson 2024-03-06  253  				     dev_name(q->dev), q->name);
89e572e7369fd9 Shannon Nelson 2021-03-10  254  		stats->alloc_err++;
08f2e4b2b2008c Shannon Nelson 2019-10-23  255  		return NULL;
89e572e7369fd9 Shannon Nelson 2021-03-10  256  	}
08f2e4b2b2008c Shannon Nelson 2019-10-23  257  
f81da39bf4c0a5 Shannon Nelson 2024-02-14  258  	if (headroom)
36a47c906b2324 Shannon Nelson 2024-03-06  259  		frag_len = min_t(u16, len,
36a47c906b2324 Shannon Nelson 2024-03-06  260  				 IONIC_XDP_MAX_LINEAR_MTU + VLAN_ETH_HLEN);
f81da39bf4c0a5 Shannon Nelson 2024-02-14  261  	else
97538c146cca50 Shannon Nelson 2024-02-14  262  		frag_len = min_t(u16, len, ionic_rx_buf_size(buf_info));
f81da39bf4c0a5 Shannon Nelson 2024-02-14  263  
36a47c906b2324 Shannon Nelson 2024-03-06 @264  	if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  265  		goto err_bad_buf_page;
36a47c906b2324 Shannon Nelson 2024-03-06  266  	ionic_rx_add_skb_frag(q, skb, buf_info, headroom, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  267  	len -= frag_len;
4b0a7539a3728f Shannon Nelson 2021-03-10  268  	buf_info++;
4b0a7539a3728f Shannon Nelson 2021-03-10  269  
36a47c906b2324 Shannon Nelson 2024-03-06  270  	for (i = 0; i < num_sg_elems; i++, buf_info++) {
36a47c906b2324 Shannon Nelson 2024-03-06  271  		if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  272  			goto err_bad_buf_page;
36a47c906b2324 Shannon Nelson 2024-03-06  273  		frag_len = min_t(u16, len, ionic_rx_buf_size(buf_info));
36a47c906b2324 Shannon Nelson 2024-03-06  274  		ionic_rx_add_skb_frag(q, skb, buf_info, 0, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  275  		len -= frag_len;
36a47c906b2324 Shannon Nelson 2024-03-06  276  	}
08f2e4b2b2008c Shannon Nelson 2019-10-23  277  
08f2e4b2b2008c Shannon Nelson 2019-10-23  278  	return skb;
36a47c906b2324 Shannon Nelson 2024-03-06  279  
36a47c906b2324 Shannon Nelson 2024-03-06  280  err_bad_buf_page:
36a47c906b2324 Shannon Nelson 2024-03-06  281  	dev_kfree_skb(skb);
36a47c906b2324 Shannon Nelson 2024-03-06  282  	return NULL;
0f3154e6bcb354 Shannon Nelson 2019-09-03  283  }
0f3154e6bcb354 Shannon Nelson 2019-09-03  284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
