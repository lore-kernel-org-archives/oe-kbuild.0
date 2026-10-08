Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386043B1035
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446258; cv=none; b=nb/NHBuqhHe901ERzlWtbLJfHLEMjr4LOVIrNXHO0n68ZjFx2G2KWnyzPDvY4YJv4xH+A5COoJsNWewU+HiDZtr8pvgtTWtoxAClSlJRNXfP6WnRF89vcH5NR+BpA9R5pIMktDTy8BW6sTjKztm4lJxYIoCzl2ogwoD6AdyKf+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446258; c=relaxed/simple;
	bh=9o64rDywpDR172zrLqB19gh2PqDOqo1rJCm/tejc8xo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZcgOjxCi12AIMTAD6CbDYNR8bfJuFlv9GAo16X+kGXPEVTn75t7l0IQ8btdA73Me+cE/RmDtnuHzwyc/LQ9bp53PiOMmG4fHV0iTBPT0Bpk+qe+T9oDrylBtToDq2fbIg/pT/l0dH5mvH8tVE7Uszva4yjEKwihDtAOdSTvaVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIZnKHcK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIZnKHcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791446257; x=1822982257;
  h=date:from:to:cc:subject:message-id;
  bh=9o64rDywpDR172zrLqB19gh2PqDOqo1rJCm/tejc8xo=;
  b=JIZnKHcKiEx2I77Uy/yIEXps9OpIVG8gA1zrLDskNxn/qWupNb78Ah95
   Hrlky23mr7//Ozi2IdkM+15EJaN/j3AMLWbvbp4eXuQE4aqXyBL39vnbN
   udBV4WiboJsgTy+v9BklvKFQiNEWJbdfmckl7p9NBw+m7oMPnIjspT5Bx
   ASSNo1G1MRzfC4fuUFp5tZVRXPHy1iHL3bdhX3AtOxxjG6L0gUeT27dFy
   cZI+1ICXrCgazdbtd3pu19cq1zg/2u2hFTmjyKCmlIjW82ZfL9SBQ3dGm
   JWjTL48MGmsmCFH+5WUPrp6nCI8nGrLFXhZr35pRSPlxytQlAscKjSQSP
   Q==;
X-CSE-ConnectionGUID: iOyClztgTYOGTi0Tpgn/qw==
X-CSE-MsgGUID: cxxuxyt1Qxu5EhRbscMlVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="124967"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="124967"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:57:36 -0700
X-CSE-ConnectionGUID: QsD7C4TySdaCdUQP5I8BMg==
X-CSE-MsgGUID: dK7OzvcOQgq/9i+Zjc6PCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1793369"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 08 Oct 2026 00:57:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEixR-0000000054a-4BBF;
	Thu, 08 Oct 2026 07:54:30 +0000
Date: Thu, 08 Oct 2026 09:53:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv4/icmp_ipv4.c:495 icmp_route_lookup() warn: passing
 zero to 'ERR_PTR'
Message-ID: <202610080913.VU6YyNR8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fernando Fernandez Mancera <fmancera@suse.de>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/ipv4-introduce-CONFIG_IPV4-to-decouple-the-IPv4-stack/20260930-155244
head:   2f5320cab6ec71a709d940eb2e33b5492af479ff
commit: 5b77f15402f22f182d690f04e16ba250049d2fe4 ipv4: icmp: split IPv4 specific logic into icmp_ipv4.c
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-2200-20261005 (https://download.01.org/0day-ci/archive/20261008/202610080913.VU6YyNR8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080913.VU6YyNR8-lkp@intel.com/

smatch warnings:
net/ipv4/icmp_ipv4.c:495 icmp_route_lookup() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +495 net/ipv4/icmp_ipv4.c

5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  364  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  365  static struct rtable *icmp_route_lookup(struct net *net, struct flowi4 *fl4,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  366  					struct sk_buff *skb_in,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  367  					const struct iphdr *iph, __be32 saddr,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  368  					dscp_t dscp, u32 mark, int type,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  369  					int code, struct icmp_bxm *param)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  370  {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  371  	struct net_device *route_lookup_dev;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  372  	struct dst_entry *dst, *dst2;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  373  	struct rtable *rt, *rt2;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  374  	struct flowi4 fl4_dec;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  375  	int err;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  376  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  377  	memset(fl4, 0, sizeof(*fl4));
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  378  	fl4->daddr = (param->replyopts.opt.srr ?
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  379  		      param->replyopts.opt.faddr : iph->saddr);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  380  	fl4->saddr = saddr;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  381  	fl4->flowi4_mark = mark;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  382  	fl4->flowi4_uid = sock_net_uid(net, NULL);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  383  	fl4->flowi4_dscp = dscp;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  384  	fl4->flowi4_proto = IPPROTO_ICMP;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  385  	fl4->fl4_icmp_type = type;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  386  	fl4->fl4_icmp_code = code;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  387  	route_lookup_dev = icmp_get_route_lookup_dev(skb_in);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  388  	fl4->flowi4_oif = l3mdev_master_ifindex(route_lookup_dev);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  389  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  390  	security_skb_classify_flow(skb_in, flowi4_to_flowi_common(fl4));
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  391  	rt = ip_route_output_key_hash(net, fl4, skb_in);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  392  	if (IS_ERR(rt))
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  393  		return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  394  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  395  	/* No need to clone since we're just using its address. */
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  396  	rt2 = rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  397  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  398  	dst = xfrm_lookup(net, &rt->dst,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  399  			  flowi4_to_flowi(fl4), NULL, 0);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  400  	rt = dst_rtable(dst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  401  	if (!IS_ERR(dst)) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  402  		if (rt != rt2)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  403  			return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  404  		if (inet_addr_type_dev_table(net, route_lookup_dev,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  405  					     fl4->daddr) == RTN_LOCAL)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  406  			return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  407  	} else if (PTR_ERR(dst) == -EPERM) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  408  		rt = NULL;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  409  	} else {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  410  		return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  411  	}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  412  	err = xfrm_decode_session_reverse(net, skb_in, flowi4_to_flowi(&fl4_dec), AF_INET);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  413  	if (err)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  414  		goto relookup_failed;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  415  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  416  	if (inet_addr_type_dev_table(net, route_lookup_dev,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  417  				     fl4_dec.saddr) == RTN_LOCAL) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  418  		rt2 = __ip_route_output_key(net, &fl4_dec);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  419  		if (IS_ERR(rt2))
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  420  			err = PTR_ERR(rt2);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  421  	} else {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  422  		struct flowi4 fl4_2 = fl4_dec;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  423  		unsigned long orefdst;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  424  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  425  		swap(fl4_2.daddr, fl4_2.saddr);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  426  		switch (fl4_2.flowi4_proto) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  427  		case IPPROTO_TCP:
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  428  		case IPPROTO_UDP:
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  429  		case IPPROTO_SCTP:
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  430  		case IPPROTO_DCCP:
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  431  			swap(fl4_2.fl4_sport, fl4_2.fl4_dport);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  432  			break;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  433  		}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  434  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  435  		fl4_2.flowi4_oif = l3mdev_master_ifindex(route_lookup_dev);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  436  		fl4_2.flowi4_flags |= FLOWI_FLAG_ANYSRC;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  437  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  438  		rt2 = __ip_route_output_key(net, &fl4_2);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  439  		if (IS_ERR(rt2)) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  440  			err = PTR_ERR(rt2);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  441  			goto relookup_failed;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  442  		}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  443  		/* Ugh! */
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  444  		orefdst = skb_dstref_steal(skb_in);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  445  		err = ip_route_input(skb_in, fl4_dec.daddr, fl4_dec.saddr,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  446  				     dscp, rt2->dst.dev) ? -EINVAL : 0;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  447  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  448  		dst_release(&rt2->dst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  449  		rt2 = skb_rtable(skb_in);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  450  		/* steal dst entry from skb_in, don't drop refcnt */
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  451  		skb_dstref_steal(skb_in);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  452  		skb_dstref_restore(skb_in, orefdst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  453  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  454  		/*
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  455  		 * fl4_dec.daddr is not expected to be local here, but it can be
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  456  		 * added to an interface concurrently, in which case
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  457  		 * ip_route_input() returns a LOCAL route. It can also fail to
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  458  		 * build a forwarding route towards fl4_dec.daddr, for example,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  459  		 * when forwarding is disabled, and return an UNREACHABLE route.
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  460  		 * Both cases will result in a route with dst.output=ip_rt_bug,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  461  		 * which must not be used for output.
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  462  		 */
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  463  		if (!err && rt2 && rt2->rt_type == RTN_LOCAL)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  464  			net_warn_ratelimited("detected local route for %pI4 during ICMP sending, src %pI4\n",
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  465  					     &fl4_dec.daddr, &fl4_dec.saddr);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  466  		if (!err && rt2 &&
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  467  		    (rt2->rt_type == RTN_LOCAL || rt2->rt_type == RTN_UNREACHABLE)) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  468  			dst_release(&rt2->dst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  469  			err = -EINVAL;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  470  		}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  471  	}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  472  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  473  	if (err)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  474  		goto relookup_failed;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  475  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  476  	dst2 = xfrm_lookup(net, &rt2->dst, flowi4_to_flowi(&fl4_dec), NULL,
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  477  			   XFRM_LOOKUP_ICMP);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  478  	rt2 = dst_rtable(dst2);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  479  	if (!IS_ERR(dst2)) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  480  		dst_release(&rt->dst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  481  		rt = rt2;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  482  	} else if (PTR_ERR(dst2) == -EPERM) {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  483  		if (rt)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  484  			dst_release(&rt->dst);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  485  		return rt2;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  486  	} else {
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  487  		err = PTR_ERR(dst2);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  488  		goto relookup_failed;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  489  	}
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  490  	return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  491  
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  492  relookup_failed:
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  493  	if (rt)
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  494  		return rt;
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30 @495  	return ERR_PTR(err);
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  496  }
5b77f15402f22f Fernando Fernandez Mancera 2026-09-30  497  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
