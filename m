Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75B1BE70
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 20:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689884547; x=1721420547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SlSy/ptmecaTa8jljtVe3bBavGWHBTzNontzdpnwao0=;
  b=KtD0O9LflTUChA1zSOrLq/wsBERDwq/bkKnaZ5c3uGZUuyVflu0e+cbA
   EsEoc9WNhudAB3P9ssYQr2kGJgoLvRhvNOMC7SKGAVnr4YJetHXhgRza1
   zIrISKb6WHiXWf2lIoOAqITi6qK30D8Luw1aNEjyodBMZZVL1xFpLKlvg
   KI5XxvdhTCs67i7KO+MN43FroJ3aVzMcPSShVB3rIt1eCwsNPkOr5qvsK
   iXmqrrSBA4Mnjr9Z6iptW07TDu3dRTgmq1d6BhFY7YClxjVtupZfRpt0l
   Gu9f/Vm9pcMP+PegOrVFd+R2d0MiEYqa8o087AQBx5mPC/z4P5aBD0L/u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351739730"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="351739730"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 13:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838268583"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="838268583"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 13:22:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMaAJ-0006Td-2l;
	Thu, 20 Jul 2023 20:22:23 +0000
Date: Fri, 21 Jul 2023 04:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3186/3762] net/xdp/xsk.c:671 xsk_build_skb()
 error: 'skb' dereferencing possible ERR_PTR()
Message-ID: <202307210434.OjgqFcbB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tirthendu Sarkar <tirthendu.sarkar@intel.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: cf24f5a5feeaae34c1a34d1e04f8ac697290427a [3186/3762] xsk: add support for AF_XDP multi-buffer on Tx path
:::::: branch date: 16 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210434.OjgqFcbB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210434.OjgqFcbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210434.OjgqFcbB-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:671 xsk_build_skb() error: 'skb' dereferencing possible ERR_PTR()

vim +/skb +671 net/xdp/xsk.c

9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  601  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  602  static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  603  				     struct xdp_desc *desc)
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  604  {
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  605  	struct net_device *dev = xs->dev;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  606  	struct sk_buff *skb = xs->skb;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  607  	int err;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  608  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  609  	if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  610  		skb = xsk_build_skb_zerocopy(xs, desc);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  611  		if (IS_ERR(skb)) {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  612  			err = PTR_ERR(skb);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  613  			goto free_err;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  614  		}
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  615  	} else {
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  616  		u32 hr, tr, len;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  617  		void *buffer;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  618  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  619  		buffer = xsk_buff_raw_get_data(xs->pool, desc->addr);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  620  		len = desc->len;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  621  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  622  		if (!skb) {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  623  			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  624  			tr = dev->needed_tailroom;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  625  			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  626  			if (unlikely(!skb))
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  627  				goto free_err;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  628  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  629  			skb_reserve(skb, hr);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  630  			skb_put(skb, len);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  631  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  632  			err = skb_store_bits(skb, 0, buffer, len);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  633  			if (unlikely(err))
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  634  				goto free_err;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  635  		} else {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  636  			int nr_frags = skb_shinfo(skb)->nr_frags;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  637  			struct page *page;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  638  			u8 *vaddr;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  639  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  640  			if (unlikely(nr_frags == (MAX_SKB_FRAGS - 1) && xp_mb_desc(desc))) {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  641  				err = -EFAULT;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  642  				goto free_err;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  643  			}
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  644  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  645  			page = alloc_page(xs->sk.sk_allocation);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  646  			if (unlikely(!page)) {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  647  				err = -EAGAIN;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  648  				goto free_err;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  649  			}
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  650  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  651  			vaddr = kmap_local_page(page);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  652  			memcpy(vaddr, buffer, len);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  653  			kunmap_local(vaddr);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  654  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  655  			skb_add_rx_frag(skb, nr_frags, page, 0, len, 0);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  656  		}
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  657  	}
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  658  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  659  	skb->dev = dev;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  660  	skb->priority = xs->sk.sk_priority;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  661  	skb->mark = xs->sk.sk_mark;
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  662  	skb->destructor = xsk_destruct_skb;
b7f72a30e9ac255 Tirthendu Sarkar 2023-07-19  663  	xsk_set_destructor_arg(skb);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  664  
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  665  	return skb;
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  666  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  667  free_err:
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  668  	if (err == -EAGAIN) {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  669  		xsk_cq_cancel_locked(xs, 1);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  670  	} else {
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19 @671  		xsk_set_destructor_arg(skb);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  672  		xsk_drop_skb(skb);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  673  		xskq_cons_release(xs->tx);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  674  	}
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  675  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  676  	return ERR_PTR(err);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  677  }
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  678  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
