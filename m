Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83AAD21
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Mar 2024 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709453983; cv=none; b=BI2IqTZ5/ACrzpJPfpl1dAITTKPKU09qUQjmisFA2BP8wq51/61m6xTMzGa3q7s7xEyB05YPBNhu0CEYctTfAEgChS2CF0zHhf5brwO66sw6fK00P0MChfUfs0uSOCpLINrKdjBbx63W+q5rHiduc2vBEQo2Ky4vQqH92rjE/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709453983; c=relaxed/simple;
	bh=fplwTR/7IAJ+P0hkoptM/aagFmi3KnL15xy7L+CU/bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGpH6looB1GaV+TK9erlQjjfN7KTEN7VHIReNtg1jHNxLo8EqR04jVjm5DHnC7SaSupBRVHljdJ0w2M6WC8VahusK+957eB1oj4O//T3jzqWjF4TIvxEaVgUan/fBBjNXmO2vNJ1oOOzYN/ONCWUoU5yPXveRRPQevvtu4f67iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMxs+lyT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMxs+lyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709453981; x=1740989981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fplwTR/7IAJ+P0hkoptM/aagFmi3KnL15xy7L+CU/bo=;
  b=MMxs+lyTsRTxwphOvP5ZcRIi7xbYv1IL1WZPnK+16k9968HuBaDG5wAT
   JKUkzB4MHIBiZLaCcv6neZSw6gmnIzbWnQvpqWOlfBNW59GhYJ086rvtd
   1FfM+z2p+tTjkArSWfLDNHrWFpXyw95Am8KcJmn370F9caXkjDFnUWUAc
   9R703J5rcAdtbLzXXZtFb0EaMk2TBgZS1PIZCl+LdRnCUiJlIg05mQ+Er
   p//ItwxYFwtELOSf5uYdBF3j15KhW8wAuzjB2dmsk4pi2o64K4SCMRI8z
   YmtX0E8lXnJbFqKE8r2hQhQXvjWpDw0LUIuyL/wdPuV2GKc2hY8Dq03Am
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14533655"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14533655"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8590189"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2024 00:19:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgh4J-0001SG-2t;
	Sun, 03 Mar 2024 08:19:35 +0000
Date: Sun, 3 Mar 2024 16:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [opencloudos:next 25/98] net/ipv6/ip6_input.c:197 ip6_rcv_core()
 error: we previously assumed 'dev' could be null (see line 163)
Message-ID: <202403031604.Upli769L-lkp@intel.com>
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
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
:::::: branch date: 2 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031604.Upli769L-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403031604.Upli769L-lkp@intel.com/

smatch warnings:
net/ipv6/ip6_input.c:197 ip6_rcv_core() error: we previously assumed 'dev' could be null (see line 163)

vim +/dev +197 net/ipv6/ip6_input.c

d8269e2cbf908f Edward Cree              2018-07-05  148  
d8269e2cbf908f Edward Cree              2018-07-05  149  static struct sk_buff *ip6_rcv_core(struct sk_buff *skb, struct net_device *dev,
d8269e2cbf908f Edward Cree              2018-07-05  150  				    struct net *net)
^1da177e4c3f41 Linus Torvalds           2005-04-16  151  {
4daf841a2ef3b2 Menglong Dong            2022-04-13  152  	enum skb_drop_reason reason;
b71d1d426d263b Eric Dumazet             2011-04-22  153  	const struct ipv6hdr *hdr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  154  	u32 pkt_len;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  155  	struct inet6_dev *idev;
^1da177e4c3f41 Linus Torvalds           2005-04-16  156  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  157  	if (skb->pkt_type == PACKET_OTHERHOST) {
794c24e9921f32 Jeffrey Ji               2022-04-06  158  		dev_core_stats_rx_otherhost_dropped_inc(skb->dev);
4daf841a2ef3b2 Menglong Dong            2022-04-13  159  		kfree_skb_reason(skb, SKB_DROP_REASON_OTHERHOST);
d8269e2cbf908f Edward Cree              2018-07-05  160  		return NULL;
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  161  	}
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  162  
d9324ddd538a0b Hongbo Li                2023-11-16 @163  	if (dev) {
d9324ddd538a0b Hongbo Li                2023-11-16  164  		__SNMP_INC_STATS(dev->mib.dev_statistics, DEV_MIB_IPV6_RX_PKTS);
d9324ddd538a0b Hongbo Li                2023-11-16  165  		__SNMP_ADD_STATS(dev->mib.dev_statistics, DEV_MIB_IPV6_RX_BYTES,
d9324ddd538a0b Hongbo Li                2023-11-16  166  				 skb->len);
d9324ddd538a0b Hongbo Li                2023-11-16  167  	}
d9324ddd538a0b Hongbo Li                2023-11-16  168  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  169  	rcu_read_lock();
^1da177e4c3f41 Linus Torvalds           2005-04-16  170  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  171  	idev = __in6_dev_get(skb->dev);
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  172  
c2005eb01044e8 Eric Dumazet             2016-04-27  173  	__IP6_UPD_PO_STATS(net, idev, IPSTATS_MIB_IN, skb->len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  174  
4daf841a2ef3b2 Menglong Dong            2022-04-13  175  	SKB_DR_SET(reason, NOT_SPECIFIED);
778d80be526995 YOSHIFUJI Hideaki        2008-06-28  176  	if ((skb = skb_share_check(skb, GFP_ATOMIC)) == NULL ||
778d80be526995 YOSHIFUJI Hideaki        2008-06-28  177  	    !idev || unlikely(idev->cnf.disable_ipv6)) {
1d0155035918aa Eric Dumazet             2016-04-27  178  		__IP6_INC_STATS(net, idev, IPSTATS_MIB_INDISCARDS);
0339d25a2807d9 Eric Dumazet             2022-04-13  179  		if (idev && unlikely(idev->cnf.disable_ipv6))
4daf841a2ef3b2 Menglong Dong            2022-04-13  180  			SKB_DR_SET(reason, IPV6DISABLED);
71f6f6dfdf7c7a Jesper Nilsson           2009-03-27  181  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  182  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  183  
6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  184  	memset(IP6CB(skb), 0, sizeof(struct inet6_skb_parm));
6b7fdc3ae18a05 Guillaume Chazarain      2006-07-24  185  
^1da177e4c3f41 Linus Torvalds           2005-04-16  186  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  187  	 * Store incoming device index. When the packet will
^1da177e4c3f41 Linus Torvalds           2005-04-16  188  	 * be queued, we cannot refer to skb->dev anymore.
^1da177e4c3f41 Linus Torvalds           2005-04-16  189  	 *
^1da177e4c3f41 Linus Torvalds           2005-04-16  190  	 * BTW, when we send a packet for our own local address on a
^1da177e4c3f41 Linus Torvalds           2005-04-16  191  	 * non-loopback interface (e.g. ethX), it is being delivered
de3cb747ffac5f Daniel Lezcano           2007-09-25  192  	 * via the loopback interface (lo) here; skb->dev = loopback_dev.
^1da177e4c3f41 Linus Torvalds           2005-04-16  193  	 * It, however, should be considered as if it is being
^1da177e4c3f41 Linus Torvalds           2005-04-16  194  	 * arrived via the sending interface (ethX), because of the
^1da177e4c3f41 Linus Torvalds           2005-04-16  195  	 * nature of scoping architecture. --yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  196  	 */
48fb6b55450191 Wei-Chun Chao            2015-07-22 @197  	IP6CB(skb)->iif = skb_valid_dst(skb) ? ip6_dst_idev(skb_dst(skb))->dev->ifindex : dev->ifindex;
^1da177e4c3f41 Linus Torvalds           2005-04-16  198  
2889139a6acd29 Herbert Xu               2006-06-30  199  	if (unlikely(!pskb_may_pull(skb, sizeof(*hdr))))
^1da177e4c3f41 Linus Torvalds           2005-04-16  200  		goto err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  201  
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  202  	hdr = ipv6_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  203  
4daf841a2ef3b2 Menglong Dong            2022-04-13  204  	if (hdr->version != 6) {
4daf841a2ef3b2 Menglong Dong            2022-04-13  205  		SKB_DR_SET(reason, UNHANDLED_PROTO);
^1da177e4c3f41 Linus Torvalds           2005-04-16  206  		goto err;
4daf841a2ef3b2 Menglong Dong            2022-04-13  207  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  208  
1d0155035918aa Eric Dumazet             2016-04-27  209  	__IP6_ADD_STATS(net, idev,
1f07d03e2069df Eric Dumazet             2013-08-06  210  			IPSTATS_MIB_NOECTPKTS +
1f07d03e2069df Eric Dumazet             2013-08-06  211  				(ipv6_get_dsfield(hdr) & INET_ECN_MASK),
1f07d03e2069df Eric Dumazet             2013-08-06  212  			max_t(unsigned short, 1, skb_shinfo(skb)->gso_segs));
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  213  	/*
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  214  	 * RFC4291 2.5.3
0aa8c13eb51282 Florian Westphal         2017-04-14  215  	 * The loopback address must not be used as the source address in IPv6
0aa8c13eb51282 Florian Westphal         2017-04-14  216  	 * packets that are sent outside of a single node. [..]
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  217  	 * A packet received on an interface with a destination address
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  218  	 * of loopback must be dropped.
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  219  	 */
0aa8c13eb51282 Florian Westphal         2017-04-14  220  	if ((ipv6_addr_loopback(&hdr->saddr) ||
0aa8c13eb51282 Florian Westphal         2017-04-14  221  	     ipv6_addr_loopback(&hdr->daddr)) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  222  	    !(dev->flags & IFF_LOOPBACK) &&
3ede0bbcdfc94c Robert Shearman          2018-09-19  223  	    !netif_is_l3_master(dev))
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  224  		goto err;
f630e43a215a31 YOSHIFUJI Hideaki        2008-06-19  225  
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  226  	/* RFC4291 Errata ID: 3480
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  227  	 * Interface-Local scope spans only a single interface on a
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  228  	 * node and is useful only for loopback transmission of
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  229  	 * multicast.  Packets with interface-local scope received
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  230  	 * from another node must be discarded.
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  231  	 */
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  232  	if (!(skb->pkt_type == PACKET_LOOPBACK ||
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  233  	      dev->flags & IFF_LOOPBACK) &&
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  234  	    ipv6_addr_is_multicast(&hdr->daddr) &&
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  235  	    IPV6_ADDR_MC_SCOPE(&hdr->daddr) == 1)
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  236  		goto err;
1c4a154e525368 Hannes Frederic Sowa     2013-03-26  237  
abbc30436d39df Johannes Berg            2016-02-04  238  	/* If enabled, drop unicast packets that were encapsulated in link-layer
abbc30436d39df Johannes Berg            2016-02-04  239  	 * multicast or broadcast to protected against the so-called "hole-196"
abbc30436d39df Johannes Berg            2016-02-04  240  	 * attack in 802.11 wireless.
abbc30436d39df Johannes Berg            2016-02-04  241  	 */
abbc30436d39df Johannes Berg            2016-02-04  242  	if (!ipv6_addr_is_multicast(&hdr->daddr) &&
abbc30436d39df Johannes Berg            2016-02-04  243  	    (skb->pkt_type == PACKET_BROADCAST ||
abbc30436d39df Johannes Berg            2016-02-04  244  	     skb->pkt_type == PACKET_MULTICAST) &&
4daf841a2ef3b2 Menglong Dong            2022-04-13  245  	    idev->cnf.drop_unicast_in_l2_multicast) {
4daf841a2ef3b2 Menglong Dong            2022-04-13  246  		SKB_DR_SET(reason, UNICAST_IN_L2_MULTICAST);
abbc30436d39df Johannes Berg            2016-02-04  247  		goto err;
4daf841a2ef3b2 Menglong Dong            2022-04-13  248  	}
abbc30436d39df Johannes Berg            2016-02-04  249  
20314092c1b418 Hannes Frederic Sowa     2013-02-10  250  	/* RFC4291 2.7
20314092c1b418 Hannes Frederic Sowa     2013-02-10  251  	 * Nodes must not originate a packet to a multicast address whose scope
20314092c1b418 Hannes Frederic Sowa     2013-02-10  252  	 * field contains the reserved value 0; if such a packet is received, it
20314092c1b418 Hannes Frederic Sowa     2013-02-10  253  	 * must be silently dropped.
20314092c1b418 Hannes Frederic Sowa     2013-02-10  254  	 */
20314092c1b418 Hannes Frederic Sowa     2013-02-10  255  	if (ipv6_addr_is_multicast(&hdr->daddr) &&
20314092c1b418 Hannes Frederic Sowa     2013-02-10  256  	    IPV6_ADDR_MC_SCOPE(&hdr->daddr) == 0)
20314092c1b418 Hannes Frederic Sowa     2013-02-10  257  		goto err;
20314092c1b418 Hannes Frederic Sowa     2013-02-10  258  
c457338d7acd38 Brian Haley              2011-11-08  259  	/*
c457338d7acd38 Brian Haley              2011-11-08  260  	 * RFC4291 2.7
c457338d7acd38 Brian Haley              2011-11-08  261  	 * Multicast addresses must not be used as source addresses in IPv6
c457338d7acd38 Brian Haley              2011-11-08  262  	 * packets or appear in any Routing header.
c457338d7acd38 Brian Haley              2011-11-08  263  	 */
c457338d7acd38 Brian Haley              2011-11-08  264  	if (ipv6_addr_is_multicast(&hdr->saddr))
c457338d7acd38 Brian Haley              2011-11-08  265  		goto err;
c457338d7acd38 Brian Haley              2011-11-08  266  
b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  267  	skb->transport_header = skb->network_header + sizeof(*hdr);
951dbc8ac714b0 Patrick McHardy          2006-01-06  268  	IP6CB(skb)->nhoff = offsetof(struct ipv6hdr, nexthdr);
951dbc8ac714b0 Patrick McHardy          2006-01-06  269  
^1da177e4c3f41 Linus Torvalds           2005-04-16  270  	pkt_len = ntohs(hdr->payload_len);
^1da177e4c3f41 Linus Torvalds           2005-04-16  271  
^1da177e4c3f41 Linus Torvalds           2005-04-16  272  	/* pkt_len may be zero if Jumbo payload option is present */
^1da177e4c3f41 Linus Torvalds           2005-04-16  273  	if (pkt_len || hdr->nexthdr != NEXTHDR_HOP) {
60e5c166413f17 Mitsuru Chinen           2007-04-04  274  		if (pkt_len + sizeof(struct ipv6hdr) > skb->len) {
1d0155035918aa Eric Dumazet             2016-04-27  275  			__IP6_INC_STATS(net,
483a47d2fe7943 Denis V. Lunev           2008-10-08  276  					idev, IPSTATS_MIB_INTRUNCATEDPKTS);
4daf841a2ef3b2 Menglong Dong            2022-04-13  277  			SKB_DR_SET(reason, PKT_TOO_SMALL);
60e5c166413f17 Mitsuru Chinen           2007-04-04  278  			goto drop;
60e5c166413f17 Mitsuru Chinen           2007-04-04  279  		}
4daf841a2ef3b2 Menglong Dong            2022-04-13  280  		if (pskb_trim_rcsum(skb, pkt_len + sizeof(struct ipv6hdr)))
4daf841a2ef3b2 Menglong Dong            2022-04-13  281  			goto err;
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25  282  		hdr = ipv6_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  283  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  284  
^1da177e4c3f41 Linus Torvalds           2005-04-16  285  	if (hdr->nexthdr == NEXTHDR_HOP) {
e5bbef20e017ef Herbert Xu               2007-10-15  286  		if (ipv6_parse_hopopts(skb) < 0) {
1d0155035918aa Eric Dumazet             2016-04-27  287  			__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  288  			rcu_read_unlock();
d8269e2cbf908f Edward Cree              2018-07-05  289  			return NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  290  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  291  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  292  
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  293  	rcu_read_unlock();
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  294  
71f9dacd2e4d23 Herbert Xu               2009-06-26  295  	/* Must drop socket now because of tproxy. */
cf7fbe660f2dbd Joe Stringer             2020-03-29  296  	if (!skb_sk_is_prefetched(skb))
71f9dacd2e4d23 Herbert Xu               2009-06-26  297  		skb_orphan(skb);
71f9dacd2e4d23 Herbert Xu               2009-06-26  298  
d8269e2cbf908f Edward Cree              2018-07-05  299  	return skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  300  err:
1d0155035918aa Eric Dumazet             2016-04-27  301  	__IP6_INC_STATS(net, idev, IPSTATS_MIB_INHDRERRORS);
4daf841a2ef3b2 Menglong Dong            2022-04-13  302  	SKB_DR_OR(reason, IP_INHDR);
^1da177e4c3f41 Linus Torvalds           2005-04-16  303  drop:
a11d206d0f88e0 YOSHIFUJI Hideaki        2006-11-04  304  	rcu_read_unlock();
4daf841a2ef3b2 Menglong Dong            2022-04-13  305  	kfree_skb_reason(skb, reason);
d8269e2cbf908f Edward Cree              2018-07-05  306  	return NULL;
d8269e2cbf908f Edward Cree              2018-07-05  307  }
d8269e2cbf908f Edward Cree              2018-07-05  308  

:::::: The code at line 197 was first introduced by commit
:::::: 48fb6b554501914b6befcf9b38292cbeb91de330 ipv6: fix crash over flow-based vxlan device

:::::: TO: Wei-Chun Chao <weichunc@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
