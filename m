Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B46813
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 05:51:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fba86f069bso2420177e87.3
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 22:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689918714; x=1690523514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scG5mpJgoEGiF9eUD047/NjLlGgNE0MlzS9UvGCozXs=;
        b=XSQSmnSEpWm3VtdTnvuINjIN2Dm1O5YtvYOLOYHbQzlmA5CwX+2dE0o5OiCsmiiR/z
         BOUKHYmfkdzA0ne8qxORKuXYQ1+hviHETQzjfUdApTpsGq8h2Okca5nRDjKmSgrmYaNc
         VcGGqzNN+2xdO49E/rA8iGADtKJ/3A1mK97WgsamOwjKpdkvQbfhJOCi9s83CS08pNgz
         17VZ05G5RxKSL2vJBAVU4axX6BCmRHXiPJT7tonJ/9GMDhQhFZPPwq6NWmAHByi5LaKY
         YrE0yJYUwkYuvAJ/SHcVmcP5gdSsNMGxly1izSP83hoFkZhrY4lak5MqQI8Hk126BfhM
         U8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689918714; x=1690523514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scG5mpJgoEGiF9eUD047/NjLlGgNE0MlzS9UvGCozXs=;
        b=lgGu6glioYgRj/TlVka6mi2x7ZWSwpniUrpv8JtN7NcneMBjVLzDJpZYqsNs6J7LGT
         kVqEsX7JDD4SQCOGxB6FpPy3t+ipdtZvJNpPLRMYfB2GyVDB141etMd7oRx6yTCBL8P+
         Pct3TUgs6PM53vn+GDK0kHqeUC+TSO+Nr6ZV/bcBR2PBAmTYouzEAM4T4B328SZ1X/es
         3hI16ANcdfymT9nK32nOhrF4g1N+bnT8hH30DgGT5SzQEJtx1fQxP0dQb+jH84OxeiHK
         VEQPILpekP+N54gVpZhC4SdinvaWprFN5iQiDNr9/J9Y3burp3ra0s956fZ+UZ6m+6Hd
         YGXw==
X-Gm-Message-State: ABy/qLaDJ+fxDd7RIc24LukYHBDysO7Rk/1/gZiTxy7HB9NwT3Pd2ak3
	rm23woIiBcWJU39uQc9/HH4Z9sZiKJbejk8eM6w=
X-Google-Smtp-Source: APBJJlEavLLyZyy0NOg6IVFV07VWBRuvayai9qtqVDZDgLIFf2tlMkKBh8rHh6O3RXpO41wENm/bQg==
X-Received: by 2002:a05:6512:31ca:b0:4fd:d078:2e3f with SMTP id j10-20020a05651231ca00b004fdd0782e3fmr619182lfe.42.1689918713898;
        Thu, 20 Jul 2023 22:51:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003fbb9339b29sm5329427wmj.42.2023.07.20.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 22:51:52 -0700 (PDT)
Date: Fri, 21 Jul 2023 08:51:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Tirthendu Sarkar <tirthendu.sarkar@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 3186/3762] net/xdp/xsk.c:671 xsk_build_skb()
 error: 'skb' dereferencing possible ERR_PTR()
Message-ID: <3606f974-f62a-43b0-b36a-ee7727117bf9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: cf24f5a5feeaae34c1a34d1e04f8ac697290427a [3186/3762] xsk: add support for AF_XDP multi-buffer on Tx path
config: x86_64-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210434.OjgqFcbB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210434.OjgqFcbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307210434.OjgqFcbB-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:671 xsk_build_skb() error: 'skb' dereferencing possible ERR_PTR()

vim +/skb +671 net/xdp/xsk.c

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

We don't know that err is -EAGAIN

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

Dereferenced inside function.

cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  672  		xsk_drop_skb(skb);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  673  		xskq_cons_release(xs->tx);
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  674  	}
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  675  
cf24f5a5feeaae3 Tirthendu Sarkar 2023-07-19  676  	return ERR_PTR(err);
9c8f21e6f8856a9 Xuan Zhuo        2021-02-18  677  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

