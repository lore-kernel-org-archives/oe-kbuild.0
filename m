Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10679DD
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+HGH+pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699172619; x=1730708619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=np0tN4NL5ZVIbZ8x234392iTAYfCiZOJhRS2EXTnaDo=;
  b=N+HGH+pIBOwNz96W7o6pXnr02Qbm8zg/TC2te6OylGDA0JF9WmIFfY2W
   TQrgB9RK4lEiGm7fTosCo/aYwx/CUw78wXD8Nd89S/IcDUDuhrYDP5UU/
   GlcscZytodxWkSKEn3cR4Y4xyjBKhmTW52N+11AhT+JJ8UDondIHIZOE4
   DCK+ZNLEP5rva4eTa7va1YLVoQ+uyN+2jyIs6vOfvbpJEciXjysP7eZYj
   xKzH4ZXZPKAcNrzgOUqUIONQFSH/symXP3BddPopZ7ROhdLY13DoB8Dfz
   0M011SxGz5YceQEGTY0FYDFA2nWtMRa0hOEaS4mzs9PK2NyDTJBvSqhsn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="2106521"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="2106521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="9802294"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2023 01:23:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzYPv-0005Bv-1i;
	Sun, 05 Nov 2023 08:23:35 +0000
Date: Sun, 5 Nov 2023 16:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/virtio_net.c:1012 virtnet_build_xdp_buff_mrg() error:
 uninitialized symbol 'shinfo'.
Message-ID: <202311051650.kK7U3Izi-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Heng Qi <hengqi@linux.alibaba.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: ef75cb51f13941cf7633227ade43c4d86ecbc336 virtio-net: build xdp_buff with multi buffers
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231105/202311051650.kK7U3Izi-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311051650.kK7U3Izi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311051650.kK7U3Izi-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:1012 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.

Old smatch warnings:
drivers/net/virtio_net.c:2974 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:3391 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:3395 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +/shinfo +1012 drivers/net/virtio_net.c

f121159d72091f Michael S. Tsirkin 2013-11-28   940  
ef75cb51f13941 Heng Qi            2023-01-14   941  /* TODO: build xdp in big mode */
ef75cb51f13941 Heng Qi            2023-01-14   942  static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
ef75cb51f13941 Heng Qi            2023-01-14   943  				      struct virtnet_info *vi,
ef75cb51f13941 Heng Qi            2023-01-14   944  				      struct receive_queue *rq,
ef75cb51f13941 Heng Qi            2023-01-14   945  				      struct xdp_buff *xdp,
ef75cb51f13941 Heng Qi            2023-01-14   946  				      void *buf,
ef75cb51f13941 Heng Qi            2023-01-14   947  				      unsigned int len,
ef75cb51f13941 Heng Qi            2023-01-14   948  				      unsigned int frame_sz,
ef75cb51f13941 Heng Qi            2023-01-14   949  				      u16 *num_buf,
ef75cb51f13941 Heng Qi            2023-01-14   950  				      unsigned int *xdp_frags_truesize,
ef75cb51f13941 Heng Qi            2023-01-14   951  				      struct virtnet_rq_stats *stats)
ef75cb51f13941 Heng Qi            2023-01-14   952  {
ef75cb51f13941 Heng Qi            2023-01-14   953  	struct virtio_net_hdr_mrg_rxbuf *hdr = buf;
ef75cb51f13941 Heng Qi            2023-01-14   954  	unsigned int headroom, tailroom, room;
ef75cb51f13941 Heng Qi            2023-01-14   955  	unsigned int truesize, cur_frag_size;
ef75cb51f13941 Heng Qi            2023-01-14   956  	struct skb_shared_info *shinfo;
ef75cb51f13941 Heng Qi            2023-01-14   957  	unsigned int xdp_frags_truesz = 0;
ef75cb51f13941 Heng Qi            2023-01-14   958  	struct page *page;
ef75cb51f13941 Heng Qi            2023-01-14   959  	skb_frag_t *frag;
ef75cb51f13941 Heng Qi            2023-01-14   960  	int offset;
ef75cb51f13941 Heng Qi            2023-01-14   961  	void *ctx;
ef75cb51f13941 Heng Qi            2023-01-14   962  
ef75cb51f13941 Heng Qi            2023-01-14   963  	xdp_init_buff(xdp, frame_sz, &rq->xdp_rxq);
ef75cb51f13941 Heng Qi            2023-01-14   964  	xdp_prepare_buff(xdp, buf - VIRTIO_XDP_HEADROOM,
ef75cb51f13941 Heng Qi            2023-01-14   965  			 VIRTIO_XDP_HEADROOM + vi->hdr_len, len - vi->hdr_len, true);
ef75cb51f13941 Heng Qi            2023-01-14   966  
ef75cb51f13941 Heng Qi            2023-01-14   967  	if (*num_buf > 1) {
ef75cb51f13941 Heng Qi            2023-01-14   968  		/* If we want to build multi-buffer xdp, we need
ef75cb51f13941 Heng Qi            2023-01-14   969  		 * to specify that the flags of xdp_buff have the
ef75cb51f13941 Heng Qi            2023-01-14   970  		 * XDP_FLAGS_HAS_FRAG bit.
ef75cb51f13941 Heng Qi            2023-01-14   971  		 */
ef75cb51f13941 Heng Qi            2023-01-14   972  		if (!xdp_buff_has_frags(xdp))
ef75cb51f13941 Heng Qi            2023-01-14   973  			xdp_buff_set_frags_flag(xdp);
ef75cb51f13941 Heng Qi            2023-01-14   974  
ef75cb51f13941 Heng Qi            2023-01-14   975  		shinfo = xdp_get_shared_info_from_buff(xdp);
ef75cb51f13941 Heng Qi            2023-01-14   976  		shinfo->nr_frags = 0;
ef75cb51f13941 Heng Qi            2023-01-14   977  		shinfo->xdp_frags_size = 0;
ef75cb51f13941 Heng Qi            2023-01-14   978  	}
ef75cb51f13941 Heng Qi            2023-01-14   979  
ef75cb51f13941 Heng Qi            2023-01-14   980  	if ((*num_buf - 1) > MAX_SKB_FRAGS)
ef75cb51f13941 Heng Qi            2023-01-14   981  		return -EINVAL;
ef75cb51f13941 Heng Qi            2023-01-14   982  
ef75cb51f13941 Heng Qi            2023-01-14   983  	while ((--*num_buf) >= 1) {
ef75cb51f13941 Heng Qi            2023-01-14   984  		buf = virtqueue_get_buf_ctx(rq->vq, &len, &ctx);
ef75cb51f13941 Heng Qi            2023-01-14   985  		if (unlikely(!buf)) {
ef75cb51f13941 Heng Qi            2023-01-14   986  			pr_debug("%s: rx error: %d buffers out of %d missing\n",
ef75cb51f13941 Heng Qi            2023-01-14   987  				 dev->name, *num_buf,
ef75cb51f13941 Heng Qi            2023-01-14   988  				 virtio16_to_cpu(vi->vdev, hdr->num_buffers));
ef75cb51f13941 Heng Qi            2023-01-14   989  			dev->stats.rx_length_errors++;
ef75cb51f13941 Heng Qi            2023-01-14   990  			return -EINVAL;
ef75cb51f13941 Heng Qi            2023-01-14   991  		}
ef75cb51f13941 Heng Qi            2023-01-14   992  
ef75cb51f13941 Heng Qi            2023-01-14   993  		stats->bytes += len;
ef75cb51f13941 Heng Qi            2023-01-14   994  		page = virt_to_head_page(buf);
ef75cb51f13941 Heng Qi            2023-01-14   995  		offset = buf - page_address(page);
ef75cb51f13941 Heng Qi            2023-01-14   996  
ef75cb51f13941 Heng Qi            2023-01-14   997  		truesize = mergeable_ctx_to_truesize(ctx);
ef75cb51f13941 Heng Qi            2023-01-14   998  		headroom = mergeable_ctx_to_headroom(ctx);
ef75cb51f13941 Heng Qi            2023-01-14   999  		tailroom = headroom ? sizeof(struct skb_shared_info) : 0;
ef75cb51f13941 Heng Qi            2023-01-14  1000  		room = SKB_DATA_ALIGN(headroom + tailroom);
ef75cb51f13941 Heng Qi            2023-01-14  1001  
ef75cb51f13941 Heng Qi            2023-01-14  1002  		cur_frag_size = truesize;
ef75cb51f13941 Heng Qi            2023-01-14  1003  		xdp_frags_truesz += cur_frag_size;
ef75cb51f13941 Heng Qi            2023-01-14  1004  		if (unlikely(len > truesize - room || cur_frag_size > PAGE_SIZE)) {
ef75cb51f13941 Heng Qi            2023-01-14  1005  			put_page(page);
ef75cb51f13941 Heng Qi            2023-01-14  1006  			pr_debug("%s: rx error: len %u exceeds truesize %lu\n",
ef75cb51f13941 Heng Qi            2023-01-14  1007  				 dev->name, len, (unsigned long)(truesize - room));
ef75cb51f13941 Heng Qi            2023-01-14  1008  			dev->stats.rx_length_errors++;
ef75cb51f13941 Heng Qi            2023-01-14  1009  			return -EINVAL;
ef75cb51f13941 Heng Qi            2023-01-14  1010  		}
ef75cb51f13941 Heng Qi            2023-01-14  1011  
ef75cb51f13941 Heng Qi            2023-01-14 @1012  		frag = &shinfo->frags[shinfo->nr_frags++];
ef75cb51f13941 Heng Qi            2023-01-14  1013  		__skb_frag_set_page(frag, page);
ef75cb51f13941 Heng Qi            2023-01-14  1014  		skb_frag_off_set(frag, offset);
ef75cb51f13941 Heng Qi            2023-01-14  1015  		skb_frag_size_set(frag, len);
ef75cb51f13941 Heng Qi            2023-01-14  1016  		if (page_is_pfmemalloc(page))
ef75cb51f13941 Heng Qi            2023-01-14  1017  			xdp_buff_set_frag_pfmemalloc(xdp);
ef75cb51f13941 Heng Qi            2023-01-14  1018  
ef75cb51f13941 Heng Qi            2023-01-14  1019  		shinfo->xdp_frags_size += len;
ef75cb51f13941 Heng Qi            2023-01-14  1020  	}
ef75cb51f13941 Heng Qi            2023-01-14  1021  
ef75cb51f13941 Heng Qi            2023-01-14  1022  	*xdp_frags_truesize = xdp_frags_truesz;
ef75cb51f13941 Heng Qi            2023-01-14  1023  	return 0;
ef75cb51f13941 Heng Qi            2023-01-14  1024  }
ef75cb51f13941 Heng Qi            2023-01-14  1025  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
