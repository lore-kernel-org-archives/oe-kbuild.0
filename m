Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24451E0E16
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497471; cv=none; b=N/Z76Q3lLcCc2t8sxt6+9uFUx0+oNgOJygpP8dqcDJ/g3ohg7jGEpriyxKVbVYjnsabw2zF8okerW2al9QQPLlz3lcZvR3DnGwwEB/c6itAFThnWfA2szhC/xtL8gtXLVxvX0/MTSetg1pyr4E2yF6R4s61z6rz0GuVvIAMujYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497471; c=relaxed/simple;
	bh=gRciE7UrLWKcQsnMUVjLei/a55YaQ+6FU4N/KEfEgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dw+0gyCMM3w5eVBbM7mOHRPoOFuJfm2gvvQo6l6ENi8lB4t+zcas6t2xNd6/k896a4CMvHrn6I0sNx5Z8aPc2znmsMa6vyYz0+SHlqqRy0epyHYvVTI/HBsu9ZoJNGHfI5YB9CgqGZvM/b/wZ2hOQIEWz6PoXtnWTBZxKl1WmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gS/ezUNj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gS/ezUNj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so36831385e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729497466; x=1730102266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QLLGKV0RXIODHGWcOwi3wBpKpNrXJ+9J/r9lKbMo94=;
        b=gS/ezUNjPVM+DOP04abxzXvUYxsLYm9uMGTpEMxX165eScQMUC3l941uSDyc1zCN6X
         9pOSvOIgHbgsxrWsBmkSDoFlG/4YbWd1ZizIJ0v7cbzwxgb0Xq85oUXWiMbI/zIcp0ux
         BpneTP8NgMl+AvA82nYqCGEJPSguw9JbxPYJjsuicEeljjRSWZkDtxvi76iYFUUakktz
         Y86oxP4MQvlxcOHG2GKwlW3cL97+o0rD+mWfp8ztIQZEGabA5wnOfqGDsxFxiWFxsXBG
         Drp7XmkejM67Oeri8s27s2pLqmdOHJEeUIQ1NDbqtLV5OSgHJCw/kVT21oE28zRiBT/6
         5Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497466; x=1730102266;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QLLGKV0RXIODHGWcOwi3wBpKpNrXJ+9J/r9lKbMo94=;
        b=XmLRhMJBWlAdmMRszw2WRjm0pjdkRCuNw/hEWT9ZBUcp8baBkdqLKwqYJeGAVnPcPq
         zC7LgiP8+NwB/aWCzm5BGGC6GKGLEbwpttP6RCQfmjiI0JIB3qcRXveN9chkoVOanYWv
         ylWmZl3twihKcqDN52Adoy3jYU9uCDXwMkuQ+VO2OInJo3FSiKhH29an7oeGuiBdgaHy
         ALhglkHCvW5z7CCbW3PRusWD4yOQN+J9y0xdWUHZyLz71/rRBCIYZ8ao6/XDn6JKp3ql
         fZCoXNdRhaLjnclKwJ03scW+PLHqo38jH7KhhO2v0wzKJdjIqz3P2/cRncjHhbCfK6Lh
         t3tQ==
X-Gm-Message-State: AOJu0YyiOMLJ15aVZ07sEUYRv7OBizbXvkvSQk1zA+/TIvk0R1EAnRlu
	pKpCPRw9LWor4SkuoUO61OgieMdFSO6wb9PHAbpl0gYr7kskzIss2Mq1xP78nXXXRNBuaP/I0tH
	X
X-Google-Smtp-Source: AGHT+IFC5LjGt15HKSqsNmJkoUks+PyZquHbaGrZQo4P25ZWHzI9A2dtn2RgT8YFtkUjHLjXiV0fvQ==
X-Received: by 2002:a7b:c8c6:0:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-431616a3bfamr77893135e9.28.1729497466511;
        Mon, 21 Oct 2024 00:57:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57ba16sm48205665e9.11.2024.10.21.00.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:57:46 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:57:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yue Haibing <yuehaibing@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-next-queue:dev-queue 50/51]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq()
 error: uninitialized symbol 'xdp_res'.
Message-ID: <4fcf3e40-06b1-49ac-806e-078e3df79243@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   02a4f6b6bf8145719b1318ef112758c889660044
commit: 25892a448d275daf1dd6714aa5ffa51ad78e9dda [50/51] ixgbe: Fix passing 0 to ERR_PTR in ixgbe_run_xdp()
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210921.qWQ9GIQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410210921.qWQ9GIQR-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq() error: uninitialized symbol 'xdp_res'.

vim +/xdp_res +2391 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c

5a85e737f30ce7 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eliezer Tamir          2013-06-10  2328  static int ixgbe_clean_rx_irq(struct ixgbe_q_vector *q_vector,
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2329  			       struct ixgbe_ring *rx_ring,
f4de00ed58df50 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-09-25  2330  			       const int budget)
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2331  {
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2332  	unsigned int total_rx_bytes = 0, total_rx_packets = 0, frame_sz = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2333  	struct ixgbe_adapter *adapter = q_vector->adapter;
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2334  #ifdef IXGBE_FCOE
4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2335  	int ddp_bytes;
4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2336  	unsigned int mss = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2337  #endif /* IXGBE_FCOE */
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2338  	u16 cleaned_count = ixgbe_desc_unused(rx_ring);
c0d4e9d223c5f4 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Maciej Fijalkowski     2021-01-18  2339  	unsigned int offset = rx_ring->rx_offset;
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2340  	unsigned int xdp_xmit = 0;
99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2341  	struct xdp_buff xdp;
25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2342  	int xdp_res;
99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2343  
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2344  	/* Frame size depend on rx_ring setup when PAGE_SIZE=4K */
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2345  #if (PAGE_SIZE < 8192)
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2346  	frame_sz = ixgbe_rx_frame_truesize(rx_ring, 0);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2347  #endif
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2348  	xdp_init_buff(&xdp, frame_sz, &rx_ring->xdp_rxq);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2349  
fdabfc8a74c713 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eric W. Biederman      2014-03-14  2350  	while (likely(total_rx_packets < budget)) {
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2351  		union ixgbe_adv_rx_desc *rx_desc;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2352  		struct ixgbe_rx_buffer *rx_buffer;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2353  		struct sk_buff *skb;
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2354  		int rx_buffer_pgcnt;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2355  		unsigned int size;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2356  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2357  		/* return some buffers to hardware, one at a time is too slow */
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2358  		if (cleaned_count >= IXGBE_RX_BUFFER_WRITE) {
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2359  			ixgbe_alloc_rx_buffers(rx_ring, cleaned_count);
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2360  			cleaned_count = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2361  		}
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2362  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2363  		rx_desc = IXGBE_RX_DESC(rx_ring, rx_ring->next_to_clean);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2364  		size = le16_to_cpu(rx_desc->wb.upper.length);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2365  		if (!size)
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2366  			break;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2367  
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2368  		/* This memory barrier is needed to keep us from reading
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2369  		 * any other fields out of the rx_desc until we know the
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2370  		 * descriptor has been written back
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2371  		 */
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2372  		dma_rmb();
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2373  
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2374  		rx_buffer = ixgbe_get_rx_buffer(rx_ring, rx_desc, &skb, size, &rx_buffer_pgcnt);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2375  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2376  		/* retrieve a buffer from the ring */
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2377  		if (!skb) {
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2378  			unsigned char *hard_start;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2379  
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2380  			hard_start = page_address(rx_buffer->page) +
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2381  				     rx_buffer->page_offset - offset;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2382  			xdp_prepare_buff(&xdp, hard_start, offset, size, true);
470bcfd6039b39 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2022-05-12  2383  			xdp_buff_clear_frags_flag(&xdp);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2384  #if (PAGE_SIZE > 4096)
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2385  			/* At larger PAGE_SIZE, frame_sz depend on len size */
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2386  			xdp.frame_sz = ixgbe_rx_frame_truesize(rx_ring, size);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2387  #endif
25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2388  			xdp_res = ixgbe_run_xdp(adapter, rx_ring, &xdp);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2389  		}

xdp_res isn't initialized on else path

9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2390  
25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18 @2391  		if (xdp_res) {
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2392  			if (xdp_res & (IXGBE_XDP_TX | IXGBE_XDP_REDIR)) {
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2393  				xdp_xmit |= xdp_res;
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2394  				ixgbe_rx_buffer_flip(rx_ring, rx_buffer, size);
7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2395  			} else {
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2396  				rx_buffer->pagecnt_bias++;
7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2397  			}
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2398  			total_rx_packets++;
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2399  			total_rx_bytes += size;
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2400  		} else if (skb) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

