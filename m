Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBA14EC73
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 22:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840034; cv=none; b=Zzg7SE6xHbNtXO7UYES6jeI9cS7MMJ7C4uL6eXULq7KB/wBRH+OTsq2IXt37Z+MIjAHjjc+7F/S5De5dqttRvX/L4/Ww+Vumz8mWMP805WtQOkDYVhsaBa7IA3xfvvM0BQcProV48ScsHGUq3Soylt1HCPVxMwvDTx1k303kGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840034; c=relaxed/simple;
	bh=MGU9AYSR7/dptCQtQ+UotkBK8mLVfR5UXnnTSB5jz9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BRN+WH0/dwfjsMzHqae5NwwI4l7mauPV18Fmh/E86Wh+P5hFnHmHV1o6K3EjLKxlIVsMErbEte6HD0HmAxXOAebGVwRfdqaXWIXTb9ud+4ZuIWITw2/SiC+Qs1O4vncls7gjNFeMab49FxgnRAMdaMyQFLuhoQ2LtKYi4xS9kTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boRACt8k; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boRACt8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840032; x=1783376032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGU9AYSR7/dptCQtQ+UotkBK8mLVfR5UXnnTSB5jz9E=;
  b=boRACt8k22DdarvmDzmsqDn386FCJLnHuZZeCLxgFJ9lGtNiS8FaM104
   y5bnf34fyejhvrgy2cC1toQzlftYLs8VIqT7DiCVUHK5u/kX6WAU8M6S/
   AKGSwW8hopo6nYlY0dZMdVYk9f2BPfH9NbHTvCEOaqd4m/vvRSmPcsig+
   gWuKB1E2YkBOtvdVUVcJsmi961IZ6clPdL3vow2vY5xd9WPTd2D5H1Xcq
   q4O3ygEHH2wgg4hg1FLQBbVJU9YKV7Sx60g6Y6DRf3/VG/tuFLB4ycLEp
   zoiIOTQnPcGojCus5J/tK6o545CMJ1Ai/H61MpdrTrRtOLDMuKMNfGHL+
   Q==;
X-CSE-ConnectionGUID: lSMsH5hxTgCuLQRGIVqL3A==
X-CSE-MsgGUID: P5MgJ0yPRn+LkspAubczSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54181810"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="54181810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:13:51 -0700
X-CSE-ConnectionGUID: niOZW+PDRvW50hIrLgwnzA==
X-CSE-MsgGUID: USOnlGcJQZqhKUdyYmHAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="155637217"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jul 2025 15:13:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXcJ-000011-21;
	Sun, 06 Jul 2025 22:13:47 +0000
Date: Mon, 7 Jul 2025 06:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next V2 4/7] net: xdp: Set skb hw metadata from
 xdp_frame
Message-ID: <202507070222.90C9Fl6I-lkp@intel.com>
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
In-Reply-To: <175146831960.1421237.9105904582430357235.stgit@firesoul>
References: <175146831960.1421237.9105904582430357235.stgit@firesoul>
TO: Jesper Dangaard Brouer <hawk@kernel.org>
TO: bpf@vger.kernel.org
TO: netdev@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
TO: lorenzo@kernel.org
CC: Jesper Dangaard Brouer <hawk@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <borkmann@iogearbox.net>
CC: Eric Dumazet <eric.dumazet@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: sdf@fomichev.me
CC: kernel-team@cloudflare.com
CC: arthur@arthurfabre.com
CC: jakub@cloudflare.com

Hi Jesper,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/net-xdp-Add-xdp_rx_meta-structure/20250702-230059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/175146831960.1421237.9105904582430357235.stgit%40firesoul
patch subject: [PATCH bpf-next V2 4/7] net: xdp: Set skb hw metadata from xdp_frame
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250704 (https://download.01.org/0day-ci/archive/20250707/202507070222.90C9Fl6I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507070222.90C9Fl6I-lkp@intel.com/

New smatch warnings:
net/core/xdp.c:861 __xdp_build_skb_from_frame() error: uninitialized symbol 'ts'.

Old smatch warnings:
net/core/xdp.c:848 __xdp_build_skb_from_frame() error: uninitialized symbol 'nr_frags'.

vim +/ts +861 net/core/xdp.c

cafbd1d4187612 Lorenzo Bianconi  2025-07-02  811  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  812  struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  813  					   struct sk_buff *skb,
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  814  					   struct net_device *dev)
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  815  {
d65a1906b31246 Lorenzo Bianconi  2022-01-21  816  	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  817  	unsigned int headroom, frame_size;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  818  	void *hard_start;
d65a1906b31246 Lorenzo Bianconi  2022-01-21  819  	u8 nr_frags;
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  820  	u64 ts;
d65a1906b31246 Lorenzo Bianconi  2022-01-21  821  
d65a1906b31246 Lorenzo Bianconi  2022-01-21  822  	/* xdp frags frame */
d65a1906b31246 Lorenzo Bianconi  2022-01-21  823  	if (unlikely(xdp_frame_has_frags(xdpf)))
d65a1906b31246 Lorenzo Bianconi  2022-01-21  824  		nr_frags = sinfo->nr_frags;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  825  
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  826  	if (unlikely(xdp_frame_has_rx_meta_ts(xdpf)))
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  827  		ts = sinfo->hwtstamps.hwtstamp;
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  828  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  829  	/* Part of headroom was reserved to xdpf */
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  830  	headroom = sizeof(*xdpf) + xdpf->headroom;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  831  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  832  	/* Memory size backing xdp_frame data already have reserved
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  833  	 * room for build_skb to place skb_shared_info in tailroom.
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  834  	 */
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  835  	frame_size = xdpf->frame_sz;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  836  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  837  	hard_start = xdpf->data - headroom;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  838  	skb = build_skb_around(skb, hard_start, frame_size);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  839  	if (unlikely(!skb))
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  840  		return NULL;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  841  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  842  	skb_reserve(skb, headroom);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  843  	__skb_put(skb, xdpf->len);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  844  	if (xdpf->metasize)
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  845  		skb_metadata_set(skb, xdpf->metasize);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  846  
d65a1906b31246 Lorenzo Bianconi  2022-01-21  847  	if (unlikely(xdp_frame_has_frags(xdpf)))
d65a1906b31246 Lorenzo Bianconi  2022-01-21  848  		xdp_update_skb_shared_info(skb, nr_frags,
d65a1906b31246 Lorenzo Bianconi  2022-01-21  849  					   sinfo->xdp_frags_size,
d65a1906b31246 Lorenzo Bianconi  2022-01-21  850  					   nr_frags * xdpf->frame_sz,
d65a1906b31246 Lorenzo Bianconi  2022-01-21  851  					   xdp_frame_is_frag_pfmemalloc(xdpf));
d65a1906b31246 Lorenzo Bianconi  2022-01-21  852  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  853  	/* Essential SKB info: protocol and skb->dev */
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  854  	skb->protocol = eth_type_trans(skb, dev);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  855  
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  856  	xdp_set_skb_rx_hash_from_meta(xdpf, skb);
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  857  	if (xdp_frame_has_rx_meta_vlan(xdpf))
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  858  		__vlan_hwaccel_put_tag(skb, xdpf->rx_meta.vlan.proto,
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  859  				       xdpf->rx_meta.vlan.tci);
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  860  	if (unlikely(xdp_frame_has_rx_meta_ts(xdpf)))
cafbd1d4187612 Lorenzo Bianconi  2025-07-02 @861  		skb_hwtstamps(skb)->hwtstamp = ts;
cafbd1d4187612 Lorenzo Bianconi  2025-07-02  862  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  863  	/* Optional SKB info, currently missing:
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  864  	 * - HW checksum info		(skb->ip_summed)
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  865  	 * - RX ring dev queue index	(skb_record_rx_queue)
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  866  	 */
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  867  
56d95b0adfa224 Alexander Lobakin 2024-12-11  868  	if (xdpf->mem_type == MEM_TYPE_PAGE_POOL)
9c94bbf9a87b26 Alexander Lobakin 2023-03-13  869  		skb_mark_for_recycle(skb);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  870  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  871  	/* Allow SKB to reuse area used by xdp_frame */
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  872  	xdp_scrub_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  873  
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  874  	return skb;
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  875  }
97a0e1ea7b41c2 Lorenzo Bianconi  2021-01-12  876  EXPORT_SYMBOL_GPL(__xdp_build_skb_from_frame);
89f479f0eccfc8 Lorenzo Bianconi  2021-01-12  877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
