Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806979CC
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729472792; cv=none; b=Sj2r7bPrEZwJL/jAu+b/m94lmHsk4ZO0bueT2LhC7XTC8hM/faKzMFZFWh92CHKcpYnYPtiQFrBenB2vwfW9kV9gwv2cj5zXV39YabW8/g/YJ+dEhSxqTQdymX5bbmB6/2ZlDHcfWb0ol0ru447Qsefapyq3xoUK2cCokEESNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729472792; c=relaxed/simple;
	bh=aEEDGlQJKApK9/Mj5z2yGj0PDoD5c7PswJh9uhIX5II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQSzf28Y7CpWQVj2DZcmOMiUvybhesRs/vmtXZIQZG76Xn0PI21KnaguC+LkhxwNFkEHsmdm01xdg9unOBPmHn+h/8kFDn0N+hY4bPWClzbWDXiTZDaRzVA46T2hfUt8nvjLiS0QmO8Da2MY56zpmIaJAgGrsBa3D4+0+7jhWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rjp9RlZQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rjp9RlZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729472789; x=1761008789;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aEEDGlQJKApK9/Mj5z2yGj0PDoD5c7PswJh9uhIX5II=;
  b=Rjp9RlZQ5O4aH24+RPkUvDkQdnHHqM+YPFAEc4ZuDe8MAJz7RMFTGl2a
   gSdPV5/Ia580PURMq9fa3DS8W5jfRV9BqaMBgFUQW8tXGFRoyoOFM0dwb
   uSR2W6BsT0NX9Wh86+fIPQFZfL+S+ekw+OFEKGe4pCbxM9UBwIKDwth6w
   W4zfJ1pgdu3XS2SG1QMRNwbN1vZKtDTG0lqA5gsE48Itn6NvT1NXydCVF
   MC1iAeIvnVszGNVrhNsb81Ydk7kJXnG82f5WZmNn4hDU10EJkiYz2ChLt
   34KSn07FRme6Bv9aEyvWptMIn3HoZF8OY18fGsfK0cWKsE/6yeTmKNMAW
   g==;
X-CSE-ConnectionGUID: hcU2W5WhQV2THqLe5HKC7g==
X-CSE-MsgGUID: Am7Wa7BUR3W5U5RBxBBsCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39526253"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39526253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:06:28 -0700
X-CSE-ConnectionGUID: 5TwyMe0KTk2fxFAHLvezCg==
X-CSE-MsgGUID: BmoDa9t/QW6LbS86tk6f5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79780029"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2024 18:06:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2gsK-000Qxh-2t;
	Mon, 21 Oct 2024 01:06:24 +0000
Date: Mon, 21 Oct 2024 09:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 50/51]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq()
 error: uninitialized symbol 'xdp_res'.
Message-ID: <202410210921.qWQ9GIQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Yue Haibing <yuehaibing@huawei.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   02a4f6b6bf8145719b1318ef112758c889660044
commit: 25892a448d275daf1dd6714aa5ffa51ad78e9dda [50/51] ixgbe: Fix passing 0 to ERR_PTR in ixgbe_run_xdp()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210921.qWQ9GIQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210921.qWQ9GIQR-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2391 ixgbe_clean_rx_irq() error: uninitialized symbol 'xdp_res'.

Old smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3530 ixgbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 3530.

vim +/xdp_res +2391 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c

33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2314  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2315  /**
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2316   * ixgbe_clean_rx_irq - Clean completed descriptors from Rx ring - bounce buf
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2317   * @q_vector: structure containing interrupt and ring information
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2318   * @rx_ring: rx descriptor ring to transact packets on
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2319   * @budget: Total limit on number of packets to process
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2320   *
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2321   * This function provides a "bounce buffer" approach to Rx interrupt
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2322   * processing.  The advantage to this is that on systems that have
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2323   * expensive overhead for IOMMU access this provides a means of avoiding
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2324   * it by maintaining the mapping of the page to the syste.
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2325   *
5a85e737f30ce7 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eliezer Tamir          2013-06-10  2326   * Returns amount of work completed
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2327   **/
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
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2401  			ixgbe_add_rx_frag(rx_ring, rx_buffer, skb, size);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2402  		} else if (ring_uses_build_skb(rx_ring)) {
6f429223b31c55 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2403  			skb = ixgbe_build_skb(rx_ring, rx_buffer,
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2404  					      &xdp, rx_desc);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2405  		} else {
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2406  			skb = ixgbe_construct_skb(rx_ring, rx_buffer,
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2407  						  &xdp, rx_desc);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2408  		}
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2409  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2410  		/* exit if we failed to retrieve a buffer */
25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2411  		if (!xdp_res && !skb) {
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2412  			rx_ring->rx_stats.alloc_rx_buff_failed++;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2413  			rx_buffer->pagecnt_bias++;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2414  			break;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2415  		}
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2416  
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2417  		ixgbe_put_rx_buffer(rx_ring, rx_buffer, skb, rx_buffer_pgcnt);
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2418  		cleaned_count++;
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2419  
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2420  		/* place incomplete frames back on ring for completion */
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2421  		if (ixgbe_is_non_eop(rx_ring, rx_desc, skb))
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2422  			continue;
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2423  
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2424  		/* verify the packet layout is correct */
25892a448d275d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2425  		if (xdp_res || ixgbe_cleanup_headers(rx_ring, rx_desc, skb))
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2426  			continue;
9a799d71034c4e drivers/net/ixgbe/ixgbe_main.c                Auke Kok               2007-09-15  2427  
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2428  		/* probably a little skewed due to removing CRC */
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2429  		total_rx_bytes += skb->len;
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2430  
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2431  		/* populate checksum, timestamp, VLAN, and protocol */
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2432  		ixgbe_process_skb_fields(rx_ring, rx_desc, skb);
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
