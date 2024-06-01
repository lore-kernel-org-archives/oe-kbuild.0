Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31929208B0
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717239622; cv=none; b=mjnau+DTSPO5U3NoUZ6d/vlZ7DbG/yL44oK5gTR1Ieos2KcXpxhhXIYlnjHoyFSwvnhfVVVsbwHqW/2xEY2lWoadxHcRxBVqtArmW/WKHUHYoKnwgbQW9V9YhF8YuUC+XRyDhrq6+L5uf8wGFstRXhVmUyUOXlIPDta8da0JQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717239622; c=relaxed/simple;
	bh=Vo+iPzInlqdKpN4TawU5JqpIknHBI4+oxGh1lhZ4p2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NIDarSgBUWBaUw9UuxzSBXbfvSVpSZIhTGwq69QY82KI6VPKjORMxDwcn4aQeyLJW3ocYs3bbmIUikqHVp4SkgYx7Nbi/rZW0H9Vct7w4qOgqjX67N8B4mO2RP1sk7wONXBaLau1cFLuBn/Xgc4891dBqulFTlVValWNHKDmExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c43XCQJy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c43XCQJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717239620; x=1748775620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vo+iPzInlqdKpN4TawU5JqpIknHBI4+oxGh1lhZ4p2g=;
  b=c43XCQJyIgwrO+GyxK9mjI9SWBSIG4tri+MjWNktzqriAU9U5InylCD4
   sHAFol2wx8cGeA2w8wamIll1ClNtLiy/MLRy8lvRgfG+cOaqELhGhcNf8
   BoOwLOs1kOzRwkh2vXgCv3nXW0ZSvBENFO4mbIY//3BgyE+oKHcDFTOpe
   QcmaSjWnWoL08x8mDyuQhiJgI3BVmZ0A4kwUijMbKqf3GwHg3LlzgZLkb
   QZWOzX6ORK2iMiNhEu17PlXeKwGVgxSWznM15e2osz+43ypxsnifE9B3W
   WdoR3fXHeAXH2qOEDnAW33Wj7rv+DI0+Y5ELc/hyfgrjp0bvcKeMOOm9c
   w==;
X-CSE-ConnectionGUID: NSrJ4YslR9KrK+MfzpmwQg==
X-CSE-MsgGUID: PqL6NUdnTXmXsAXw46SDMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="14009347"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="14009347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 04:00:18 -0700
X-CSE-ConnectionGUID: OnjWt9W+QXa9XvuGxorZUQ==
X-CSE-MsgGUID: bDoqQassSg+I5fCdnhmwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36325108"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2024 04:00:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDMT8-000Ijh-1l;
	Sat, 01 Jun 2024 11:00:14 +0000
Date: Sat, 1 Jun 2024 18:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC net-next 6/6] af_packet: pass rx socket on rcv drops
Message-ID: <202406011859.Aacus8GV-lkp@intel.com>
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
In-Reply-To: <df2ad57a2986038ae9b5e46c73d48c22bb86b788.1717105215.git.yan@cloudflare.com>
References: <df2ad57a2986038ae9b5e46c73d48c22bb86b788.1717105215.git.yan@cloudflare.com>
TO: Yan Zhai <yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-kfree_skb_for_sk-function/20240531-055120
base:   net-next/main
patch link:    https://lore.kernel.org/r/df2ad57a2986038ae9b5e46c73d48c22bb86b788.1717105215.git.yan%40cloudflare.com
patch subject: [RFC net-next 6/6] af_packet: pass rx socket on rcv drops
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011859.Aacus8GV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406011859.Aacus8GV-lkp@intel.com/

smatch warnings:
net/packet/af_packet.c:2229 packet_rcv() error: uninitialized symbol 'sk'.
net/packet/af_packet.c:2497 tpacket_rcv() error: uninitialized symbol 'sk'.

vim +/sk +2229 net/packet/af_packet.c

16cc1400456a4d Willem de Bruijn         2016-02-03  2107  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2108  /*
62ab0812137ec4 Eric Dumazet             2010-12-06  2109   * This function makes lazy skb cloning in hope that most of packets
62ab0812137ec4 Eric Dumazet             2010-12-06  2110   * are discarded by BPF.
62ab0812137ec4 Eric Dumazet             2010-12-06  2111   *
62ab0812137ec4 Eric Dumazet             2010-12-06  2112   * Note tricky part: we DO mangle shared skb! skb->data, skb->len
62ab0812137ec4 Eric Dumazet             2010-12-06  2113   * and skb->cb are mangled. It works because (and until) packets
62ab0812137ec4 Eric Dumazet             2010-12-06  2114   * falling here are owned by current CPU. Output packets are cloned
62ab0812137ec4 Eric Dumazet             2010-12-06  2115   * by dev_queue_xmit_nit(), input packets are processed by net_bh
0e4161d0eda56e Wang Hai                 2021-03-24  2116   * sequentially, so that if we return skb to original state on exit,
62ab0812137ec4 Eric Dumazet             2010-12-06  2117   * we will not harm anyone.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2118   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  2119  
40d4e3dfc2f56a Eric Dumazet             2009-07-21  2120  static int packet_rcv(struct sk_buff *skb, struct net_device *dev,
40d4e3dfc2f56a Eric Dumazet             2009-07-21  2121  		      struct packet_type *pt, struct net_device *orig_dev)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2122  {
2f57dd94bdef08 Yan Zhai                 2023-12-04  2123  	enum skb_drop_reason drop_reason = SKB_CONSUMED;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2124  	struct sock *sk;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2125  	struct sockaddr_ll *sll;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2126  	struct packet_sock *po;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2127  	u8 *skb_head = skb->data;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2128  	int skb_len = skb->len;
dbcb5855d108b7 David S. Miller          2007-01-24  2129  	unsigned int snaplen, res;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2130  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2131  	if (skb->pkt_type == PACKET_LOOPBACK)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2132  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2133  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2134  	sk = pt->af_packet_priv;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2135  	po = pkt_sk(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2136  
09ad9bc752519c Octavian Purdila         2009-11-25  2137  	if (!net_eq(dev_net(dev), sock_net(sk)))
d12d01d6b4d197 Denis V. Lunev           2007-11-19  2138  		goto drop;
d12d01d6b4d197 Denis V. Lunev           2007-11-19  2139  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2140  	skb->dev = dev;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2141  
d549699048b4b5 Eyal Birger              2020-11-21  2142  	if (dev_has_header(dev)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2143  		/* The device has an explicit notion of ll header,
62ab0812137ec4 Eric Dumazet             2010-12-06  2144  		 * exported to higher levels.
62ab0812137ec4 Eric Dumazet             2010-12-06  2145  		 *
62ab0812137ec4 Eric Dumazet             2010-12-06  2146  		 * Otherwise, the device hides details of its frame
62ab0812137ec4 Eric Dumazet             2010-12-06  2147  		 * structure, so that corresponding packet head is
62ab0812137ec4 Eric Dumazet             2010-12-06  2148  		 * never delivered to user.
^1da177e4c3f41 Linus Torvalds           2005-04-16  2149  		 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  2150  		if (sk->sk_type != SOCK_DGRAM)
98e399f82ab3a6 Arnaldo Carvalho de Melo 2007-03-19  2151  			skb_push(skb, skb->data - skb_mac_header(skb));
^1da177e4c3f41 Linus Torvalds           2005-04-16  2152  		else if (skb->pkt_type == PACKET_OUTGOING) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2153  			/* Special case: outgoing packets have ll header at head */
bbe735e4247dba Arnaldo Carvalho de Melo 2007-03-10  2154  			skb_pull(skb, skb_network_offset(skb));
^1da177e4c3f41 Linus Torvalds           2005-04-16  2155  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2156  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2157  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2158  	snaplen = skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2159  
dbcb5855d108b7 David S. Miller          2007-01-24  2160  	res = run_filter(skb, sk, snaplen);
dbcb5855d108b7 David S. Miller          2007-01-24  2161  	if (!res)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2162  		goto drop_n_restore;
dbcb5855d108b7 David S. Miller          2007-01-24  2163  	if (snaplen > res)
dbcb5855d108b7 David S. Miller          2007-01-24  2164  		snaplen = res;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2165  
0fd7bac6b6157e Eric Dumazet             2011-12-21  2166  	if (atomic_read(&sk->sk_rmem_alloc) >= sk->sk_rcvbuf)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2167  		goto drop_n_acct;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2168  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2169  	if (skb_shared(skb)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2170  		struct sk_buff *nskb = skb_clone(skb, GFP_ATOMIC);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2171  		if (nskb == NULL)
^1da177e4c3f41 Linus Torvalds           2005-04-16  2172  			goto drop_n_acct;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2173  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2174  		if (skb_head != skb->data) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2175  			skb->data = skb_head;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2176  			skb->len = skb_len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2177  		}
abc4e4fa29eb81 Eric Dumazet             2012-04-19  2178  		consume_skb(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2179  		skb = nskb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2180  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2181  
b4772ef879a8f7 Eyal Birger              2015-03-01  2182  	sock_skb_cb_check_size(sizeof(*PACKET_SKB_CB(skb)) + MAX_ADDR_LEN - 8);
ffbc61117d32dc Herbert Xu               2007-02-04  2183  
ffbc61117d32dc Herbert Xu               2007-02-04  2184  	sll = &PACKET_SKB_CB(skb)->sa.ll;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2185  	sll->sll_hatype = dev->type;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2186  	sll->sll_pkttype = skb->pkt_type;
ee5675ecdf7a4e Eric Dumazet             2023-03-16  2187  	if (unlikely(packet_sock_flag(po, PACKET_SOCK_ORIGDEV)))
80feaacb8a6400 Peter P. Waskiewicz Jr   2007-04-20  2188  		sll->sll_ifindex = orig_dev->ifindex;
80feaacb8a6400 Peter P. Waskiewicz Jr   2007-04-20  2189  	else
^1da177e4c3f41 Linus Torvalds           2005-04-16  2190  		sll->sll_ifindex = dev->ifindex;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2191  
b95cce3576813a Stephen Hemminger        2007-09-26  2192  	sll->sll_halen = dev_parse_header(skb, sll->sll_addr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2193  
2472d7613bd3ba Eyal Birger              2015-03-01  2194  	/* sll->sll_family and sll->sll_protocol are set in packet_recvmsg().
2472d7613bd3ba Eyal Birger              2015-03-01  2195  	 * Use their space for storing the original skb length.
2472d7613bd3ba Eyal Birger              2015-03-01  2196  	 */
2472d7613bd3ba Eyal Birger              2015-03-01  2197  	PACKET_SKB_CB(skb)->sa.origlen = skb->len;
8dc41944741596 Herbert Xu               2007-02-04  2198  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2199  	if (pskb_trim(skb, snaplen))
^1da177e4c3f41 Linus Torvalds           2005-04-16  2200  		goto drop_n_acct;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2201  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2202  	skb_set_owner_r(skb, sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2203  	skb->dev = NULL;
adf30907d63893 Eric Dumazet             2009-06-02  2204  	skb_dst_drop(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2205  
84531c24f27b02 Phil Oester              2005-07-12  2206  	/* drop conntrack reference */
895b5c9f206eb7 Florian Westphal         2019-09-29  2207  	nf_reset_ct(skb);
84531c24f27b02 Phil Oester              2005-07-12  2208  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2209  	spin_lock(&sk->sk_receive_queue.lock);
ee80fbf301adac Daniel Borkmann          2013-04-19  2210  	po->stats.stats1.tp_packets++;
3bc3b96f3b455b Eyal Birger              2015-03-01  2211  	sock_skb_set_dropcount(sk, skb);
27942a15209f56 Martin KaFai Lau         2022-03-02  2212  	skb_clear_delivery_time(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2213  	__skb_queue_tail(&sk->sk_receive_queue, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2214  	spin_unlock(&sk->sk_receive_queue.lock);
676d23690fb62b David S. Miller          2014-04-11  2215  	sk->sk_data_ready(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2216  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2217  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2218  drop_n_acct:
8e8e2951e30957 Eric Dumazet             2019-06-12  2219  	atomic_inc(&po->tp_drops);
7091fbd82cd568 Willem de Bruijn         2011-09-30  2220  	atomic_inc(&sk->sk_drops);
2f57dd94bdef08 Yan Zhai                 2023-12-04  2221  	drop_reason = SKB_DROP_REASON_PACKET_SOCK_ERROR;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2222  
^1da177e4c3f41 Linus Torvalds           2005-04-16  2223  drop_n_restore:
^1da177e4c3f41 Linus Torvalds           2005-04-16  2224  	if (skb_head != skb->data && skb_shared(skb)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  2225  		skb->data = skb_head;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2226  		skb->len = skb_len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2227  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  2228  drop:
6def5ba6ef15af Yan Zhai                 2024-05-30 @2229  	kfree_skb_for_sk(skb, sk, drop_reason);
^1da177e4c3f41 Linus Torvalds           2005-04-16  2230  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  2231  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  2232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
