Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15703136A
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 05:47:58 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so29519615e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Aug 2023 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691387277; x=1691992077;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2lqaFP8Knrgb+FHi43o2lKjtcbfxhIgf4CGx+AFgEA=;
        b=xmMjG2oiA6uXq//d82A/o8s61H8S5cCU5g9cwMLc9VzzPPAUPplMJK8D8cM1lk57OZ
         FNvsLCxnA3rJYMC2Fq2k1Qmm3hinQH/nUcde3l6uG5d3WuHEZmgWXKiO2p694H83v18Q
         v50KeqvWD1D0mQrfthUswmYIcs8T7GDaFNU2cRktczk9IbLCleFtg57Y44JjcYe/bjc+
         wZPNxTPkI1N296QXtpP0QEExexAz5z0ek6dJFXuorTMhYgU+ArM4EP8NYWoL2Y64Rx1R
         qCt1KV8Vdm3opIuFI0uvFgIESW+5L3k8rB/4pYHOHqeEqZw4ih7cUKLUG02c4JDjYNmJ
         3ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691387277; x=1691992077;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2lqaFP8Knrgb+FHi43o2lKjtcbfxhIgf4CGx+AFgEA=;
        b=NsGZ+hP7AFK8dOGjSKBEBw1TzGocp92lFrlJg20O8RnMyzs55QsVr4yShI6A0dZbzD
         m4tJN7R2vs2K6qEGNJnD/eP+/hgJcnViIdzepPD2Pr2gIqsT/21IF3myxiKd41vpuclW
         ewOdTaUqdFUSF17DLerv0Q9HcQSduhJ572VOxovuFwhGF/ydBuT3GOoSP9HPpOoe9TjH
         euOEX4cfmzNLTv9GJeAbRMDgRb0l90gVhJiSywyxVQTPc61V0ebCl4ejgv764j5udzxW
         AUjW507XntnsuptGNWZhy/pQ3jgCXoseN/G7RmVhaX5TSnv4/B3A0dIbIDVHhf8YHEpz
         H7dg==
X-Gm-Message-State: AOJu0YwuLy8SOeD5B2X8e+L4fr3naWvewUS4+dh1/uNo6lQmX84R31x5
	eoCqFq6cl5vD/svUe/jz/XRnGADnRVuCHHlVBwk=
X-Google-Smtp-Source: AGHT+IFaQ4oOCA5mHemv6K2siNMRL1nP0TAv/RhSy5k7SARgMeucBj8ZZKRyin1tiddeRr0QVYebXg==
X-Received: by 2002:a5d:5681:0:b0:317:4bde:9e72 with SMTP id f1-20020a5d5681000000b003174bde9e72mr4407571wrv.10.1691387276728;
        Sun, 06 Aug 2023 22:47:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adfdc8f000000b00317909f9985sm9308531wrj.113.2023.08.06.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 22:47:56 -0700 (PDT)
Date: Mon, 7 Aug 2023 08:47:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Stanislav Fomichev <sdf@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v4 2/8] xsk: add TX timestamp and TX checksum
 offload support
Message-ID: <2e5f3a43-c16c-41ac-a303-6374b2cf9fb5@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724235957.1953861-3-sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/xsk-Support-XDP_TX_METADATA_LEN/20230725-080600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230724235957.1953861-3-sdf%40google.com
patch subject: [RFC net-next v4 2/8] xsk: add TX timestamp and TX checksum offload support
config: i386-randconfig-m021-20230806 (https://download.01.org/0day-ci/archive/20230807/202308070029.iaEW5Co2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070029.iaEW5Co2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308070029.iaEW5Co2-lkp@intel.com/

New smatch warnings:
net/xdp/xsk.c:707 xsk_build_skb() error: uninitialized symbol 'hr'.

vim +/hr +707 net/xdp/xsk.c

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
                                                                ^^^^^^^

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

"hr" isn't set if skb is non-NULL at the start.

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
                                                                                                  ^^
Uninitialized?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

