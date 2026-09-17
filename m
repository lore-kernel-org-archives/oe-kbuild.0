Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4F54704B
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669474; cv=none; b=YYGmXftYJVemISCrtQ7uSeuHyN0kzgAB7LZMPbKJR7X3FcxffF5alQFO1aX63lTxbsw0gtDdUX3zBl7X0BaTIMrK/f7SdtAXf1uQ6TYOO0hqxtAxLK+xn+Oz6WNGpmBoCbvrgfkU+eDucSFCBxEddvcppth99DGhUe2TyaGdZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669474; c=relaxed/simple;
	bh=nGIzcYwqreOiUtzJAUxlUGCsDR9uH0PwTou1D9iMObE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=brmAEfaQBoAwUiQ9YMGZA8jcO5BtKNudzUiy8Mc7OMq/C8eU/DTqr6AWibyYXa64pcUQLhC52ZCLeZ7KKK2z6rA/piJeCO3S2Tmh6Uyns11kMZCGLnANe2bOIz1FCxOIjWgMjMvG8QtN9R6Fkt/hVizAkqDLYph1IR2/kLPeb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2fBh246; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2fBh246"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789669473; x=1821205473;
  h=date:from:to:cc:subject:message-id;
  bh=nGIzcYwqreOiUtzJAUxlUGCsDR9uH0PwTou1D9iMObE=;
  b=m2fBh246lzbqq4vHjvbDwdlMDncMZVXBNi8C2gA4zSayhaX1SP6icjVx
   imFDHyCq/iioRMa9Sjro//AA0mc+f85+Vy65bGc/GMjXbCBXL9LktTw4f
   dHhL5xw0XyUo2FSOEwl6Y1qc5eF8PQIeglX3MoYReooBFEPEiijIfA7XV
   kEpoIJpL4KvYXCc9rPi3NstDiqL5kuQpm9fbMjIEdPxiRvSGOE56lto1+
   z3J4iE+BZOnWoom+zyhYbu/7mlwfDTx+VY80lE+xd9r31DgmfKhSMNQSp
   u95c+RqBXuK0UqAq2Pi6ajmL+X/zjPs4QqAZwWaczwBlJMlXovI+R9+0T
   A==;
X-CSE-ConnectionGUID: axt/wzmnRXSGgY47RRF13A==
X-CSE-MsgGUID: wJEd/i/vRwW8PXr57B8iIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115660075"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115660075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:24:03 -0700
X-CSE-ConnectionGUID: PD6KRtrLRTu9bp9cL9h+Bw==
X-CSE-MsgGUID: aNHDAWydRLGzCfMT+/X+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270665447"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 11:24:02 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Gm8-000000000im-1CKx;
	Thu, 17 Sep 2026 18:24:00 +0000
Date: Thu, 17 Sep 2026 20:23:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/pensando/ionic/ionic_txrx.c:204
 ionic_rx_build_skb() warn: '(((((((1) << 16)) < ((-1))) ?(((1) <<
 16)):((-1))) - (18 + 256 + ((((320)) + ((((1 << 7))) - 1)) & ~((((1 << 7))) -
 1)))) + 18)' 18446744073709550975 can't fit into 65535 '__...
Message-ID: <202609172040.DROK1GD1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jackie Liu <liuyun01@kylinos.cn>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   238650ef6c7c7cca08e032527329424c9fbd70e5
commit: ac08d183dac0441e41f77bbad50798fe609d90f1 raw: annotate disconnect-side IPv4 match writers
date:   3 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r072-20260915 (https://download.01.org/0day-ci/archive/20260917/202609172040.DROK1GD1-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac08d183dac0 ("raw: annotate disconnect-side IPv4 match writers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609172040.DROK1GD1-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:204 ionic_rx_build_skb() warn: '(((((((1) << 16)) < ((-1))) ?(((1) << 16)):((-1))) - (18 + 256 + ((((320)) + ((((1 << 7))) - 1)) & ~((((1 << 7))) - 1)))) + 18)' 18446744073709550975 can't fit into 65535 '__UNIQUE_ID_y__958'
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:204 ionic_rx_build_skb() warn: assigning 18446744073709550975 to unsigned variable '__UNIQUE_ID_y__958'
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:488 ionic_run_xdp() warn: '(((((((1) << 16)) < ((-1))) ?(((1) << 16)):((-1))) - (18 + 256 + ((((320)) + ((((1 << 7))) - 1)) & ~((((1 << 7))) - 1)))) + 18)' 18446744073709550975 can't fit into 65535 '__UNIQUE_ID_y__966'
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:488 ionic_run_xdp() warn: assigning 18446744073709550975 to unsigned variable '__UNIQUE_ID_y__966'
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:812 ionic_rx_fill() warn: 'first_buf_len' 4294966911 can't fit into 65535 '__UNIQUE_ID_y__972'

vim +204 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

36a47c906b2324 Shannon Nelson 2024-03-06  178  
36a47c906b2324 Shannon Nelson 2024-03-06  179  static struct sk_buff *ionic_rx_build_skb(struct ionic_queue *q,
4dcd4575bfb17d Shannon Nelson 2024-03-06  180  					  struct ionic_rx_desc_info *desc_info,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  181  					  unsigned int headroom,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  182  					  unsigned int len,
f81da39bf4c0a5 Shannon Nelson 2024-02-14  183  					  unsigned int num_sg_elems,
180e35cdf035d1 Shannon Nelson 2024-02-14  184  					  bool synced)
0f3154e6bcb354 Shannon Nelson 2019-09-03  185  {
4b0a7539a3728f Shannon Nelson 2021-03-10  186  	struct ionic_buf_info *buf_info;
08f2e4b2b2008c Shannon Nelson 2019-10-23  187  	struct sk_buff *skb;
08f2e4b2b2008c Shannon Nelson 2019-10-23  188  	unsigned int i;
08f2e4b2b2008c Shannon Nelson 2019-10-23  189  	u16 frag_len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  190  
4b0a7539a3728f Shannon Nelson 2021-03-10  191  	buf_info = &desc_info->bufs[0];
e75ccac1d0644c Shannon Nelson 2021-07-27  192  	prefetchw(buf_info->page);
08f2e4b2b2008c Shannon Nelson 2019-10-23  193  
89e572e7369fd9 Shannon Nelson 2021-03-10  194  	skb = napi_get_frags(&q_to_qcq(q)->napi);
89e572e7369fd9 Shannon Nelson 2021-03-10  195  	if (unlikely(!skb)) {
89e572e7369fd9 Shannon Nelson 2021-03-10  196  		net_warn_ratelimited("%s: SKB alloc failed on %s!\n",
36a47c906b2324 Shannon Nelson 2024-03-06  197  				     dev_name(q->dev), q->name);
2854242d23a7b3 Shannon Nelson 2024-03-06  198  		q_to_rx_stats(q)->alloc_err++;
08f2e4b2b2008c Shannon Nelson 2019-10-23  199  		return NULL;
89e572e7369fd9 Shannon Nelson 2021-03-10  200  	}
ac8813c0ab7d28 Shannon Nelson 2024-09-06  201  	skb_mark_for_recycle(skb);
08f2e4b2b2008c Shannon Nelson 2019-10-23  202  
f81da39bf4c0a5 Shannon Nelson 2024-02-14  203  	if (headroom)
36a47c906b2324 Shannon Nelson 2024-03-06 @204  		frag_len = min_t(u16, len,
36a47c906b2324 Shannon Nelson 2024-03-06  205  				 IONIC_XDP_MAX_LINEAR_MTU + VLAN_ETH_HLEN);
f81da39bf4c0a5 Shannon Nelson 2024-02-14  206  	else
ac8813c0ab7d28 Shannon Nelson 2024-09-06  207  		frag_len = min_t(u16, len, IONIC_PAGE_SIZE);
f81da39bf4c0a5 Shannon Nelson 2024-02-14  208  
36a47c906b2324 Shannon Nelson 2024-03-06  209  	if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  210  		goto err_bad_buf_page;
36a47c906b2324 Shannon Nelson 2024-03-06  211  	ionic_rx_add_skb_frag(q, skb, buf_info, headroom, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  212  	len -= frag_len;
4b0a7539a3728f Shannon Nelson 2021-03-10  213  	buf_info++;
4b0a7539a3728f Shannon Nelson 2021-03-10  214  
36a47c906b2324 Shannon Nelson 2024-03-06  215  	for (i = 0; i < num_sg_elems; i++, buf_info++) {
36a47c906b2324 Shannon Nelson 2024-03-06  216  		if (unlikely(!buf_info->page))
36a47c906b2324 Shannon Nelson 2024-03-06  217  			goto err_bad_buf_page;
ac8813c0ab7d28 Shannon Nelson 2024-09-06  218  		frag_len = min_t(u16, len, buf_info->len);
36a47c906b2324 Shannon Nelson 2024-03-06  219  		ionic_rx_add_skb_frag(q, skb, buf_info, 0, frag_len, synced);
36a47c906b2324 Shannon Nelson 2024-03-06  220  		len -= frag_len;
36a47c906b2324 Shannon Nelson 2024-03-06  221  	}
08f2e4b2b2008c Shannon Nelson 2019-10-23  222  
08f2e4b2b2008c Shannon Nelson 2019-10-23  223  	return skb;
36a47c906b2324 Shannon Nelson 2024-03-06  224  
36a47c906b2324 Shannon Nelson 2024-03-06  225  err_bad_buf_page:
36a47c906b2324 Shannon Nelson 2024-03-06  226  	dev_kfree_skb(skb);
36a47c906b2324 Shannon Nelson 2024-03-06  227  	return NULL;
0f3154e6bcb354 Shannon Nelson 2019-09-03  228  }
0f3154e6bcb354 Shannon Nelson 2019-09-03  229  

:::::: The code at line 204 was first introduced by commit
:::::: 36a47c906b23240b3d7fd0cc3f36d511d5b36700 ionic: refactor skb building

:::::: TO: Shannon Nelson <shannon.nelson@amd.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
