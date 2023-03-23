Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0750944E;
	Thu, 23 Mar 2023 14:07:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l37so638801wms.2;
        Thu, 23 Mar 2023 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679580452;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crXeTIWo4qSeWr4EOhlnolA90o4cXKZeE8HP71js+2E=;
        b=U/CnSSpssO9Q36Hswk5QD1zDTYQZ8VxrkEO7sS6t8mKB20IpEap8woSlRqAiqISloc
         vnJ/ZP+FfpXbNaKhsyRGPp47/md8vaza3kmFxQWikMa+4PCW5SytqkZxy6rn2aJ8hB+3
         yVk5LuHGaP8pPop+xHVchCUvxfASbD760jX/yWJOHd0wz2/9LppcTfr2F2ipvMXQS7yQ
         rwChZLxcUbNs+6bodlu13dqqZ47FRZP6PLtIzsK++lHDwTq7H2qk06JzCUQ4tEjPkp19
         /LhbTz9VeWoA4lVgV76JDIowBN+wyj6DirjewRv6pOly3yuHGJqwRnWQq0oaOSZUf4lo
         eJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580452;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crXeTIWo4qSeWr4EOhlnolA90o4cXKZeE8HP71js+2E=;
        b=gQgTp4iWDh9bl3ZWvPZsNrUpCYA1sMKo1qVUX1QBCz1dXuMX4+eY/an6N5Dgeb5JLa
         rjC2LcTYr0ivUW22YI+qh4Cwx1q4LkPJ7y1iil4ZsIhngJ0tDh3VpuLjWPwfedo6iHDo
         OWUUAdfV8bhkYhOBHZSvPOTFq36rPeeR7SJ/strornMBbdkrntc4nRau3RQ3M1lOkOV0
         QOLnc9vze/xw3jbW300bD1xCC+qgYqA+22wScbSlMpAKUXZIX3IBkHW2scXztoO6H7Bc
         poXt2yUTAirZvhrJj35YzFhZePRF6aSqkGsWpumEmS0B0mh98PQGmHvF6/hzRSzVImMk
         KxwA==
X-Gm-Message-State: AO0yUKU+vvOvUWBHB91UiuDejXxJcS/9Vpht36ebTXO5hovqNoEyfR2P
	0PCSCxLf77UGzS+M7TG8o9d1LbfM6QI=
X-Google-Smtp-Source: AK7set9uHD8p5TGfQnakVsBjZi5/rNKThr0rXtt8eF/WVYUvKCrfQ3a9bjASL1L9QzWfYMF6sgVkgA==
X-Received: by 2002:a05:600c:218d:b0:3eb:a4e:a2b2 with SMTP id e13-20020a05600c218d00b003eb0a4ea2b2mr2434112wme.4.1679580451706;
        Thu, 23 Mar 2023 07:07:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc30a000000b003eafc47eb09sm1927877wmj.43.2023.03.23.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:07:31 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:07:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, William Tu <u9012063@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
Message-ID: <8ddd5e22-91e6-407d-86bc-220fce2f6e0f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318214953.36834-1-u9012063@gmail.com>

Hi William,

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3-Add-XDP-support/20230319-055034
patch link:    https://lore.kernel.org/r/20230318214953.36834-1-u9012063%40gmail.com
patch subject: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230323/202303232106.UkMR3FEX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303232106.UkMR3FEX-lkp@intel.com/

smatch warnings:
drivers/net/vmxnet3/vmxnet3_xdp.c:362 vmxnet3_process_xdp_small() warn: variable dereferenced before check 'skb_xdp_pass' (see line 361)
drivers/net/vmxnet3/vmxnet3_xdp.c:406 vmxnet3_process_xdp() warn: variable dereferenced before check 'skb_xdp_pass' (see line 405)

vim +/skb_xdp_pass +362 drivers/net/vmxnet3/vmxnet3_xdp.c

089db7a8620943 William Tu 2023-03-18  351  	rcu_read_lock();
089db7a8620943 William Tu 2023-03-18  352  	xdp_prog = rcu_dereference(rq->adapter->xdp_bpf_prog);
089db7a8620943 William Tu 2023-03-18  353  	if (!xdp_prog) {
089db7a8620943 William Tu 2023-03-18  354  		act = XDP_PASS;
089db7a8620943 William Tu 2023-03-18  355  		goto out_skb;
089db7a8620943 William Tu 2023-03-18  356  	}
089db7a8620943 William Tu 2023-03-18  357  	act = vmxnet3_run_xdp(rq, &xdp, xdp_prog);
089db7a8620943 William Tu 2023-03-18  358  
089db7a8620943 William Tu 2023-03-18  359  	if (act == XDP_PASS) {
089db7a8620943 William Tu 2023-03-18  360  out_skb:
089db7a8620943 William Tu 2023-03-18 @361  		*skb_xdp_pass = vmxnet3_build_skb(rq, page, &xdp);
089db7a8620943 William Tu 2023-03-18 @362  		if (!skb_xdp_pass)

This should be testing if (!*skb_xdp_pass)

089db7a8620943 William Tu 2023-03-18  363  			return XDP_DROP;
089db7a8620943 William Tu 2023-03-18  364  	}
089db7a8620943 William Tu 2023-03-18  365  
089db7a8620943 William Tu 2023-03-18  366  	/* No need to refill. */
089db7a8620943 William Tu 2023-03-18  367  	return act;
089db7a8620943 William Tu 2023-03-18  368  }
089db7a8620943 William Tu 2023-03-18  369  
089db7a8620943 William Tu 2023-03-18  370  int
089db7a8620943 William Tu 2023-03-18  371  vmxnet3_process_xdp(struct vmxnet3_adapter *adapter,
089db7a8620943 William Tu 2023-03-18  372  		    struct vmxnet3_rx_queue *rq,
089db7a8620943 William Tu 2023-03-18  373  		    struct Vmxnet3_RxCompDesc *rcd,
089db7a8620943 William Tu 2023-03-18  374  		    struct vmxnet3_rx_buf_info *rbi,
089db7a8620943 William Tu 2023-03-18  375  		    struct Vmxnet3_RxDesc *rxd,
089db7a8620943 William Tu 2023-03-18  376  		    struct sk_buff **skb_xdp_pass)
089db7a8620943 William Tu 2023-03-18  377  {
089db7a8620943 William Tu 2023-03-18  378  	struct bpf_prog *xdp_prog;
089db7a8620943 William Tu 2023-03-18  379  	dma_addr_t new_dma_addr;
089db7a8620943 William Tu 2023-03-18  380  	struct xdp_buff xdp;
089db7a8620943 William Tu 2023-03-18  381  	struct page *page;
089db7a8620943 William Tu 2023-03-18  382  	void *new_data;
089db7a8620943 William Tu 2023-03-18  383  	int act;
089db7a8620943 William Tu 2023-03-18  384  
089db7a8620943 William Tu 2023-03-18  385  	page = rbi->page;
089db7a8620943 William Tu 2023-03-18  386  	dma_sync_single_for_cpu(&adapter->pdev->dev,
089db7a8620943 William Tu 2023-03-18  387  				page_pool_get_dma_addr(page) +
089db7a8620943 William Tu 2023-03-18  388  				rq->page_pool->p.offset, rcd->len,
089db7a8620943 William Tu 2023-03-18  389  				page_pool_get_dma_dir(rq->page_pool));
089db7a8620943 William Tu 2023-03-18  390  
089db7a8620943 William Tu 2023-03-18  391  	xdp_init_buff(&xdp, rbi->len, &rq->xdp_rxq);
089db7a8620943 William Tu 2023-03-18  392  	xdp_prepare_buff(&xdp, page_address(page), rq->page_pool->p.offset,
089db7a8620943 William Tu 2023-03-18  393  			 rcd->len, false);
089db7a8620943 William Tu 2023-03-18  394  	xdp_buff_clear_frags_flag(&xdp);
089db7a8620943 William Tu 2023-03-18  395  
089db7a8620943 William Tu 2023-03-18  396  	xdp_prog = rcu_dereference(rq->adapter->xdp_bpf_prog);
089db7a8620943 William Tu 2023-03-18  397  	if (!xdp_prog) {
089db7a8620943 William Tu 2023-03-18  398  		act = XDP_PASS;
089db7a8620943 William Tu 2023-03-18  399  		goto out_skb;
089db7a8620943 William Tu 2023-03-18  400  	}
089db7a8620943 William Tu 2023-03-18  401  	act = vmxnet3_run_xdp(rq, &xdp, xdp_prog);
089db7a8620943 William Tu 2023-03-18  402  
089db7a8620943 William Tu 2023-03-18  403  	if (act == XDP_PASS) {
089db7a8620943 William Tu 2023-03-18  404  out_skb:
089db7a8620943 William Tu 2023-03-18 @405  		*skb_xdp_pass = vmxnet3_build_skb(rq, page, &xdp);
089db7a8620943 William Tu 2023-03-18 @406  		if (!skb_xdp_pass)
                                                            ^^^^^^^^^^^^^
Same.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

