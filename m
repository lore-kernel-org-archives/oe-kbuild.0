Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967E1C07D9
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813554; cv=none; b=U/y6s4jQjKxEFA3mp1QzKgHs8guS4ANbs0tCCrBzhMEjylB6TfJWqO9JORi1OLfTumSIN9lhHdU8Ov0fq3u/8nF7sCqBo15uBlDtwNhFao4AuFLIFzx22ByGSiGq0H+kbi6xo6EDJ37LZ4Xxl78UJQXWG2pkO3ug2g6RrsD11wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813554; c=relaxed/simple;
	bh=wLIKSgykkHas2+r/dg/mrodKWe5DXjfJdgq0RP8qIv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSJ9uUqWCFqUtc+t4Q/tAwU49BDPRXbQLZbrwGaCx6sAch9+/BQKlOQMmkhuMb6R/jBqszCFPuPasoVNg7qZowmzxFr31mWLyhifFKkBUQaEaXVU6Mf1UzBIF9T4eY5y5/3RRSemmekcv8eHqOLtFLTmYDQzi6mf7JZjL+FeY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd1Ky7JD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd1Ky7JD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730813553; x=1762349553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wLIKSgykkHas2+r/dg/mrodKWe5DXjfJdgq0RP8qIv0=;
  b=bd1Ky7JDWKBLPJ2RUOaYUvQELAdqKDO9hHDGjGJJ6WyGIAHpkrhTUKAp
   EdCdL/K1pNm94dylCPz3zJWB7PG0WN5GfgiEnKIutsKqIK0dmGZrkU7GR
   ExUl9PiWXjAjD2aDMNaq9swgec90bknaS1OTiJiNj2NJMaTNYpX6dr0g1
   gXNitNe1IkrcZMV14qI+ocXZOVSGxP38OqjDt3HUd50h4eM3ULu/3Yohl
   6x59kf5aOe+VWkPCQRFqFnytfDvEY0xoEeKZuFZjSIbGsd8UJSCwGxLQ2
   HfeqXp/LbMf/UtUS925vSthYl97kj0wx0rASPZ6QCBAc5eQQxVdNTCWUC
   w==;
X-CSE-ConnectionGUID: uVlyAH9iQymY1HRJJGDDCg==
X-CSE-MsgGUID: ++380m7vRfulpedA9FNlxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30676271"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30676271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 05:32:32 -0800
X-CSE-ConnectionGUID: ewGNu4c2SzyH0H2UitcGyA==
X-CSE-MsgGUID: HQlglQAHT+mGW4ykGqzdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="114797759"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2024 05:32:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8JfY-000m5v-0x;
	Tue, 05 Nov 2024 13:32:28 +0000
Date: Tue, 5 Nov 2024 21:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-net-queue:dev-queue 9/14]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2377 ixgbe_clean_rx_irq()
 error: uninitialized symbol 'xdp_res'.
Message-ID: <202411052110.vjxFpzue-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   278dfaa171a0061a341f6b5d44c2c9913a2b7fa8
commit: c919a57ea9cdd6aa02e0e411d8fdb3e3485353cc [9/14] ixgbe: Fix passing 0 to ERR_PTR in ixgbe_run_xdp()
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411052110.vjxFpzue-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411052110.vjxFpzue-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2377 ixgbe_clean_rx_irq() error: uninitialized symbol 'xdp_res'.

Old smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3291 ixgbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 3291.

vim +/xdp_res +2377 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c

33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2300  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2301  /**
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2302   * ixgbe_clean_rx_irq - Clean completed descriptors from Rx ring - bounce buf
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2303   * @q_vector: structure containing interrupt and ring information
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2304   * @rx_ring: rx descriptor ring to transact packets on
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2305   * @budget: Total limit on number of packets to process
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2306   *
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2307   * This function provides a "bounce buffer" approach to Rx interrupt
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2308   * processing.  The advantage to this is that on systems that have
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2309   * expensive overhead for IOMMU access this provides a means of avoiding
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2310   * it by maintaining the mapping of the page to the syste.
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2311   *
5a85e737f30ce7 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eliezer Tamir          2013-06-10  2312   * Returns amount of work completed
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2313   **/
5a85e737f30ce7 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eliezer Tamir          2013-06-10  2314  static int ixgbe_clean_rx_irq(struct ixgbe_q_vector *q_vector,
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2315  			       struct ixgbe_ring *rx_ring,
f4de00ed58df50 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-09-25  2316  			       const int budget)
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2317  {
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2318  	unsigned int total_rx_bytes = 0, total_rx_packets = 0, frame_sz = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2319  	struct ixgbe_adapter *adapter = q_vector->adapter;
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2320  #ifdef IXGBE_FCOE
4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2321  	int ddp_bytes;
4ffdf91a5feae6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Mark Rustad            2012-07-18  2322  	unsigned int mss = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2323  #endif /* IXGBE_FCOE */
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2324  	u16 cleaned_count = ixgbe_desc_unused(rx_ring);
c0d4e9d223c5f4 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Maciej Fijalkowski     2021-01-18  2325  	unsigned int offset = rx_ring->rx_offset;
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2326  	unsigned int xdp_xmit = 0;
99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2327  	struct xdp_buff xdp;
c919a57ea9cdd6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2328  	int xdp_res;
99ffc5ade4e870 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-01-03  2329  
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2330  	/* Frame size depend on rx_ring setup when PAGE_SIZE=4K */
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2331  #if (PAGE_SIZE < 8192)
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2332  	frame_sz = ixgbe_rx_frame_truesize(rx_ring, 0);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2333  #endif
43b5169d8355cc drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2334  	xdp_init_buff(&xdp, frame_sz, &rx_ring->xdp_rxq);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2335  
fdabfc8a74c713 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Eric W. Biederman      2014-03-14  2336  	while (likely(total_rx_packets < budget)) {
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2337  		union ixgbe_adv_rx_desc *rx_desc;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2338  		struct ixgbe_rx_buffer *rx_buffer;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2339  		struct sk_buff *skb;
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2340  		int rx_buffer_pgcnt;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2341  		unsigned int size;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2342  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2343  		/* return some buffers to hardware, one at a time is too slow */
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2344  		if (cleaned_count >= IXGBE_RX_BUFFER_WRITE) {
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2345  			ixgbe_alloc_rx_buffers(rx_ring, cleaned_count);
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2346  			cleaned_count = 0;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2347  		}
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2348  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2349  		rx_desc = IXGBE_RX_DESC(rx_ring, rx_ring->next_to_clean);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2350  		size = le16_to_cpu(rx_desc->wb.upper.length);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2351  		if (!size)
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2352  			break;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2353  
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2354  		/* This memory barrier is needed to keep us from reading
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2355  		 * any other fields out of the rx_desc until we know the
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2356  		 * descriptor has been written back
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2357  		 */
124b74c18e0e31 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2014-12-11  2358  		dma_rmb();
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2359  
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2360  		rx_buffer = ixgbe_get_rx_buffer(rx_ring, rx_desc, &skb, size, &rx_buffer_pgcnt);
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2361  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2362  		/* retrieve a buffer from the ring */
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2363  		if (!skb) {
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2364  			unsigned char *hard_start;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2365  
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2366  			hard_start = page_address(rx_buffer->page) +
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2367  				     rx_buffer->page_offset - offset;
be9df4aff65f18 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2020-12-22  2368  			xdp_prepare_buff(&xdp, hard_start, offset, size, true);
470bcfd6039b39 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Lorenzo Bianconi       2022-05-12  2369  			xdp_buff_clear_frags_flag(&xdp);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2370  #if (PAGE_SIZE > 4096)
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2371  			/* At larger PAGE_SIZE, frame_sz depend on len size */
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2372  			xdp.frame_sz = ixgbe_rx_frame_truesize(rx_ring, size);
cf02512899805d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2020-05-14  2373  #endif
c919a57ea9cdd6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2374  			xdp_res = ixgbe_run_xdp(adapter, rx_ring, &xdp);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2375  		}
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2376  
c919a57ea9cdd6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18 @2377  		if (xdp_res) {
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2378  			if (xdp_res & (IXGBE_XDP_TX | IXGBE_XDP_REDIR)) {
ad088ec4807688 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Jesper Dangaard Brouer 2018-06-26  2379  				xdp_xmit |= xdp_res;
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2380  				ixgbe_rx_buffer_flip(rx_ring, rx_buffer, size);
7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2381  			} else {
33fdc82f08835d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2382  				rx_buffer->pagecnt_bias++;
7379f97a4fce3c drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-03-28  2383  			}
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2384  			total_rx_packets++;
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2385  			total_rx_bytes += size;
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2386  		} else if (skb) {
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2387  			ixgbe_add_rx_frag(rx_ring, rx_buffer, skb, size);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2388  		} else if (ring_uses_build_skb(rx_ring)) {
6f429223b31c55 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2389  			skb = ixgbe_build_skb(rx_ring, rx_buffer,
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2390  					      &xdp, rx_desc);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2391  		} else {
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2392  			skb = ixgbe_construct_skb(rx_ring, rx_buffer,
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2393  						  &xdp, rx_desc);
9247080816297d drivers/net/ethernet/intel/ixgbe/ixgbe_main.c John Fastabend         2017-04-24  2394  		}
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2395  
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2396  		/* exit if we failed to retrieve a buffer */
c919a57ea9cdd6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2397  		if (!xdp_res && !skb) {
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2398  			rx_ring->rx_stats.alloc_rx_buff_failed++;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2399  			rx_buffer->pagecnt_bias++;
18806c9ea28320 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-07-20  2400  			break;
3fd218767fa498 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2017-01-17  2401  		}
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2402  
a06316dc87bdc0 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Björn Töpel            2020-08-25  2403  		ixgbe_put_rx_buffer(rx_ring, rx_buffer, skb, rx_buffer_pgcnt);
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2404  		cleaned_count++;
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2405  
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2406  		/* place incomplete frames back on ring for completion */
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2407  		if (ixgbe_is_non_eop(rx_ring, rx_desc, skb))
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2408  			continue;
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2409  
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2410  		/* verify the packet layout is correct */
c919a57ea9cdd6 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Yue Haibing            2024-10-18  2411  		if (xdp_res || ixgbe_cleanup_headers(rx_ring, rx_desc, skb))
f800326dca7bc1 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-03-03  2412  			continue;
9a799d71034c4e drivers/net/ixgbe/ixgbe_main.c                Auke Kok               2007-09-15  2413  
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2414  		/* probably a little skewed due to removing CRC */
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2415  		total_rx_bytes += skb->len;
d2f4fbe2982b3b drivers/net/ixgbe/ixgbe_main.c                Ayyappan Veeraiyan     2008-02-01  2416  
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2417  		/* populate checksum, timestamp, VLAN, and protocol */
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2418  		ixgbe_process_skb_fields(rx_ring, rx_desc, skb);
8a0da21be84019 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c Alexander Duyck        2012-01-31  2419  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
