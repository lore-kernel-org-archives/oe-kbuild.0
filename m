Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69813148A8
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388035; cv=none; b=DYqN6JcFFRQKFPnlTWTHjDKEvfgmXhY/cGL7CdO91Xayk4uvZpB/jJFddlUv9EPjoJbNro3ouCEMgsgFv3yaIt48BwAFkXH/fS5lGMrmpQ4qQguSi5HsBvs0ela1ZjmDSd1DS0ZOuiEW0ArsYQY3sE5UbNWtAw7jrovtl/w+kdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388035; c=relaxed/simple;
	bh=VdBaK84HG+dqSoxhgKtXmi2Joih9FPUip40q53iPpF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFsy7CCaaRUSstpBMeQ6OpGlQZH6VzU03fx7V0WfAsRizM38tzbINdmXnOVaCExx7JlWWpCiSGkZ5PMLMIYNcGZ+5BcRjvwihHluv9VwAYK2N7a/r1MMl4pXQ7v4iIKUWpGC8GiGTuICvrcVeUc9skvHm0ILUHvJge4kBryCjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL0WDRc/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL0WDRc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756388033; x=1787924033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdBaK84HG+dqSoxhgKtXmi2Joih9FPUip40q53iPpF8=;
  b=jL0WDRc/h4beIy7zvOrlc0qX7C593CrW4HOZMbtXwuDS0W4A2XWJ6aDm
   vHXrsMCaXdJTvnGCxpq+vOgqksSgr+XabAG0VBQGJBV2aOu0d2lwy9MSP
   LlcMlmj1DrNPfT5ffE0bSoPRVy8HUBr7IttMLizgxik1gr7LIB/qvj3yC
   1eE4twht1FBv0iuhZXTUHJWzxi0ImUfxU0oqSr/poqSeMY9luDLVJNueG
   2H+PRCHK0fPGpoW44p7WDQQwzDoUdwNQZIUdgn9qJ2ZKIz1b1SYexSYhs
   42teuVQQOQZMdbVGzDlDWRLD95HOMdZPEYUmJEevITB/dVYR8TRgEzp1r
   Q==;
X-CSE-ConnectionGUID: qIjkV5gaQDCooxB3e9hyZA==
X-CSE-MsgGUID: 6AJ4i5j/THWZUWOHSnkneg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68931474"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="68931474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 06:33:52 -0700
X-CSE-ConnectionGUID: 1Hc75nYBSkK9n4PttD9Ldw==
X-CSE-MsgGUID: 6UDgdak0TXaK542KPB7y/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170503715"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2025 06:33:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urckM-000Tk3-14;
	Thu, 28 Aug 2025 13:33:07 +0000
Date: Thu, 28 Aug 2025 21:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 03/11] virtio_net: Create virtio_net directory
Message-ID: <202508282144.Y9qC4URI-lkp@intel.com>
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
In-Reply-To: <20250827183852.2471-4-danielj@nvidia.com>
References: <20250827183852.2471-4-danielj@nvidia.com>
TO: Daniel Jurgens <danielj@nvidia.com>
TO: netdev@vger.kernel.org
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: alex.williamson@redhat.com
TO: virtualization@lists.linux.dev
TO: pabeni@redhat.com
CC: parav@nvidia.com
CC: shshitrit@nvidia.com
CC: yohadt@nvidia.com
CC: Daniel Jurgens <danielj@nvidia.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Jurgens/virtio-pci-Expose-generic-device-capability-operations/20250828-024128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250827183852.2471-4-danielj%40nvidia.com
patch subject: [PATCH net-next 03/11] virtio_net: Create virtio_net directory
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-r073-20250828 (https://download.01.org/0day-ci/archive/20250828/202508282144.Y9qC4URI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508282144.Y9qC4URI-lkp@intel.com/

smatch warnings:
drivers/net/virtio_net/virtio_net_main.c:2188 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net/virtio_net_main.c:2262 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net/virtio_net_main.c:3187 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net/virtio_net_main.c:6279 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net/virtio_net_main.c:6283 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +/nr_frags +2188 drivers/net/virtio_net/virtio_net_main.c

80f50f918c6e2d drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2146  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2147  /* Why not use xdp_build_skb_from_frame() ?
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2148   * XDP core assumes that xdp frags are PAGE_SIZE in length, while in
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2149   * virtio-net there are 2 points that do not match its requirements:
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2150   *  1. The size of the prefilled buffer is not fixed before xdp is set.
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2151   *  2. xdp_build_skb_from_frame() does more checks that we don't need,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2152   *     like eth_type_trans() (which virtio-net does in receive_buf()).
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2153   */
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2154  static struct sk_buff *build_skb_from_xdp_buff(struct net_device *dev,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2155  					       struct virtnet_info *vi,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2156  					       struct xdp_buff *xdp,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2157  					       unsigned int xdp_frags_truesz)
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2158  {
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2159  	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2160  	unsigned int headroom, data_len;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2161  	struct sk_buff *skb;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2162  	int metasize;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2163  	u8 nr_frags;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2164  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2165  	if (unlikely(xdp->data_end > xdp_data_hard_end(xdp))) {
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2166  		pr_debug("Error building skb as missing reserved tailroom for xdp");
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2167  		return NULL;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2168  	}
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2169  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2170  	if (unlikely(xdp_buff_has_frags(xdp)))
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2171  		nr_frags = sinfo->nr_frags;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2172  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2173  	skb = build_skb(xdp->data_hard_start, xdp->frame_sz);
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2174  	if (unlikely(!skb))
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2175  		return NULL;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2176  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2177  	headroom = xdp->data - xdp->data_hard_start;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2178  	data_len = xdp->data_end - xdp->data;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2179  	skb_reserve(skb, headroom);
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2180  	__skb_put(skb, data_len);
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2181  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2182  	metasize = xdp->data - xdp->data_meta;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2183  	metasize = metasize > 0 ? metasize : 0;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2184  	if (metasize)
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2185  		skb_metadata_set(skb, metasize);
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2186  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2187  	if (unlikely(xdp_buff_has_frags(xdp)))
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14 @2188  		xdp_update_skb_shared_info(skb, nr_frags,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2189  					   sinfo->xdp_frags_size,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2190  					   xdp_frags_truesz,
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2191  					   xdp_buff_is_frag_pfmemalloc(xdp));
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2192  
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2193  	return skb;
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2194  }
b26aa481b4b710 drivers/net/virtio_net.c Heng Qi        2023-01-14  2195  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2196  /* TODO: build xdp in big mode */
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2197  static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2198  				      struct virtnet_info *vi,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2199  				      struct receive_queue *rq,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2200  				      struct xdp_buff *xdp,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2201  				      void *buf,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2202  				      unsigned int len,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2203  				      unsigned int frame_sz,
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2204  				      int *num_buf,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2205  				      unsigned int *xdp_frags_truesize,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2206  				      struct virtnet_rq_stats *stats)
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2207  {
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2208  	struct virtio_net_hdr_mrg_rxbuf *hdr = buf;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2209  	struct skb_shared_info *shinfo;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2210  	unsigned int xdp_frags_truesz = 0;
4be2193b3393dc drivers/net/virtio_net.c Bui Quang Minh 2025-06-30  2211  	unsigned int truesize;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2212  	struct page *page;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2213  	skb_frag_t *frag;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2214  	int offset;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2215  	void *ctx;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2216  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2217  	xdp_init_buff(xdp, frame_sz, &rq->xdp_rxq);
41d4a174201e62 drivers/net/virtio_net.c Xuan Zhuo      2024-07-08  2218  	xdp_prepare_buff(xdp, buf - XDP_PACKET_HEADROOM,
41d4a174201e62 drivers/net/virtio_net.c Xuan Zhuo      2024-07-08  2219  			 XDP_PACKET_HEADROOM + vi->hdr_len, len - vi->hdr_len, true);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2220  
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2221  	if (!*num_buf)
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2222  		return 0;
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2223  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2224  	if (*num_buf > 1) {
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2225  		/* If we want to build multi-buffer xdp, we need
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2226  		 * to specify that the flags of xdp_buff have the
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2227  		 * XDP_FLAGS_HAS_FRAG bit.
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2228  		 */
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2229  		if (!xdp_buff_has_frags(xdp))
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2230  			xdp_buff_set_frags_flag(xdp);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2231  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2232  		shinfo = xdp_get_shared_info_from_buff(xdp);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2233  		shinfo->nr_frags = 0;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2234  		shinfo->xdp_frags_size = 0;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2235  	}
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2236  
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2237  	if (*num_buf > MAX_SKB_FRAGS + 1)
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2238  		return -EINVAL;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2239  
981f14d42a7f16 drivers/net/virtio_net.c Heng Qi        2023-01-31  2240  	while (--*num_buf > 0) {
295525e29a5b56 drivers/net/virtio_net.c Xuan Zhuo      2023-08-10  2241  		buf = virtnet_rq_get_buf(rq, &len, &ctx);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2242  		if (unlikely(!buf)) {
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2243  			pr_debug("%s: rx error: %d buffers out of %d missing\n",
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2244  				 dev->name, *num_buf,
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2245  				 virtio16_to_cpu(vi->vdev, hdr->num_buffers));
d12a26b74fb774 drivers/net/virtio_net.c Eric Dumazet   2023-09-21  2246  			DEV_STATS_INC(dev, rx_length_errors);
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2247  			goto err;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2248  		}
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2249  
61217d8f636043 drivers/net/virtio_net.c Eric Dumazet   2023-10-26  2250  		u64_stats_add(&stats->bytes, len);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2251  		page = virt_to_head_page(buf);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2252  		offset = buf - page_address(page);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2253  
7d4a119e45828e drivers/net/virtio_net.c Bui Quang Minh 2025-06-30  2254  		if (check_mergeable_len(dev, ctx, len)) {
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2255  			put_page(page);
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2256  			goto err;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2257  		}
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2258  
7d4a119e45828e drivers/net/virtio_net.c Bui Quang Minh 2025-06-30  2259  		truesize = mergeable_ctx_to_truesize(ctx);
7d4a119e45828e drivers/net/virtio_net.c Bui Quang Minh 2025-06-30  2260  		xdp_frags_truesz += truesize;
7d4a119e45828e drivers/net/virtio_net.c Bui Quang Minh 2025-06-30  2261  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14 @2262  		frag = &shinfo->frags[shinfo->nr_frags++];
b51f4113ebb020 drivers/net/virtio_net.c Yunsheng Lin   2023-05-11  2263  		skb_frag_fill_page_desc(frag, page, offset, len);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2264  		if (page_is_pfmemalloc(page))
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2265  			xdp_buff_set_frag_pfmemalloc(xdp);
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2266  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2267  		shinfo->xdp_frags_size += len;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2268  	}
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2269  
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2270  	*xdp_frags_truesize = xdp_frags_truesz;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2271  	return 0;
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2272  
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2273  err:
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2274  	put_xdp_frags(xdp);
4cb00b13c06408 drivers/net/virtio_net.c Xuan Zhuo      2023-05-08  2275  	return -EINVAL;
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2276  }
ef75cb51f13941 drivers/net/virtio_net.c Heng Qi        2023-01-14  2277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
