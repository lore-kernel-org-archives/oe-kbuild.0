Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2002D61B
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717234637; cv=none; b=tOKgZdjvN8CC7ccynapXPSHChzOpWX7EcqJFXIP8UBZNcIjz+4zd+4fEhf+pNJudUZxaxpBKoCYcU0IYQ3DDAOm+SOiZiZW2aeO1yTtce1wwa756CJjha23Kx3PEWyGCT37RE3WA7kJU7aRNvI+iUrY3H1772pBwDjtdUrv5v6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717234637; c=relaxed/simple;
	bh=QwGXmKU2epvfHTV3H7vCVA0rTGLLeas2H3pfBXMaEjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7LviBEx42glgedFuW/PusWzQPkWv+meJVhr15+0dFg7mbXu+a6H2XswuKFMu1sorUHOVh7BOQNisyXltn3q4V8JffnitFX7h+il2IKBlIdnZyoRZRdaWuPFu5eo6Cjl7Ni9OrWy3NckR8Q50PhG/mava5X8sRQYPnKbpw110G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmNYkiw3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmNYkiw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717234635; x=1748770635;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QwGXmKU2epvfHTV3H7vCVA0rTGLLeas2H3pfBXMaEjw=;
  b=cmNYkiw3t97rC1M/2eR+4W+aeN3q+5xqL45hzXHdNELjY83pXnuD43X2
   tiQWRhF3rZX3YOYCmKvl71l2G1WJfWliCOvnwA7KC/bZ/e83H0w1aDqUz
   fLT2j7r6lABorHuHbdDzQlAFEp78ct8I08AiTXPGluLstDNh10biA9RuU
   4ha4z2snfLPW6f38IyqXpBLwaE7o25JCdEthaRqrhKYcuUjNDzcL0Uopl
   bOnVpVZ7i2CrnCChiI55TNoVLZEwykPei//jnXTzo4YsPdzODc0SV6MJA
   N6q/WNRKJzK6ybPpSOboCgJT6mC+dAdNxRvpbQFyKB+VmkzbIozdp90QN
   w==;
X-CSE-ConnectionGUID: cxSfCI2FS++4EQ8BSZ42bw==
X-CSE-MsgGUID: TmwJxbt0TPqoJpLEtb4jGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17629979"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="17629979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 02:37:15 -0700
X-CSE-ConnectionGUID: c9A75J2+S96sv1HNj+6REQ==
X-CSE-MsgGUID: NBvMNmf+RzW5/kymMPT91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36406178"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jun 2024 02:37:13 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDLAl-000Id1-0M;
	Sat, 01 Jun 2024 09:37:11 +0000
Date: Sat, 1 Jun 2024 17:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC net-next 5/6] udp: pass rx socket on rcv drops
Message-ID: <202406011751.NpVN0sSk-lkp@intel.com>
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
In-Reply-To: <64c8339aa96232b5d36738162e7bf58412bf6682.1717105215.git.yan@cloudflare.com>
References: <64c8339aa96232b5d36738162e7bf58412bf6682.1717105215.git.yan@cloudflare.com>
TO: Yan Zhai <yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-kfree_skb_for_sk-function/20240531-055120
base:   net-next/main
patch link:    https://lore.kernel.org/r/64c8339aa96232b5d36738162e7bf58412bf6682.1717105215.git.yan%40cloudflare.com
patch subject: [RFC net-next 5/6] udp: pass rx socket on rcv drops
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011751.NpVN0sSk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406011751.NpVN0sSk-lkp@intel.com/

New smatch warnings:
net/ipv6/udp.c:1057 __udp6_lib_rcv() error: uninitialized symbol 'sk'.
net/ipv4/udp.c:2488 __udp4_lib_rcv() error: uninitialized symbol 'sk'.

Old smatch warnings:
net/ipv6/udp.c:234 __udp6_lib_lookup() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv6/udp.c:863 __udp6_lib_mcast_deliver() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv6/udp.c:1076 __udp6_lib_demux_lookup() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:492 __udp4_lib_lookup() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:2267 __udp4_lib_mcast_deliver() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:2507 __udp4_lib_mcast_demux_lookup() warn: potential spectre issue 'udptable->hash' [r]
net/ipv4/udp.c:2545 __udp4_lib_demux_lookup() warn: potential spectre issue 'udptable->hash2' [r]

vim +/sk +1057 net/ipv6/udp.c

eb63f2964dbe36 Paolo Abeni              2018-09-13   936  
645ca708f936b2 Eric Dumazet             2008-10-29   937  int __udp6_lib_rcv(struct sk_buff *skb, struct udp_table *udptable,
759e5d006462d5 Herbert Xu               2007-03-25   938  		   int proto)
^1da177e4c3f41 Linus Torvalds           2005-04-16   939  {
4cf91f825b2777 David Ahern              2022-02-11   940  	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
ca065d0cf80fa5 Eric Dumazet             2016-04-01   941  	const struct in6_addr *saddr, *daddr;
3ffe533c87281b Alexey Dobriyan          2010-02-18   942  	struct net *net = dev_net(skb->dev);
^1da177e4c3f41 Linus Torvalds           2005-04-16   943  	struct udphdr *uh;
ca065d0cf80fa5 Eric Dumazet             2016-04-01   944  	struct sock *sk;
71489e21d720a0 Joe Stringer             2020-03-29   945  	bool refcounted;
^1da177e4c3f41 Linus Torvalds           2005-04-16   946  	u32 ulen = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16   947  
^1da177e4c3f41 Linus Torvalds           2005-04-16   948  	if (!pskb_may_pull(skb, sizeof(struct udphdr)))
d6bc0149d8f230 Bjørn Mork               2010-05-06   949  		goto discard;
^1da177e4c3f41 Linus Torvalds           2005-04-16   950  
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25   951  	saddr = &ipv6_hdr(skb)->saddr;
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25   952  	daddr = &ipv6_hdr(skb)->daddr;
4bedb45203eab9 Arnaldo Carvalho de Melo 2007-03-13   953  	uh = udp_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16   954  
^1da177e4c3f41 Linus Torvalds           2005-04-16   955  	ulen = ntohs(uh->len);
ba4e58eca8aa94 Gerrit Renker            2006-11-27   956  	if (ulen > skb->len)
ba4e58eca8aa94 Gerrit Renker            2006-11-27   957  		goto short_packet;
ba4e58eca8aa94 Gerrit Renker            2006-11-27   958  
759e5d006462d5 Herbert Xu               2007-03-25   959  	if (proto == IPPROTO_UDP) {
759e5d006462d5 Herbert Xu               2007-03-25   960  		/* UDP validates ulen. */
^1da177e4c3f41 Linus Torvalds           2005-04-16   961  
^1da177e4c3f41 Linus Torvalds           2005-04-16   962  		/* Check for jumbo payload */
^1da177e4c3f41 Linus Torvalds           2005-04-16   963  		if (ulen == 0)
^1da177e4c3f41 Linus Torvalds           2005-04-16   964  			ulen = skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16   965  
ba4e58eca8aa94 Gerrit Renker            2006-11-27   966  		if (ulen < sizeof(*uh))
^1da177e4c3f41 Linus Torvalds           2005-04-16   967  			goto short_packet;
^1da177e4c3f41 Linus Torvalds           2005-04-16   968  
^1da177e4c3f41 Linus Torvalds           2005-04-16   969  		if (ulen < skb->len) {
42ca89c18b75e1 Stephen Hemminger        2005-09-08   970  			if (pskb_trim_rcsum(skb, ulen))
ba4e58eca8aa94 Gerrit Renker            2006-11-27   971  				goto short_packet;
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25   972  			saddr = &ipv6_hdr(skb)->saddr;
0660e03f6b18f1 Arnaldo Carvalho de Melo 2007-04-25   973  			daddr = &ipv6_hdr(skb)->daddr;
4bedb45203eab9 Arnaldo Carvalho de Melo 2007-03-13   974  			uh = udp_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16   975  		}
759e5d006462d5 Herbert Xu               2007-03-25   976  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16   977  
759e5d006462d5 Herbert Xu               2007-03-25   978  	if (udp6_csum_init(skb, uh, proto))
6a5dc9e598fe90 Eric Dumazet             2013-04-29   979  		goto csum_error;
^1da177e4c3f41 Linus Torvalds           2005-04-16   980  
c9f2c1ae123a75 Paolo Abeni              2017-07-27   981  	/* Check if the socket is already available, e.g. due to early demux */
9c02bec9595425 Lorenz Bauer             2023-07-20   982  	sk = inet6_steal_sock(net, skb, sizeof(struct udphdr), saddr, uh->source, daddr, uh->dest,
9c02bec9595425 Lorenz Bauer             2023-07-20   983  			      &refcounted, udp6_ehashfn);
9c02bec9595425 Lorenz Bauer             2023-07-20   984  	if (IS_ERR(sk))
9c02bec9595425 Lorenz Bauer             2023-07-20   985  		goto no_sk;
9c02bec9595425 Lorenz Bauer             2023-07-20   986  
c9f2c1ae123a75 Paolo Abeni              2017-07-27   987  	if (sk) {
c9f2c1ae123a75 Paolo Abeni              2017-07-27   988  		struct dst_entry *dst = skb_dst(skb);
c9f2c1ae123a75 Paolo Abeni              2017-07-27   989  		int ret;
c9f2c1ae123a75 Paolo Abeni              2017-07-27   990  
8f905c0e7354ef Eric Dumazet             2021-12-20   991  		if (unlikely(rcu_dereference(sk->sk_rx_dst) != dst))
64f0f5d18a47c7 Paolo Abeni              2017-08-25   992  			udp6_sk_rx_dst_set(sk, dst);
c9f2c1ae123a75 Paolo Abeni              2017-07-27   993  
bcbc1b1de88464 Eric Dumazet             2023-09-12   994  		if (!uh->check && !udp_get_no_check6_rx(sk)) {
71489e21d720a0 Joe Stringer             2020-03-29   995  			if (refcounted)
c9f2c1ae123a75 Paolo Abeni              2017-07-27   996  				sock_put(sk);
eb63f2964dbe36 Paolo Abeni              2018-09-13   997  			goto report_csum_error;
eb63f2964dbe36 Paolo Abeni              2018-09-13   998  		}
c9f2c1ae123a75 Paolo Abeni              2017-07-27   999  
eb63f2964dbe36 Paolo Abeni              2018-09-13  1000  		ret = udp6_unicast_rcv_skb(sk, skb, uh);
71489e21d720a0 Joe Stringer             2020-03-29  1001  		if (refcounted)
eb63f2964dbe36 Paolo Abeni              2018-09-13  1002  			sock_put(sk);
c9f2c1ae123a75 Paolo Abeni              2017-07-27  1003  		return ret;
c9f2c1ae123a75 Paolo Abeni              2017-07-27  1004  	}
c9f2c1ae123a75 Paolo Abeni              2017-07-27  1005  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1006  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1007  	 *	Multicast receive code
^1da177e4c3f41 Linus Torvalds           2005-04-16  1008  	 */
ba4e58eca8aa94 Gerrit Renker            2006-11-27  1009  	if (ipv6_addr_is_multicast(daddr))
e31634931d0008 Pavel Emelyanov          2008-06-16  1010  		return __udp6_lib_mcast_deliver(net, skb,
36cbb2452cbafc Rick Jones               2014-11-06  1011  				saddr, daddr, udptable, proto);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1012  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1013  	/* Unicast */
607c4aaf03041c KOVACS Krisztian         2008-10-07  1014  	sk = __udp6_lib_lookup_skb(skb, uh->source, uh->dest, udptable);
53b24b8f94cb15 Ian Morris               2015-03-29  1015  	if (sk) {
bcbc1b1de88464 Eric Dumazet             2023-09-12  1016  		if (!uh->check && !udp_get_no_check6_rx(sk))
eb63f2964dbe36 Paolo Abeni              2018-09-13  1017  			goto report_csum_error;
eb63f2964dbe36 Paolo Abeni              2018-09-13  1018  		return udp6_unicast_rcv_skb(sk, skb, uh);
cb80ef463d1881 Benjamin LaHaise         2012-04-27  1019  	}
9c02bec9595425 Lorenz Bauer             2023-07-20  1020  no_sk:
4cf91f825b2777 David Ahern              2022-02-11  1021  	reason = SKB_DROP_REASON_NO_SOCKET;
4cf91f825b2777 David Ahern              2022-02-11  1022  
eb63f2964dbe36 Paolo Abeni              2018-09-13  1023  	if (!uh->check)
eb63f2964dbe36 Paolo Abeni              2018-09-13  1024  		goto report_csum_error;
4068579e1e098f Tom Herbert              2014-05-02  1025  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1026  	if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1027  		goto discard;
b0e214d212030f Madhu Koriginja          2023-03-21  1028  	nf_reset_ct(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1029  
ba4e58eca8aa94 Gerrit Renker            2006-11-27  1030  	if (udp_lib_checksum_complete(skb))
6a5dc9e598fe90 Eric Dumazet             2013-04-29  1031  		goto csum_error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1032  
02c223470c3cc3 Eric Dumazet             2016-04-27  1033  	__UDP6_INC_STATS(net, UDP_MIB_NOPORTS, proto == IPPROTO_UDPLITE);
3ffe533c87281b Alexey Dobriyan          2010-02-18  1034  	icmpv6_send(skb, ICMPV6_DEST_UNREACH, ICMPV6_PORT_UNREACH, 0);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1035  
4cf91f825b2777 David Ahern              2022-02-11  1036  	kfree_skb_reason(skb, reason);
add459aa1afe05 Stephen Hemminger        2007-03-08  1037  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1038  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1039  short_packet:
4cf91f825b2777 David Ahern              2022-02-11  1040  	if (reason == SKB_DROP_REASON_NOT_SPECIFIED)
4cf91f825b2777 David Ahern              2022-02-11  1041  		reason = SKB_DROP_REASON_PKT_TOO_SMALL;
ba7a46f16dd29f Joe Perches              2014-11-11  1042  	net_dbg_ratelimited("UDP%sv6: short packet: From [%pI6c]:%u %d/%d to [%pI6c]:%u\n",
db8dac20d51993 David S. Miller          2008-03-06  1043  			    proto == IPPROTO_UDPLITE ? "-Lite" : "",
ba7a46f16dd29f Joe Perches              2014-11-11  1044  			    saddr, ntohs(uh->source),
ba7a46f16dd29f Joe Perches              2014-11-11  1045  			    ulen, skb->len,
ba7a46f16dd29f Joe Perches              2014-11-11  1046  			    daddr, ntohs(uh->dest));
6a5dc9e598fe90 Eric Dumazet             2013-04-29  1047  	goto discard;
eb63f2964dbe36 Paolo Abeni              2018-09-13  1048  
eb63f2964dbe36 Paolo Abeni              2018-09-13  1049  report_csum_error:
eb63f2964dbe36 Paolo Abeni              2018-09-13  1050  	udp6_csum_zero_error(skb);
6a5dc9e598fe90 Eric Dumazet             2013-04-29  1051  csum_error:
4cf91f825b2777 David Ahern              2022-02-11  1052  	if (reason == SKB_DROP_REASON_NOT_SPECIFIED)
4cf91f825b2777 David Ahern              2022-02-11  1053  		reason = SKB_DROP_REASON_UDP_CSUM;
02c223470c3cc3 Eric Dumazet             2016-04-27  1054  	__UDP6_INC_STATS(net, UDP_MIB_CSUMERRORS, proto == IPPROTO_UDPLITE);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1055  discard:
02c223470c3cc3 Eric Dumazet             2016-04-27  1056  	__UDP6_INC_STATS(net, UDP_MIB_INERRORS, proto == IPPROTO_UDPLITE);
f0a552b29db7b1 Yan Zhai                 2024-05-30 @1057  	kfree_skb_for_sk(skb, sk, reason);
add459aa1afe05 Stephen Hemminger        2007-03-08  1058  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1059  }
ba4e58eca8aa94 Gerrit Renker            2006-11-27  1060  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
