Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520A91D1304;
	Mon, 21 Oct 2024 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498518; cv=none; b=tkx+1KUiU4ng/ENHHe4qflzxjEgfbMoNrVbGbTKkLaiMDmMtYqrbS6O89t2fO0Jy6M5blJMU7aoTj5F89UPJohak0n7SNgpyjNCjMwg12rBbGOfoknbq4AKChmKDPVEk6WhbB6W+JXUGI34t+xpOGexZLD1ncmEqloNs9riGB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498518; c=relaxed/simple;
	bh=wTFcKHNa82Fz4sVssIfWJpTXGU6h/RFqQ1enWClSSIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R22Qcp58xvRq3dK+On4DFwVT5LvhD1E6JYWLxXldb+xUsMXPKX5hJuEs3UjdBGSPs3pk6gEwDGamhDmB58oMbmPx24nbj9SA2kBfxuAcSn6tkkPADzJ5OnypKFVz43kJvjhXw9m3itdqwK3U11BfwY3xnDfXu9Hp9qBaUKnJwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XX7Km6XBtz1HFfR;
	Mon, 21 Oct 2024 16:10:52 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FC171A016C;
	Mon, 21 Oct 2024 16:15:11 +0800 (CST)
Received: from [10.174.179.113] (10.174.179.113) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Oct 2024 16:15:11 +0800
Message-ID: <3c784db3-bb9e-4319-788b-44a090f48c22@huawei.com>
Date: Mon, 21 Oct 2024 16:15:10 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [tnguy-next-queue:dev-queue 50/51]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq()
 error: uninitialized symbol 'xdp_res'.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Intel Wired LAN
	<intel-wired-lan@lists.osuosl.org>, Tony Nguyen <anthony.l.nguyen@intel.com>
References: <4fcf3e40-06b1-49ac-806e-078e3df79243@stanley.mountain>
From: Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <4fcf3e40-06b1-49ac-806e-078e3df79243@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)

On 2024/10/21 15:57, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
> head:   02a4f6b6bf8145719b1318ef112758c889660044
> commit: 25892a448d275daf1dd6714aa5ffa51ad78e9dda [50/51] ixgbe: Fix passing 0 to ERR_PTR in ixgbe_run_xdp()
> config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210921.qWQ9GIQR-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410210921.qWQ9GIQR-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq() error: uninitialized symbol 'xdp_res'.

Sorry，I forget to initialized 'xdp_res' in ixgbe and ixgbevf, should I send v3 or just a fix patch on v2?
> 
> vim +/xdp_res +2391 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> 
> 5a85e737f30ce7 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eliezer Tamir          2013-06-10  2328  static int ixgbe_clean_rx_irq(struct ixgbe_q_vector *q_vector,
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2329  			       struct ixgbe_ring *rx_ring,
> f4de00ed58df50 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-09-25  2330  			       const int budget)
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2331  {
> 43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2332  	unsigned int total_rx_bytes = 0, total_rx_packets = 0, frame_sz = 0;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2333  	struct ixgbe_adapter *adapter = q_vector->adapter;
> 33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2334  #ifdef IXGBE_FCOE
> 4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2335  	int ddp_bytes;
> 4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2336  	unsigned int mss = 0;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2337  #endif /* IXGBE_FCOE */
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2338  	u16 cleaned_count = ixgbe_desc_unused(rx_ring);
> c0d4e9d223c5f4 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Maciej Fijalkowski     2021-01-18  2339  	unsigned int offset = rx_ring->rx_offset;
> ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2340  	unsigned int xdp_xmit = 0;
> 99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2341  	struct xdp_buff xdp;
> 25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2342  	int xdp_res;
> 99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2343  
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2344  	/* Frame size depend on rx_ring setup when PAGE_SIZE=4K */
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2345  #if (PAGE_SIZE < 8192)
> 43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2346  	frame_sz = ixgbe_rx_frame_truesize(rx_ring, 0);
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2347  #endif
> 43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2348  	xdp_init_buff(&xdp, frame_sz, &rx_ring->xdp_rxq);
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2349  
> fdabfc8a74c713 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eric W. Biederman      2014-03-14  2350  	while (likely(total_rx_packets < budget)) {
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2351  		union ixgbe_adv_rx_desc *rx_desc;
> 3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2352  		struct ixgbe_rx_buffer *rx_buffer;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2353  		struct sk_buff *skb;
> a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2354  		int rx_buffer_pgcnt;
> 3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2355  		unsigned int size;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2356  
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2357  		/* return some buffers to hardware, one at a time is too slow */
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2358  		if (cleaned_count >= IXGBE_RX_BUFFER_WRITE) {
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2359  			ixgbe_alloc_rx_buffers(rx_ring, cleaned_count);
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2360  			cleaned_count = 0;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2361  		}
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2362  
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2363  		rx_desc = IXGBE_RX_DESC(rx_ring, rx_ring->next_to_clean);
> 3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2364  		size = le16_to_cpu(rx_desc->wb.upper.length);
> 3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2365  		if (!size)
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2366  			break;
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2367  
> 124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2368  		/* This memory barrier is needed to keep us from reading
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2369  		 * any other fields out of the rx_desc until we know the
> 124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2370  		 * descriptor has been written back
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2371  		 */
> 124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2372  		dma_rmb();
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2373  
> a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2374  		rx_buffer = ixgbe_get_rx_buffer(rx_ring, rx_desc, &skb, size, &rx_buffer_pgcnt);
> 3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2375  
> 18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2376  		/* retrieve a buffer from the ring */
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2377  		if (!skb) {
> be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2378  			unsigned char *hard_start;
> be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2379  
> be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2380  			hard_start = page_address(rx_buffer->page) +
> be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2381  				     rx_buffer->page_offset - offset;
> be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2382  			xdp_prepare_buff(&xdp, hard_start, offset, size, true);
> 470bcfd6039b39 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2022-05-12  2383  			xdp_buff_clear_frags_flag(&xdp);
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2384  #if (PAGE_SIZE > 4096)
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2385  			/* At larger PAGE_SIZE, frame_sz depend on len size */
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2386  			xdp.frame_sz = ixgbe_rx_frame_truesize(rx_ring, size);
> cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2387  #endif
> 25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2388  			xdp_res = ixgbe_run_xdp(adapter, rx_ring, &xdp);
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2389  		}
> 
> xdp_res isn't initialized on else path
> 
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2390  
> 25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18 @2391  		if (xdp_res) {
> ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2392  			if (xdp_res & (IXGBE_XDP_TX | IXGBE_XDP_REDIR)) {
> ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2393  				xdp_xmit |= xdp_res;
> 33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2394  				ixgbe_rx_buffer_flip(rx_ring, rx_buffer, size);
> 7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2395  			} else {
> 33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2396  				rx_buffer->pagecnt_bias++;
> 7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2397  			}
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2398  			total_rx_packets++;
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2399  			total_rx_bytes += size;
> 9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2400  		} else if (skb) {
> 
