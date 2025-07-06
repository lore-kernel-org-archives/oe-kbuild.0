Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADA1D63DF
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751785465; cv=none; b=BH6PA8yhRdwdNv6gsLTb7cdypCSAXvTqzDbD/Wj94jjbyG6SPfsZcsEjnjgNC8tKId7oAZZVEnO+etpGtvYtff8B9ISF0BPHEMzVu3WioCyEfmim61a3yg+lSIEre0tyqkANhhEoJhUXKL2tQ2Jd5kdGRmlJTTnCNjkO+q8Mukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751785465; c=relaxed/simple;
	bh=F3S4NSyBC2RxtXYNjOVtCz3zdujyBJnL9qiPQJsYJKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrOOuue0o4KaXDorHRX5aXSi2cmAts20o6Pb4df3Insr1UjI/HK/StVEV9auQI1syC/E7rhAd0AVvs/9AJvt78iuptIEXPQzhT63gmzxCkOgXMaPFj86S6kTNk7qVfgKm10yU6B52pGosSm7ztBq5FPavM/bLviDOYIjRRQhEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6TeaI69; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6TeaI69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751785464; x=1783321464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3S4NSyBC2RxtXYNjOVtCz3zdujyBJnL9qiPQJsYJKg=;
  b=j6TeaI69519/KBoXE1iaoxt2/1C7ExYPrIZG84U0E7ZMsIiR3d9SBeQS
   F6e2KQ0P+ABEBmIlkjD0Ml48qTBFpvRNc79GUyLOIWgcwfpWhfu0ci5qc
   r8i1t7MgZibVdPyT7DrUFyUUiKTp4ahnMFQZVF/cIJpzAU5cpju3ocKey
   sy/4bntzuFrZcpTRYNi+zcmwNuufoF/8IopxdsAlJNlj6jbZwoY6QTrKz
   SPgTcGcA40ZVJm1XLs3p91Pke1WXT06u19t14dcrQsqOBgLlf3Y3dIrYN
   Y4VjB+AJaT8Dya+OAyWMBmpaHcY7xGMJHsw1pp5EhgZ2LvMU/QdmEWOHx
   A==;
X-CSE-ConnectionGUID: tXCJdNCVSJu5jJ0u/qYIwg==
X-CSE-MsgGUID: WehVZJNSTmSqBxNEcDsj1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54180166"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54180166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 00:04:23 -0700
X-CSE-ConnectionGUID: lvCcjAaGSjKd3LD1LduIWA==
X-CSE-MsgGUID: ieaErWqkSGiqTi6A2ElOAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="160608251"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2025 00:04:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYJQB-0004w3-0z;
	Sun, 06 Jul 2025 07:04:19 +0000
Date: Sun, 6 Jul 2025 15:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 bpf] xsk: fix immature cq descriptor production
Message-ID: <202507061447.DwFSGum1-lkp@intel.com>
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
In-Reply-To: <20250705135512.1963216-1-maciej.fijalkowski@intel.com>
References: <20250705135512.1963216-1-maciej.fijalkowski@intel.com>
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
CC: netdev@vger.kernel.org
CC: magnus.karlsson@intel.com
CC: stfomichev@gmail.com
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Eryk Kubanski <e.kubanski@partner.samsung.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xsk-fix-immature-cq-descriptor-production/20250705-215714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20250705135512.1963216-1-maciej.fijalkowski%40intel.com
patch subject: [PATCH v2 bpf] xsk: fix immature cq descriptor production
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061447.DwFSGum1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507061447.DwFSGum1-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:819 xsk_build_skb() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +819 net/xdp/xsk.c

9c8f21e6f8856a Xuan Zhuo                 2021-02-18  688  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  689  static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  690  				     struct xdp_desc *desc)
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  691  {
48eb03dd26304c Stanislav Fomichev        2023-11-27  692  	struct xsk_tx_metadata *meta = NULL;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  693  	struct net_device *dev = xs->dev;
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  694  	struct xsk_addrs *addrs = NULL;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  695  	struct sk_buff *skb = xs->skb;
48eb03dd26304c Stanislav Fomichev        2023-11-27  696  	bool first_frag = false;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  697  	int err;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  698  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  699  	if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  700  		skb = xsk_build_skb_zerocopy(xs, desc);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  701  		if (IS_ERR(skb)) {
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  702  			err = PTR_ERR(skb);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  703  			goto free_err;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  704  		}
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  705  	} else {
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  706  		u32 hr, tr, len;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  707  		void *buffer;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  708  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  709  		buffer = xsk_buff_raw_get_data(xs->pool, desc->addr);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  710  		len = desc->len;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  711  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  712  		if (!skb) {
0c0d0f42ffa6ac Felix Maurer              2024-11-14  713  			first_frag = true;
0c0d0f42ffa6ac Felix Maurer              2024-11-14  714  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  715  			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  716  			tr = dev->needed_tailroom;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  717  			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  718  			if (unlikely(!skb))
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  719  				goto free_err;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  720  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  721  			skb_reserve(skb, hr);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  722  			skb_put(skb, len);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  723  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  724  			err = skb_store_bits(skb, 0, buffer, len);
0c0d0f42ffa6ac Felix Maurer              2024-11-14  725  			if (unlikely(err))
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  726  				goto free_err;
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  727  
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  728  			addrs = kzalloc(sizeof(*addrs), GFP_KERNEL);
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  729  			if (!addrs)
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  730  				goto free_err;
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  731  
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  732  			xsk_set_destructor_arg(skb, addrs);
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  733  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  734  		} else {
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  735  			int nr_frags = skb_shinfo(skb)->nr_frags;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  736  			struct page *page;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  737  			u8 *vaddr;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  738  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  739  			if (unlikely(nr_frags == (MAX_SKB_FRAGS - 1) && xp_mb_desc(desc))) {
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  740  				err = -EOVERFLOW;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  741  				goto free_err;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  742  			}
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  743  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  744  			page = alloc_page(xs->sk.sk_allocation);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  745  			if (unlikely(!page)) {
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  746  				err = -EAGAIN;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  747  				goto free_err;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  748  			}
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  749  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  750  			vaddr = kmap_local_page(page);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  751  			memcpy(vaddr, buffer, len);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  752  			kunmap_local(vaddr);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  753  
2127c604383666 Sebastian Andrzej Siewior 2024-02-02  754  			skb_add_rx_frag(skb, nr_frags, page, 0, len, PAGE_SIZE);
2127c604383666 Sebastian Andrzej Siewior 2024-02-02  755  			refcount_add(PAGE_SIZE, &xs->sk.sk_wmem_alloc);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  756  		}
48eb03dd26304c Stanislav Fomichev        2023-11-27  757  
48eb03dd26304c Stanislav Fomichev        2023-11-27  758  		if (first_frag && desc->options & XDP_TX_METADATA) {
48eb03dd26304c Stanislav Fomichev        2023-11-27  759  			if (unlikely(xs->pool->tx_metadata_len == 0)) {
48eb03dd26304c Stanislav Fomichev        2023-11-27  760  				err = -EINVAL;
48eb03dd26304c Stanislav Fomichev        2023-11-27  761  				goto free_err;
48eb03dd26304c Stanislav Fomichev        2023-11-27  762  			}
48eb03dd26304c Stanislav Fomichev        2023-11-27  763  
48eb03dd26304c Stanislav Fomichev        2023-11-27  764  			meta = buffer - xs->pool->tx_metadata_len;
ce59f9686e0eca Stanislav Fomichev        2023-11-27  765  			if (unlikely(!xsk_buff_valid_tx_metadata(meta))) {
ce59f9686e0eca Stanislav Fomichev        2023-11-27  766  				err = -EINVAL;
ce59f9686e0eca Stanislav Fomichev        2023-11-27  767  				goto free_err;
ce59f9686e0eca Stanislav Fomichev        2023-11-27  768  			}
48eb03dd26304c Stanislav Fomichev        2023-11-27  769  
48eb03dd26304c Stanislav Fomichev        2023-11-27  770  			if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
48eb03dd26304c Stanislav Fomichev        2023-11-27  771  				if (unlikely(meta->request.csum_start +
48eb03dd26304c Stanislav Fomichev        2023-11-27  772  					     meta->request.csum_offset +
48eb03dd26304c Stanislav Fomichev        2023-11-27  773  					     sizeof(__sum16) > len)) {
48eb03dd26304c Stanislav Fomichev        2023-11-27  774  					err = -EINVAL;
48eb03dd26304c Stanislav Fomichev        2023-11-27  775  					goto free_err;
48eb03dd26304c Stanislav Fomichev        2023-11-27  776  				}
48eb03dd26304c Stanislav Fomichev        2023-11-27  777  
48eb03dd26304c Stanislav Fomichev        2023-11-27  778  				skb->csum_start = hr + meta->request.csum_start;
48eb03dd26304c Stanislav Fomichev        2023-11-27  779  				skb->csum_offset = meta->request.csum_offset;
48eb03dd26304c Stanislav Fomichev        2023-11-27  780  				skb->ip_summed = CHECKSUM_PARTIAL;
11614723af26e7 Stanislav Fomichev        2023-11-27  781  
11614723af26e7 Stanislav Fomichev        2023-11-27  782  				if (unlikely(xs->pool->tx_sw_csum)) {
11614723af26e7 Stanislav Fomichev        2023-11-27  783  					err = skb_checksum_help(skb);
11614723af26e7 Stanislav Fomichev        2023-11-27  784  					if (err)
11614723af26e7 Stanislav Fomichev        2023-11-27  785  						goto free_err;
11614723af26e7 Stanislav Fomichev        2023-11-27  786  				}
48eb03dd26304c Stanislav Fomichev        2023-11-27  787  			}
ca4419f15abd19 Song Yoong Siang          2025-02-16  788  
ca4419f15abd19 Song Yoong Siang          2025-02-16  789  			if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
ca4419f15abd19 Song Yoong Siang          2025-02-16  790  				skb->skb_mstamp_ns = meta->request.launch_time;
48eb03dd26304c Stanislav Fomichev        2023-11-27  791  		}
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  792  	}
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  793  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  794  	skb->dev = dev;
10bbf1652c1cca Eric Dumazet              2023-09-21  795  	skb->priority = READ_ONCE(xs->sk.sk_priority);
3c5b4d69c358a9 Eric Dumazet              2023-07-28  796  	skb->mark = READ_ONCE(xs->sk.sk_mark);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  797  	skb->destructor = xsk_destruct_skb;
48eb03dd26304c Stanislav Fomichev        2023-11-27  798  	xsk_tx_metadata_to_compl(meta, &skb_shinfo(skb)->xsk_meta);
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  799  
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  800  	addrs = (struct xsk_addrs *)skb_shinfo(skb)->destructor_arg;
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  801  	addrs->addrs[addrs->num_descs++] = desc->addr;
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  802  
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  803  	return skb;
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  804  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  805  free_err:
0c0d0f42ffa6ac Felix Maurer              2024-11-14  806  	if (first_frag && skb)
0c0d0f42ffa6ac Felix Maurer              2024-11-14  807  		kfree_skb(skb);
0c0d0f42ffa6ac Felix Maurer              2024-11-14  808  
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  809  	if (err == -EOVERFLOW) {
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  810  		/* Drop the packet */
67a37dcecabbf0 Maciej Fijalkowski        2025-07-05  811  		xsk_inc_skb_descs(xs->skb);
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  812  		xsk_drop_skb(xs->skb);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  813  		xskq_cons_release(xs->tx);
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  814  	} else {
9d0a67b9d42c63 Tirthendu Sarkar          2023-08-23  815  		/* Let application retry */
e6c4047f512280 Maciej Fijalkowski        2024-10-07  816  		xsk_cq_cancel_locked(xs->pool, 1);
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  817  	}
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19  818  
cf24f5a5feeaae Tirthendu Sarkar          2023-07-19 @819  	return ERR_PTR(err);
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  820  }
9c8f21e6f8856a Xuan Zhuo                 2021-02-18  821  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
