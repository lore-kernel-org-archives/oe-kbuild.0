Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61430F935
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 23:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756336297; cv=none; b=Tv+Xusl3U3XuCqCpsgi93p8Hh3hr8ufZ3/9ZekcJkd1hf7Tgh5UrDbCZTHV4MroxLvzTDy+GnpYJFJUvVDHWHHsLDixRVbbcQ+Fxux0pi2jUoib0Vjs6dqpSAFWD4yti+u22CVFxNOjkU2na+fYPYKWyLIcxusV8beVzXLIffow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756336297; c=relaxed/simple;
	bh=dmMCKYq3D9gdjQM7e3sdI+Qx9r4UXRn1ObWTnV3sTG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zo7yPfBmDqx+wC1LZo1RuPDy0XTi/3BQr6IJTBg3/aek/W0KlujCig7UyXLyYm/9/EtHKVWclbBTyeiueBaCb2oF0N6qXpEhgBNyByZ6nGYuefMrWof3HGbJKvLcGEQ/TUBgp55+B0k6L8mXxtHh0IFqDRTx1qI77lZnNp3ihMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4lL64tZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4lL64tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756336294; x=1787872294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmMCKYq3D9gdjQM7e3sdI+Qx9r4UXRn1ObWTnV3sTG4=;
  b=Z4lL64tZii9567m7Qsc246jWoeXQAdwuOfprWIGwcDfIqBnaCt7RLQRx
   1jajGqztkqU9ZyXxm1qzL9ubqebKuIUL29P4y+Kh7hvZX7LUlN51xC34D
   +EJmjn5EAJyxMpdj+vwUFuu5ev9QLieBLYlhFfKHlxeWtINXlFp4yFGol
   F4W4hrMpbyN3+FcnWYSdhqKuOvFmC59s0iXQIO/C8Cy6mrv9BftoI5dZb
   1UYza004uq5RGS2YkC2t4HzhfH5THyzbYAV8xIfWBKlfBQ6BV7mR04UDy
   NPnCKbla42xn6hbIXwLAfYBRRcN1JBhbxLQUm/TzxAR5mJylvsWrO+8D0
   w==;
X-CSE-ConnectionGUID: lMOX5s67QaCJelIqzjg0ow==
X-CSE-MsgGUID: I4VPAagfTb2TZFIOnRgE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57798176"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="57798176"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 16:11:34 -0700
X-CSE-ConnectionGUID: 2NiFonL9T/+naHG0vJkWGw==
X-CSE-MsgGUID: dsLqTAC4SMmUKURNuPnb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174342370"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2025 16:11:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urPIf-000TGd-1h;
	Wed, 27 Aug 2025 23:11:29 +0000
Date: Thu, 28 Aug 2025 07:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 bpf] xsk: fix immature cq descriptor production
Message-ID: <202508280638.Dy15CCOf-lkp@intel.com>
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
In-Reply-To: <20250820154416.2248012-1-maciej.fijalkowski@intel.com>
References: <20250820154416.2248012-1-maciej.fijalkowski@intel.com>
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
CC: netdev@vger.kernel.org
CC: magnus.karlsson@intel.com
CC: stfomichev@gmail.com
CC: aleksander.lobakin@intel.com
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Eryk Kubanski <e.kubanski@partner.samsung.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xsk-fix-immature-cq-descriptor-production/20250820-235001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20250820154416.2248012-1-maciej.fijalkowski%40intel.com
patch subject: [PATCH v6 bpf] xsk: fix immature cq descriptor production
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-r072-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280638.Dy15CCOf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508280638.Dy15CCOf-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:662 xsk_build_skb_zerocopy() error: use kfree_skb() here instead of kfree(skb)

vim +662 net/xdp/xsk.c

cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  638  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  639  static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  640  					      struct xdp_desc *desc)
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  641  {
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  642  	struct xsk_buff_pool *pool = xs->pool;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  643  	u32 hr, len, ts, offset, copy, copied;
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  644  	struct xsk_addrs *addrs = NULL;
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  645  	struct sk_buff *skb = xs->skb;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  646  	struct page *page;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  647  	void *buffer;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  648  	int err, i;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  649  	u64 addr;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  650  
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  651  	if (!skb) {
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  652  		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(xs->dev->needed_headroom));
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  653  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  654  		skb = sock_alloc_send_skb(&xs->sk, hr, 1, &err);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  655  		if (unlikely(!skb))
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  656  			return ERR_PTR(err);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  657  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  658  		skb_reserve(skb, hr);
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  659  
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  660  		addrs = kmem_cache_zalloc(xsk_tx_generic_cache, GFP_KERNEL);
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  661  		if (!addrs) {
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20 @662  			kfree(skb);
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  663  			return ERR_PTR(-ENOMEM);
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  664  		}
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  665  
b3a8246d6ffa300 Maciej Fijalkowski 2025-08-20  666  		xsk_set_destructor_arg(skb, addrs);
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  667  	}
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  668  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  669  	addr = desc->addr;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  670  	len = desc->len;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  671  	ts = pool->unaligned ? len : pool->chunk_size;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  672  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  673  	buffer = xsk_buff_raw_get_data(pool, addr);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  674  	offset = offset_in_page(buffer);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  675  	addr = buffer - pool->addrs;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  676  
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  677  	for (copied = 0, i = skb_shinfo(skb)->nr_frags; copied < len; i++) {
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  678  		if (unlikely(i >= MAX_SKB_FRAGS))
9d0a67b9d42c630 Tirthendu Sarkar   2023-08-23  679  			return ERR_PTR(-EOVERFLOW);
cf24f5a5feeaae3 Tirthendu Sarkar   2023-07-19  680  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  681  		page = pool->umem->pgs[addr >> PAGE_SHIFT];
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  682  		get_page(page);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  683  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  684  		copy = min_t(u32, PAGE_SIZE - offset, len - copied);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  685  		skb_fill_page_desc(skb, i, page, offset, copy);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  686  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  687  		copied += copy;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  688  		addr += copy;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  689  		offset = 0;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  690  	}
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  691  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  692  	skb->len += len;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  693  	skb->data_len += len;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  694  	skb->truesize += ts;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  695  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  696  	refcount_add(ts, &xs->sk.sk_wmem_alloc);
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  697  
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  698  	return skb;
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  699  }
9c8f21e6f8856a9 Xuan Zhuo          2021-02-18  700  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
