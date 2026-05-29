Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970753403F2
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041177; cv=none; b=fJ44/HeFxbLjKsMSw2ahI2o81L48BXV/zXJ5qv4RXMA5L4IgOlFiVoFZHeMuz4tfwIAIt05lazwczng6bhGy3hEmTtC9caEi/7hkzz2MFQiGaf6b9mQJoAdDjoFwVXurdzrLcoX2bWlrr2JuSKR7hDZjBmmQyEmDg5SbBWWgDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041177; c=relaxed/simple;
	bh=TzdzsuyZbVWh6Fq0oIfmPZXcE16Soyil1hoLowU0Ohc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QZj1hspD0/QqhpwoNrY3MHDUdVbeYFFo7djPCO7dUcWVdJ916vt7GNufb39/602e+HpkRe1y3EmylyDzr9RSuRBD3YxmioBgYnVf6lzPQsVaIHZINnUDlZmWIF1Oja1otSUQv7EYQG2n0xcE5wjbVz/VJe2TeYrMCSn1aCW6Kvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcqaDBZP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcqaDBZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780041176; x=1811577176;
  h=date:from:to:cc:subject:message-id;
  bh=TzdzsuyZbVWh6Fq0oIfmPZXcE16Soyil1hoLowU0Ohc=;
  b=dcqaDBZPoYTcytjyDSOucSaCutyEZqzUYTNfA63YCOE1O+DSDqNc+bOl
   iW+LGY3LGk61b4xGl66tup+P+NZqj5+OXm/ExAgqddfQqHmHvxmViiOWQ
   snK5Ny3k7sqVUoNWsWQ00AIbl7JmOxfI5fK1FHCEu/Xvi+92rv/tX578G
   yCQvB4dfpolwEZFyhPx/2zJKEAOYXFUoCgwgHTD7XTIsSd/qSuIduPn9X
   Sx1tLNDSzpQcf9sOr+5izLyKILvuIPuJY4T+CMl2X7H2Rf6jH0gLWWafi
   oZQfotxCbh32HcQU0H0D8L6MxOeKGoabKMzBvovOYELaYe/+cO9u/xzlz
   Q==;
X-CSE-ConnectionGUID: IwN/UZneQCu+eMAKeqGWLQ==
X-CSE-MsgGUID: ikRUt7FpSSGKmVTwcOsqhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92364962"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="92364962"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 00:52:55 -0700
X-CSE-ConnectionGUID: 6i9Xi98jTMauJPg8lWqY/w==
X-CSE-MsgGUID: vQtSZeyGRjeZMKfSkHoPgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247873444"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2026 00:52:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSs1T-000000006wi-1PVG;
	Fri, 29 May 2026 07:52:51 +0000
Date: Fri, 29 May 2026 15:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bigeasy-staging:b4/hsr_ptp 3/9] net/hsr/hsr_forward.c:381
 hsr_create_tagged_frame() error: use kfree_skb() here instead of kfree(skb)
Message-ID: <202605291505.4v18xVW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git b4/hsr_ptp
head:   faf1318dad835e0286f66a9a91a329ccb8f7c001
commit: 0acc81038697434eef72adb295def2c53faff66b [3/9] hsr: Use skb_clone() while adding the HSR header
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291505.4v18xVW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605291505.4v18xVW0-lkp@intel.com/

smatch warnings:
net/hsr/hsr_forward.c:381 hsr_create_tagged_frame() error: use kfree_skb() here instead of kfree(skb)

vim +381 net/hsr/hsr_forward.c

f266a683a4804d Arvid Brodin              2014-07-04  327  
451d8123f89791 Murali Karicheri          2020-07-22  328  /* If the original frame was an HSR tagged frame, just clone it to be sent
451d8123f89791 Murali Karicheri          2020-07-22  329   * unchanged. Otherwise, create a private frame especially tagged for 'port'.
451d8123f89791 Murali Karicheri          2020-07-22  330   */
451d8123f89791 Murali Karicheri          2020-07-22  331  struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
f266a683a4804d Arvid Brodin              2014-07-04  332  					struct hsr_port *port)
f266a683a4804d Arvid Brodin              2014-07-04  333  {
f266a683a4804d Arvid Brodin              2014-07-04  334  	unsigned char *dst, *src;
f266a683a4804d Arvid Brodin              2014-07-04  335  	struct sk_buff *skb;
451d8123f89791 Murali Karicheri          2020-07-22  336  	int movelen;
451d8123f89791 Murali Karicheri          2020-07-22  337  
451d8123f89791 Murali Karicheri          2020-07-22  338  	if (frame->skb_hsr) {
451d8123f89791 Murali Karicheri          2020-07-22  339  		struct hsr_ethhdr *hsr_ethhdr =
451d8123f89791 Murali Karicheri          2020-07-22  340  			(struct hsr_ethhdr *)skb_mac_header(frame->skb_hsr);
451d8123f89791 Murali Karicheri          2020-07-22  341  
451d8123f89791 Murali Karicheri          2020-07-22  342  		/* set the lane id properly */
b2c26c82f7a94e Felix Maurer              2025-11-11  343  		hsr_set_path_id(frame, hsr_ethhdr, port);
451d8123f89791 Murali Karicheri          2020-07-22  344  		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
451d8123f89791 Murali Karicheri          2020-07-22  345  	}
f266a683a4804d Arvid Brodin              2014-07-04  346  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  347  	skb = skb_clone(frame->skb_std, GFP_ATOMIC);
05ca6e644dc9b7 Murali Karicheri          2019-04-05  348  	if (!skb)
f266a683a4804d Arvid Brodin              2014-07-04  349  		return NULL;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  350  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  351  	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  352  		return skb;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  353  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  354  	/* Ensure the cloned skb has enough headroom to fit the HSR tag */
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  355  	if (skb_cow_head(skb, HSR_HLEN))
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  356  		goto err;
f266a683a4804d Arvid Brodin              2014-07-04  357  
f266a683a4804d Arvid Brodin              2014-07-04  358  	if (skb->ip_summed == CHECKSUM_PARTIAL)
f266a683a4804d Arvid Brodin              2014-07-04  359  		skb->csum_start += HSR_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  360  
f266a683a4804d Arvid Brodin              2014-07-04  361  	movelen = ETH_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  362  	if (frame->is_vlan)
f266a683a4804d Arvid Brodin              2014-07-04  363  		movelen += VLAN_HLEN;
f266a683a4804d Arvid Brodin              2014-07-04  364  
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  365  	/* The entire header area needs to be linear */
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  366  	if (!pskb_may_pull(skb, HSR_HLEN + movelen))
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  367  		goto err;
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  368  
f266a683a4804d Arvid Brodin              2014-07-04  369  	src = skb_mac_header(skb);
f266a683a4804d Arvid Brodin              2014-07-04  370  	dst = skb_push(skb, HSR_HLEN);
f266a683a4804d Arvid Brodin              2014-07-04  371  	memmove(dst, src, movelen);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  372  	skb_set_network_header(skb, ETH_HLEN + HSR_HLEN);
f266a683a4804d Arvid Brodin              2014-07-04  373  	skb_reset_mac_header(skb);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  374  	skb_reset_mac_len(skb);
f266a683a4804d Arvid Brodin              2014-07-04  375  
5d93518e06b210 Murali Karicheri          2020-07-20  376  	/* skb_put_padto free skb on error and hsr_fill_tag returns NULL in
5d93518e06b210 Murali Karicheri          2020-07-20  377  	 * that case
5d93518e06b210 Murali Karicheri          2020-07-20  378  	 */
5d93518e06b210 Murali Karicheri          2020-07-20  379  	return hsr_fill_tag(skb, frame, port, port->hsr->prot_version);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  380  err:
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19 @381  	kfree(skb);
0acc8103869743 Sebastian Andrzej Siewior 2026-05-19  382  	return NULL;
f266a683a4804d Arvid Brodin              2014-07-04  383  }
f266a683a4804d Arvid Brodin              2014-07-04  384  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
