Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE751714CF
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823256; cv=none; b=NsWee4VhMwjxdr/RHoqypmgZSRfLW43ZWi4HCXh8rDDFdIi82UTJkQIHH1R2NMON/L/FYK4kvDHgreUk+vHL3vbPK+m766AFODFvNXB2JJ7vI1UMbotwwTevODR6nw9wKYrbssbkdxSRcv09/0cKWCv9M1i5ODrYol0jbWGEaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823256; c=relaxed/simple;
	bh=zppZAH8X6U3FP72XUi2tye0Pcl7hqMND1YSvSrvadFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmH7CFbNB7Vu7Ailnj0VBvzMXdQLZ17AGSmsNVow8bY2SZ2KLh66VPhHSaV/ub3gRuIFjKOR/v+oLrlco82iohsuDDknmJAYBgwPbeF4vNVP8uYlg6kO+DQ3JQgRB65Z2ZSMpC/xOSsnM1u3uchqPq5lrmqnUlV5y0feELnOeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmPRU3Y4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmPRU3Y4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431695fa98bso44632945e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Nov 2024 08:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730823251; x=1731428051; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBEKWQ7whZejS2/hZ6iXkECy++Ar3aGZcPYclrZ82FU=;
        b=HmPRU3Y4/LH9I49MD+fKJJVFeVvX2Slvr3s6D8Yzz7PBbvOLQK4TffHKEfZVebmqoT
         Ff+/cFRsbgBT0jhxwHR8M0JewXlNra33Hl0gKYdbyg3SvRmp0vsZ75beFy0DLe8r3j9e
         /a6rwdPOWPs9Lp0rgQFUK0HKbUFpSW6wC3DRHQ/T2NJGOzLi8v7fzO3QX+/EvqNxoFgq
         9o8w8r6tnv9CCHKAGx1W3HATQyq0IbG61PPIisraXRX9XfFOl3aP9M+KkYWDL2quVn6F
         4JlgdtTxAUj+8boT73bJ78FXxyeykLhtZqZRfUoJnunqwH97mqyIfhuZdOSb9f+AOKpf
         cNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823251; x=1731428051;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBEKWQ7whZejS2/hZ6iXkECy++Ar3aGZcPYclrZ82FU=;
        b=g6x6PAtZ2CUVAu7dYIw+JV++510C4TUb6lpxz+CgE7bkOHZF02cV/ltz33u9YP93mM
         xKRYhQ0K5zFiIH6PuVLKQbVlhfgiQbDt9QyfKELnbSwIAwnWU92FAreIoKTt5ThkE2oe
         f1zvudarY5Z0kHjcmcg9LVc5zAYMI8GLE84xogAqnlILoJ7VAarC/1BL7MkRhmTmPg4C
         iHxjvi2w415fI4FS8TMnCwGb5eRW39Svv3nDdhL+87ABhzvQDEyowfUqYkp0qq7RLV+b
         w+DyQyHr1PKZ2D/diiUDwQo2+OGuC72+HfBqAcSuLG20ESj5a150dmyhfiEtKeCWB7kD
         ICRw==
X-Gm-Message-State: AOJu0Yw3nx6jG32eezL9ZP59sZRyM6zb6EfYnoXMG4ZVAq3kMJrY8LWX
	eXXIXW9v42amOLRXLFYzVVOxrsemMBkFbkAXbi83aczHWCZ8Sfg9Z8dmgus5MY1+kn8CqEdsBSy
	1VIo8NA==
X-Google-Smtp-Source: AGHT+IF/10ly+aE9afn4Rkzv7jcskSH8CteUjsrcvQ7xsgl/Gb7qkAY8aoCFoxVDQTejg5e0oVpTWw==
X-Received: by 2002:a05:600c:3b14:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-4319ac6fb0amr308634645e9.4.1730823250793;
        Tue, 05 Nov 2024 08:14:10 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c0f9bbccsm16819585f8f.0.2024.11.05.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:14:10 -0800 (PST)
Date: Tue, 5 Nov 2024 19:14:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yue Haibing <yuehaibing@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:dev-queue 9/14]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2377 ixgbe_clean_rx_irq()
 error: uninitialized symbol 'xdp_res'.
Message-ID: <f5a33a3d-daa3-4252-a741-0ba16104f400@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   278dfaa171a0061a341f6b5d44c2c9913a2b7fa8
commit: c919a57ea9cdd6aa02e0e411d8fdb3e3485353cc [9/14] ixgbe: Fix passing 0 to ERR_PTR in ixgbe_run_xdp()
config: powerpc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411052110.vjxFpzue-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411052110.vjxFpzue-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2377 ixgbe_clean_rx_irq() error: uninitialized symbol 'xdp_res'.


vim +/xdp_res +2377 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c

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

xdp_res uninitialized on else path

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

