Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C492E3F7
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714500764; cv=none; b=VpsfmAKgWWlUUtJDqXhN/ZECf8vXSsjt94NVFO5qNr+NYiPwNW3HwX4B6kwY3uEdJ34pENjcnEArdVi2Kz+O+in7DGARymmr1l/mJM3rTgDspp0A2T4UuKYPn0r/SbeqpBHOrrqkut4mn7ZYNAtKtFVg5pzHWvuFibDy8jHqV1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714500764; c=relaxed/simple;
	bh=drzcrrUWCpGN6lVv+RySA8/jpfMyFHGZNKvLlWGC6yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avzByY4V5xsggpjCT0bVnJ86jMqhBcLCGdyRLxNOfctp3EttsA2tm3iG8JnlnUREN8x5EtmNfW/skOafzDZeLgeychuocj7i+YUi51KL2EtUX9G7S2sjhFTpBfLfbmihA87chSO21hdZr1Kj60DRIG3AYjG5+EKu1Mdf7ISgNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeggBhUx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeggBhUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714500762; x=1746036762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=drzcrrUWCpGN6lVv+RySA8/jpfMyFHGZNKvLlWGC6yQ=;
  b=OeggBhUxL4b1jCwXlSRtvp96SGS//kZdAjzz1v1O8CB6KkcUjNhJqIL5
   f4Xl2NrKEcLKi/CYpx+TaEo8i8v8zFU2qSuEVBvy3779ZYyj/xMgpd4FB
   ZhVhz3zD58+6j+iTnXujI5WPF/c6NCKPyvLgZ6r2l0H2VKhMtz6YD/JbB
   4yJAjdfaRzWRNRV/5RCeNnWXUHdd+JUCk17aTGj27d+tIJqiTCZwcVl+8
   fS51fknDFSzySjLpvP6Txo8GmSvYodQfc0durZgk3DBEC5c1VUnMJpX/O
   2WuKI5CZsjiTkzk8E3ROl2IOfwS7ndL7H1MNQvAJ/r6AuewLxFcPd7b3j
   A==;
X-CSE-ConnectionGUID: 9wYLVAf4QXiHByMwLpSKEQ==
X-CSE-MsgGUID: bFn95KJoQa2lf84IoymtsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21374947"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="21374947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 11:12:42 -0700
X-CSE-ConnectionGUID: uFW37xdqQbylzYdIaHMZJg==
X-CSE-MsgGUID: i6GEdCFVTm6R21eSDrTESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="30994673"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2024 11:12:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ry2-0008Rr-0B;
	Tue, 30 Apr 2024 18:12:38 +0000
Date: Wed, 1 May 2024 02:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9035/9709] net/ipv6/route.c:5712 rt6_fill_node()
 error: we previously assumed 'dst' could be null (see line 5697)
Message-ID: <202405010144.JHkU1dT1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Dumazet <edumazet@google.com>
CC: David Ahern <dsahern@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: e8dfd42c17faf183415323db1ef0c977be0d6489 [9035/9709] ipv6: introduce dst_rt6_info() helper
:::::: branch date: 11 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20240430 (https://download.01.org/0day-ci/archive/20240501/202405010144.JHkU1dT1-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405010144.JHkU1dT1-lkp@intel.com/

New smatch warnings:
net/ipv6/route.c:5712 rt6_fill_node() error: we previously assumed 'dst' could be null (see line 5697)

Old smatch warnings:
net/ipv6/route.c:3420 ip6_route_check_nh() error: we previously assumed '_dev' could be null (see line 3380)

vim +/dst +5712 net/ipv6/route.c

f88d8ea67fbdba David Ahern         2019-06-03  5604  
d4ead6b34b67fd David Ahern         2018-04-17  5605  static int rt6_fill_node(struct net *net, struct sk_buff *skb,
8d1c802b2815ed David Ahern         2018-04-17  5606  			 struct fib6_info *rt, struct dst_entry *dst,
d4ead6b34b67fd David Ahern         2018-04-17  5607  			 struct in6_addr *dest, struct in6_addr *src,
15e473046cb6e5 Eric W. Biederman   2012-09-07  5608  			 int iif, int type, u32 portid, u32 seq,
f8cfe2ceb1c2eb David Ahern         2017-01-17  5609  			 unsigned int flags)
^1da177e4c3f41 Linus Torvalds      2005-04-16  5610  {
e8dfd42c17faf1 Eric Dumazet        2024-04-26  5611  	struct rt6_info *rt6 = dst_rt6_info(dst);
22d0bd82cc7cec Xin Long            2018-09-11  5612  	struct rt6key *rt6_dst, *rt6_src;
22d0bd82cc7cec Xin Long            2018-09-11  5613  	u32 *pmetrics, table, rt6_flags;
f88d8ea67fbdba David Ahern         2019-06-03  5614  	unsigned char nh_flags = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5615  	struct nlmsghdr *nlh;
22d0bd82cc7cec Xin Long            2018-09-11  5616  	struct rtmsg *rtm;
d4ead6b34b67fd David Ahern         2018-04-17  5617  	long expires = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5618  
15e473046cb6e5 Eric W. Biederman   2012-09-07  5619  	nlh = nlmsg_put(skb, portid, seq, type, sizeof(*rtm), flags);
3830847396fa6d David S. Miller     2011-12-03  5620  	if (!nlh)
26932566a42d46 Patrick McHardy     2007-01-31  5621  		return -EMSGSIZE;
2d7202bfdd2868 Thomas Graf         2006-08-22  5622  
22d0bd82cc7cec Xin Long            2018-09-11  5623  	if (rt6) {
22d0bd82cc7cec Xin Long            2018-09-11  5624  		rt6_dst = &rt6->rt6i_dst;
22d0bd82cc7cec Xin Long            2018-09-11  5625  		rt6_src = &rt6->rt6i_src;
22d0bd82cc7cec Xin Long            2018-09-11  5626  		rt6_flags = rt6->rt6i_flags;
22d0bd82cc7cec Xin Long            2018-09-11  5627  	} else {
22d0bd82cc7cec Xin Long            2018-09-11  5628  		rt6_dst = &rt->fib6_dst;
22d0bd82cc7cec Xin Long            2018-09-11  5629  		rt6_src = &rt->fib6_src;
22d0bd82cc7cec Xin Long            2018-09-11  5630  		rt6_flags = rt->fib6_flags;
22d0bd82cc7cec Xin Long            2018-09-11  5631  	}
22d0bd82cc7cec Xin Long            2018-09-11  5632  
2d7202bfdd2868 Thomas Graf         2006-08-22  5633  	rtm = nlmsg_data(nlh);
^1da177e4c3f41 Linus Torvalds      2005-04-16  5634  	rtm->rtm_family = AF_INET6;
22d0bd82cc7cec Xin Long            2018-09-11  5635  	rtm->rtm_dst_len = rt6_dst->plen;
22d0bd82cc7cec Xin Long            2018-09-11  5636  	rtm->rtm_src_len = rt6_src->plen;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5637  	rtm->rtm_tos = 0;
93c2fb253d177a David Ahern         2018-04-18  5638  	if (rt->fib6_table)
93c2fb253d177a David Ahern         2018-04-18  5639  		table = rt->fib6_table->tb6_id;
c71099acce9334 Thomas Graf         2006-08-04  5640  	else
9e762a4a89b302 Patrick McHardy     2006-08-10  5641  		table = RT6_TABLE_UNSPEC;
97f0082a059221 Kalash Nainwal      2019-02-20  5642  	rtm->rtm_table = table < 256 ? table : RT_TABLE_COMPAT;
c78679e8f31b86 David S. Miller     2012-04-01  5643  	if (nla_put_u32(skb, RTA_TABLE, table))
c78679e8f31b86 David S. Miller     2012-04-01  5644  		goto nla_put_failure;
e8478e80e5a74f David Ahern         2018-04-17  5645  
e8478e80e5a74f David Ahern         2018-04-17  5646  	rtm->rtm_type = rt->fib6_type;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5647  	rtm->rtm_flags = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5648  	rtm->rtm_scope = RT_SCOPE_UNIVERSE;
93c2fb253d177a David Ahern         2018-04-18  5649  	rtm->rtm_protocol = rt->fib6_protocol;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5650  
22d0bd82cc7cec Xin Long            2018-09-11  5651  	if (rt6_flags & RTF_CACHE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  5652  		rtm->rtm_flags |= RTM_F_CLONED;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5653  
d4ead6b34b67fd David Ahern         2018-04-17  5654  	if (dest) {
d4ead6b34b67fd David Ahern         2018-04-17  5655  		if (nla_put_in6_addr(skb, RTA_DST, dest))
c78679e8f31b86 David S. Miller     2012-04-01  5656  			goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5657  		rtm->rtm_dst_len = 128;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5658  	} else if (rtm->rtm_dst_len)
22d0bd82cc7cec Xin Long            2018-09-11  5659  		if (nla_put_in6_addr(skb, RTA_DST, &rt6_dst->addr))
c78679e8f31b86 David S. Miller     2012-04-01  5660  			goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5661  #ifdef CONFIG_IPV6_SUBTREES
^1da177e4c3f41 Linus Torvalds      2005-04-16  5662  	if (src) {
930345ea630405 Jiri Benc           2015-03-29  5663  		if (nla_put_in6_addr(skb, RTA_SRC, src))
c78679e8f31b86 David S. Miller     2012-04-01  5664  			goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5665  		rtm->rtm_src_len = 128;
c78679e8f31b86 David S. Miller     2012-04-01  5666  	} else if (rtm->rtm_src_len &&
22d0bd82cc7cec Xin Long            2018-09-11  5667  		   nla_put_in6_addr(skb, RTA_SRC, &rt6_src->addr))
c78679e8f31b86 David S. Miller     2012-04-01  5668  		goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5669  #endif
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5670  	if (iif) {
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5671  #ifdef CONFIG_IPV6_MROUTE
22d0bd82cc7cec Xin Long            2018-09-11  5672  		if (ipv6_addr_is_multicast(&rt6_dst->addr)) {
fd61c6ba313de6 David Ahern         2017-01-17  5673  			int err = ip6mr_get_route(net, skb, rtm, portid);
2cf750704bb6d7 Nikolay Aleksandrov 2016-09-25  5674  
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5675  			if (err == 0)
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5676  				return 0;
fd61c6ba313de6 David Ahern         2017-01-17  5677  			if (err < 0)
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5678  				goto nla_put_failure;
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5679  		} else
7bc570c8b4f75d YOSHIFUJI Hideaki   2008-04-03  5680  #endif
c78679e8f31b86 David S. Miller     2012-04-01  5681  			if (nla_put_u32(skb, RTA_IIF, iif))
c78679e8f31b86 David S. Miller     2012-04-01  5682  				goto nla_put_failure;
d4ead6b34b67fd David Ahern         2018-04-17  5683  	} else if (dest) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  5684  		struct in6_addr saddr_buf;
d4ead6b34b67fd David Ahern         2018-04-17  5685  		if (ip6_route_get_saddr(net, rt, dest, 0, &saddr_buf) == 0 &&
930345ea630405 Jiri Benc           2015-03-29  5686  		    nla_put_in6_addr(skb, RTA_PREFSRC, &saddr_buf))
c78679e8f31b86 David S. Miller     2012-04-01  5687  			goto nla_put_failure;
c3968a857a6b6c Daniel Walter       2011-04-13  5688  	}
c3968a857a6b6c Daniel Walter       2011-04-13  5689  
93c2fb253d177a David Ahern         2018-04-18  5690  	if (rt->fib6_prefsrc.plen) {
c3968a857a6b6c Daniel Walter       2011-04-13  5691  		struct in6_addr saddr_buf;
93c2fb253d177a David Ahern         2018-04-18  5692  		saddr_buf = rt->fib6_prefsrc.addr;
930345ea630405 Jiri Benc           2015-03-29  5693  		if (nla_put_in6_addr(skb, RTA_PREFSRC, &saddr_buf))
c78679e8f31b86 David S. Miller     2012-04-01  5694  			goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5695  	}
2d7202bfdd2868 Thomas Graf         2006-08-22  5696  
d4ead6b34b67fd David Ahern         2018-04-17 @5697  	pmetrics = dst ? dst_metrics_ptr(dst) : rt->fib6_metrics->metrics;
d4ead6b34b67fd David Ahern         2018-04-17  5698  	if (rtnetlink_put_metrics(skb, pmetrics) < 0)
2d7202bfdd2868 Thomas Graf         2006-08-22  5699  		goto nla_put_failure;
2d7202bfdd2868 Thomas Graf         2006-08-22  5700  
93c2fb253d177a David Ahern         2018-04-18  5701  	if (nla_put_u32(skb, RTA_PRIORITY, rt->fib6_metric))
94f826b8076e2c Eric Dumazet        2012-03-27  5702  		goto nla_put_failure;
2d7202bfdd2868 Thomas Graf         2006-08-22  5703  
beb1afac518dec David Ahern         2017-02-02  5704  	/* For multipath routes, walk the siblings list and add
beb1afac518dec David Ahern         2017-02-02  5705  	 * each as a nexthop within RTA_MULTIPATH.
beb1afac518dec David Ahern         2017-02-02  5706  	 */
22d0bd82cc7cec Xin Long            2018-09-11  5707  	if (rt6) {
22d0bd82cc7cec Xin Long            2018-09-11  5708  		if (rt6_flags & RTF_GATEWAY &&
22d0bd82cc7cec Xin Long            2018-09-11  5709  		    nla_put_in6_addr(skb, RTA_GATEWAY, &rt6->rt6i_gateway))
22d0bd82cc7cec Xin Long            2018-09-11  5710  			goto nla_put_failure;
22d0bd82cc7cec Xin Long            2018-09-11  5711  
22d0bd82cc7cec Xin Long            2018-09-11 @5712  		if (dst->dev && nla_put_u32(skb, RTA_OIF, dst->dev->ifindex))
22d0bd82cc7cec Xin Long            2018-09-11  5713  			goto nla_put_failure;
6b13d8f71fb37c Oliver Herms        2020-11-19  5714  
6b13d8f71fb37c Oliver Herms        2020-11-19  5715  		if (dst->lwtstate &&
6b13d8f71fb37c Oliver Herms        2020-11-19  5716  		    lwtunnel_fill_encap(skb, dst->lwtstate, RTA_ENCAP, RTA_ENCAP_TYPE) < 0)
6b13d8f71fb37c Oliver Herms        2020-11-19  5717  			goto nla_put_failure;
22d0bd82cc7cec Xin Long            2018-09-11  5718  	} else if (rt->fib6_nsiblings) {
8d1c802b2815ed David Ahern         2018-04-17  5719  		struct fib6_info *sibling, *next_sibling;
beb1afac518dec David Ahern         2017-02-02  5720  		struct nlattr *mp;
beb1afac518dec David Ahern         2017-02-02  5721  
ae0be8de9a53cd Michal Kubecek      2019-04-26  5722  		mp = nla_nest_start_noflag(skb, RTA_MULTIPATH);
beb1afac518dec David Ahern         2017-02-02  5723  		if (!mp)
c78679e8f31b86 David S. Miller     2012-04-01  5724  			goto nla_put_failure;
beb1afac518dec David Ahern         2017-02-02  5725  
1cf844c747d542 David Ahern         2019-05-22  5726  		if (fib_add_nexthop(skb, &rt->fib6_nh->nh_common,
597aa16c782496 Xiao Liang          2021-09-23  5727  				    rt->fib6_nh->fib_nh_weight, AF_INET6,
597aa16c782496 Xiao Liang          2021-09-23  5728  				    0) < 0)
c78679e8f31b86 David S. Miller     2012-04-01  5729  			goto nla_put_failure;
8253947e2cdfb1 Li Wei              2012-07-29  5730  
beb1afac518dec David Ahern         2017-02-02  5731  		list_for_each_entry_safe(sibling, next_sibling,
93c2fb253d177a David Ahern         2018-04-18  5732  					 &rt->fib6_siblings, fib6_siblings) {
1cf844c747d542 David Ahern         2019-05-22  5733  			if (fib_add_nexthop(skb, &sibling->fib6_nh->nh_common,
7bdf4de1267780 Donald Sharp        2019-09-04  5734  					    sibling->fib6_nh->fib_nh_weight,
597aa16c782496 Xiao Liang          2021-09-23  5735  					    AF_INET6, 0) < 0)
beb1afac518dec David Ahern         2017-02-02  5736  				goto nla_put_failure;
beb1afac518dec David Ahern         2017-02-02  5737  		}
beb1afac518dec David Ahern         2017-02-02  5738  
beb1afac518dec David Ahern         2017-02-02  5739  		nla_nest_end(skb, mp);
f88d8ea67fbdba David Ahern         2019-06-03  5740  	} else if (rt->nh) {
f88d8ea67fbdba David Ahern         2019-06-03  5741  		if (nla_put_u32(skb, RTA_NH_ID, rt->nh->id))
f88d8ea67fbdba David Ahern         2019-06-03  5742  			goto nla_put_failure;
ecc5663cce8c7d David Ahern         2019-04-23  5743  
f88d8ea67fbdba David Ahern         2019-06-03  5744  		if (nexthop_is_blackhole(rt->nh))
f88d8ea67fbdba David Ahern         2019-06-03  5745  			rtm->rtm_type = RTN_BLACKHOLE;
f88d8ea67fbdba David Ahern         2019-06-03  5746  
bdf00bf24bef9b Kuniyuki Iwashima   2022-07-11  5747  		if (READ_ONCE(net->ipv4.sysctl_nexthop_compat_mode) &&
4f80116d3df3b2 Roopa Prabhu        2020-04-27  5748  		    rt6_fill_node_nexthop(skb, rt->nh, &nh_flags) < 0)
f88d8ea67fbdba David Ahern         2019-06-03  5749  			goto nla_put_failure;
f88d8ea67fbdba David Ahern         2019-06-03  5750  
f88d8ea67fbdba David Ahern         2019-06-03  5751  		rtm->rtm_flags |= nh_flags;
f88d8ea67fbdba David Ahern         2019-06-03  5752  	} else {
7bdf4de1267780 Donald Sharp        2019-09-04  5753  		if (fib_nexthop_info(skb, &rt->fib6_nh->nh_common, AF_INET6,
ecc5663cce8c7d David Ahern         2019-04-23  5754  				     &nh_flags, false) < 0)
beb1afac518dec David Ahern         2017-02-02  5755  			goto nla_put_failure;
ecc5663cce8c7d David Ahern         2019-04-23  5756  
ecc5663cce8c7d David Ahern         2019-04-23  5757  		rtm->rtm_flags |= nh_flags;
beb1afac518dec David Ahern         2017-02-02  5758  	}
beb1afac518dec David Ahern         2017-02-02  5759  
22d0bd82cc7cec Xin Long            2018-09-11  5760  	if (rt6_flags & RTF_EXPIRES) {
14895687d36805 David Ahern         2018-04-17  5761  		expires = dst ? dst->expires : rt->expires;
14895687d36805 David Ahern         2018-04-17  5762  		expires -= jiffies;
14895687d36805 David Ahern         2018-04-17  5763  	}
69cdf8f92a8dd1 YOSHIFUJI Hideaki   2008-05-19  5764  
bb3c4ab93e4478 Ido Schimmel        2020-01-14  5765  	if (!dst) {
d95d6320ba7a51 Eric Dumazet        2022-02-16  5766  		if (READ_ONCE(rt->offload))
bb3c4ab93e4478 Ido Schimmel        2020-01-14  5767  			rtm->rtm_flags |= RTM_F_OFFLOAD;
d95d6320ba7a51 Eric Dumazet        2022-02-16  5768  		if (READ_ONCE(rt->trap))
bb3c4ab93e4478 Ido Schimmel        2020-01-14  5769  			rtm->rtm_flags |= RTM_F_TRAP;
d95d6320ba7a51 Eric Dumazet        2022-02-16  5770  		if (READ_ONCE(rt->offload_failed))
0c5fcf9e249ee1 Amit Cohen          2021-02-07  5771  			rtm->rtm_flags |= RTM_F_OFFLOAD_FAILED;
bb3c4ab93e4478 Ido Schimmel        2020-01-14  5772  	}
bb3c4ab93e4478 Ido Schimmel        2020-01-14  5773  
d4ead6b34b67fd David Ahern         2018-04-17  5774  	if (rtnl_put_cacheinfo(skb, dst, 0, expires, dst ? dst->error : 0) < 0)
e3703b3de1f049 Thomas Graf         2006-11-27  5775  		goto nla_put_failure;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5776  
22d0bd82cc7cec Xin Long            2018-09-11  5777  	if (nla_put_u8(skb, RTA_PREF, IPV6_EXTRACT_PREF(rt6_flags)))
c78ba6d64c7863 Lubomir Rintel      2015-03-11  5778  		goto nla_put_failure;
c78ba6d64c7863 Lubomir Rintel      2015-03-11  5779  
19e42e45150672 Roopa Prabhu        2015-07-21  5780  
053c095a82cf77 Johannes Berg       2015-01-16  5781  	nlmsg_end(skb, nlh);
053c095a82cf77 Johannes Berg       2015-01-16  5782  	return 0;
2d7202bfdd2868 Thomas Graf         2006-08-22  5783  
2d7202bfdd2868 Thomas Graf         2006-08-22  5784  nla_put_failure:
26932566a42d46 Patrick McHardy     2007-01-31  5785  	nlmsg_cancel(skb, nlh);
26932566a42d46 Patrick McHardy     2007-01-31  5786  	return -EMSGSIZE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5787  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  5788  

:::::: The code at line 5712 was first introduced by commit
:::::: 22d0bd82cc7cec7d9ed4bd5913f3ab65643364be ipv6: use rt6_info members when dst is set in rt6_fill_node

:::::: TO: Xin Long <lucien.xin@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
