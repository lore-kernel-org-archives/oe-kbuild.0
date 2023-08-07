Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF646392
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 01:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691373210; x=1722909210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xB+ZgrGXmhhwBjWVkZoxFO66r5UiztMCd1yTTUhF7G4=;
  b=hcO69FuvAeGokg81HzZq7qj36na9g4RFpwBIr21XtU7RkU8gNCZ9wuSz
   At3yy934JpxoXlg4sS0+p+yAGNSVOZw0ElPKbTjrPXaGRWCwuMkSvAVEK
   Jutgc4F8l68tI4mT8yB8T+BnAqhNlq1WPKN+qQnaXHLlhkc5/1mm/bQWU
   uaigpSdBDlX3eusd2F0j1mESvYF/DGl64cRnXiCPkOMB3Zluj2D8kP/s7
   QF0Rm7JAQUNqJhVb8KTeU/p30xtrxPIVUD8nZz+i+HI6vMZof2KZg70E8
   DAbxXN9i/l12FcR6GXJT/mzQK2I4+UgXtUZ86/YNIdqP3sUXq0zHXI1xI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="370431261"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="370431261"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="800759375"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="800759375"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Aug 2023 18:53:28 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSpR1-0004Tt-18;
	Mon, 07 Aug 2023 01:53:27 +0000
Date: Mon, 7 Aug 2023 09:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC net-next v4 2/8] xsk: add TX timestamp and TX checksum
 offload support
Message-ID: <202308070948.jjqDEUQa-lkp@intel.com>
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
In-Reply-To: <20230724235957.1953861-3-sdf@google.com>
References: <20230724235957.1953861-3-sdf@google.com>
TO: Stanislav Fomichev <sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/xsk-Support-XDP_TX_METADATA_LEN/20230725-080600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230724235957.1953861-3-sdf%40google.com
patch subject: [RFC net-next v4 2/8] xsk: add TX timestamp and TX checksum offload support
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-m021-20230806 (https://download.01.org/0day-ci/archive/20230807/202308070948.jjqDEUQa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070948.jjqDEUQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308070948.jjqDEUQa-lkp@intel.com/

New smatch warnings:
net/xdp/xsk.c:707 xsk_build_skb() error: uninitialized symbol 'hr'.

Old smatch warnings:
net/xdp/xsk.c:733 xsk_build_skb() error: 'skb' dereferencing possible ERR_PTR()

vim +/hr +707 net/xdp/xsk.c

9c8f21e6f8856a Xuan Zhuo          2021-02-18  634  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  635  static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
9c8f21e6f8856a Xuan Zhuo          2021-02-18  636  				     struct xdp_desc *desc)
9c8f21e6f8856a Xuan Zhuo          2021-02-18  637  {
105eed6b3f493a Stanislav Fomichev 2023-07-24  638  	struct xsk_tx_metadata *meta = NULL;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  639  	struct net_device *dev = xs->dev;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  640  	struct sk_buff *skb = xs->skb;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  641  	int err;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  642  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  643  	if (dev->priv_flags & IFF_TX_SKB_NO_LINEAR) {
9c8f21e6f8856a Xuan Zhuo          2021-02-18  644  		skb = xsk_build_skb_zerocopy(xs, desc);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  645  		if (IS_ERR(skb)) {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  646  			err = PTR_ERR(skb);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  647  			goto free_err;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  648  		}
9c8f21e6f8856a Xuan Zhuo          2021-02-18  649  	} else {
9c8f21e6f8856a Xuan Zhuo          2021-02-18  650  		u32 hr, tr, len;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  651  		void *buffer;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  652  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  653  		buffer = xsk_buff_raw_get_data(xs->pool, desc->addr);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  654  		len = desc->len;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  655  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  656  		if (!skb) {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  657  			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  658  			tr = dev->needed_tailroom;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  659  			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  660  			if (unlikely(!skb))
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  661  				goto free_err;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  662  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  663  			skb_reserve(skb, hr);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  664  			skb_put(skb, len);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  665  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  666  			err = skb_store_bits(skb, 0, buffer, len);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  667  			if (unlikely(err))
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  668  				goto free_err;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  669  		} else {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  670  			int nr_frags = skb_shinfo(skb)->nr_frags;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  671  			struct page *page;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  672  			u8 *vaddr;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  673  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  674  			if (unlikely(nr_frags == (MAX_SKB_FRAGS - 1) && xp_mb_desc(desc))) {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  675  				err = -EFAULT;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  676  				goto free_err;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  677  			}
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  678  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  679  			page = alloc_page(xs->sk.sk_allocation);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  680  			if (unlikely(!page)) {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  681  				err = -EAGAIN;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  682  				goto free_err;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  683  			}
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  684  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  685  			vaddr = kmap_local_page(page);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  686  			memcpy(vaddr, buffer, len);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  687  			kunmap_local(vaddr);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  688  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  689  			skb_add_rx_frag(skb, nr_frags, page, 0, len, 0);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  690  		}
105eed6b3f493a Stanislav Fomichev 2023-07-24  691  
105eed6b3f493a Stanislav Fomichev 2023-07-24  692  		if (desc->options & XDP_TX_METADATA) {
105eed6b3f493a Stanislav Fomichev 2023-07-24  693  			if (unlikely(xs->tx_metadata_len == 0)) {
105eed6b3f493a Stanislav Fomichev 2023-07-24  694  				err = -EINVAL;
105eed6b3f493a Stanislav Fomichev 2023-07-24  695  				goto free_err;
105eed6b3f493a Stanislav Fomichev 2023-07-24  696  			}
105eed6b3f493a Stanislav Fomichev 2023-07-24  697  
105eed6b3f493a Stanislav Fomichev 2023-07-24  698  			meta = buffer - xs->tx_metadata_len;
105eed6b3f493a Stanislav Fomichev 2023-07-24  699  
105eed6b3f493a Stanislav Fomichev 2023-07-24  700  			if (meta->flags & XDP_TX_METADATA_CHECKSUM) {
105eed6b3f493a Stanislav Fomichev 2023-07-24  701  				if (unlikely(meta->csum_start + meta->csum_offset +
105eed6b3f493a Stanislav Fomichev 2023-07-24  702  					     sizeof(__sum16) > len)) {
105eed6b3f493a Stanislav Fomichev 2023-07-24  703  					err = -EINVAL;
105eed6b3f493a Stanislav Fomichev 2023-07-24  704  					goto free_err;
105eed6b3f493a Stanislav Fomichev 2023-07-24  705  				}
105eed6b3f493a Stanislav Fomichev 2023-07-24  706  
105eed6b3f493a Stanislav Fomichev 2023-07-24 @707  				skb->csum_start = hr + meta->csum_start;
105eed6b3f493a Stanislav Fomichev 2023-07-24  708  				skb->csum_offset = meta->csum_offset;
105eed6b3f493a Stanislav Fomichev 2023-07-24  709  				skb->ip_summed = CHECKSUM_PARTIAL;
105eed6b3f493a Stanislav Fomichev 2023-07-24  710  
105eed6b3f493a Stanislav Fomichev 2023-07-24  711  				if (unlikely(meta->flags & XDP_TX_METADATA_CHECKSUM_SW)) {
105eed6b3f493a Stanislav Fomichev 2023-07-24  712  					err = skb_checksum_help(skb);
105eed6b3f493a Stanislav Fomichev 2023-07-24  713  					if (err)
105eed6b3f493a Stanislav Fomichev 2023-07-24  714  						goto free_err;
105eed6b3f493a Stanislav Fomichev 2023-07-24  715  				}
105eed6b3f493a Stanislav Fomichev 2023-07-24  716  			}
105eed6b3f493a Stanislav Fomichev 2023-07-24  717  		}
9c8f21e6f8856a Xuan Zhuo          2021-02-18  718  	}
9c8f21e6f8856a Xuan Zhuo          2021-02-18  719  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  720  	skb->dev = dev;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  721  	skb->priority = xs->sk.sk_priority;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  722  	skb->mark = xs->sk.sk_mark;
9c8f21e6f8856a Xuan Zhuo          2021-02-18  723  	skb->destructor = xsk_destruct_skb;
105eed6b3f493a Stanislav Fomichev 2023-07-24  724  	skb_shinfo(skb)->xsk_meta = meta;
b7f72a30e9ac25 Tirthendu Sarkar   2023-07-19  725  	xsk_set_destructor_arg(skb);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  726  
9c8f21e6f8856a Xuan Zhuo          2021-02-18  727  	return skb;
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  728  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  729  free_err:
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  730  	if (err == -EAGAIN) {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  731  		xsk_cq_cancel_locked(xs, 1);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  732  	} else {
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  733  		xsk_set_destructor_arg(skb);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  734  		xsk_drop_skb(skb);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  735  		xskq_cons_release(xs->tx);
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  736  	}
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  737  
cf24f5a5feeaae Tirthendu Sarkar   2023-07-19  738  	return ERR_PTR(err);
9c8f21e6f8856a Xuan Zhuo          2021-02-18  739  }
9c8f21e6f8856a Xuan Zhuo          2021-02-18  740  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
