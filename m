Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F891419A2
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490459; cv=none; b=BNCnNDb1qx7T4VfYnrVWOO2VeUre+77Uo1wgfSEsHH4gOULDbzNVRMDHCxp+L+To37VX2J7Y7irK05lbgzbjZencmxwSArIYbc34G0Ow02sGPs9hzSf/ks67L3NlNz1SMV3oo/vhLIEPpA1q9RW0WzYZNUhiYTBewioDQ7MYyto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490459; c=relaxed/simple;
	bh=e+PQOqhKOSc/OPCiRr25R3AFvdOluDDlkXnXjeCRx1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nK4/2VWs7ECfGGiNm8Q0xiIk3zdZYztxHZ1VBOtbDEhgTo6B84oBqiyDce3JeqiXRXgPsQevM7xpubZ6WanqIKWERdKgn8/YeSaMXEHO7ATN3o7SvuZMhq2JPlxPoP236KWb6fOnRBdwOamK/DK6UsH2Ul9zCH98lHS8i0NIC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6NcewtS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6NcewtS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a85cc2d96so256300a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 04 Jun 2024 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717490455; x=1718095255; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6iFoeImSywzjNrx5dKqSvs17TqFbADjndDo9jCtnrSI=;
        b=d6NcewtS7+Ocjoqp8avp4qBOsyA6zouGRleKXHAdD4XfdVEzshFXfKYHxqUKCfWi80
         djIyUdBts0xI/1/dPCuoDNnq03IWHa1fAANbqzkuxd8fKlZyommSasP3bR3rOFPuyb08
         Faw02M5rgD8cuneimolfA4jHsGg84oIgE0t6ywSMvxaORrpgnwK8BD02NkBszRXbkjZy
         BhT+rjGIZPXzIj8VV8Dy/2h8kl/Jl/5GAhuKttelXWbef994x7XnKAkT+VH4a8AiFds4
         VzVG7tQ22Csn+8RwHHeNN/Qvo410xJCCVUBzinWlDQxB9zoj5IIVF14c9vy2gHL2cKXn
         V6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717490455; x=1718095255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6iFoeImSywzjNrx5dKqSvs17TqFbADjndDo9jCtnrSI=;
        b=N0odoAwyiQkeIGfw+rIKCBtI8jEZhsE2aUoZeElnZi8Bs7kqC5AzvczjYy0womJRt+
         cQRH/llKbQyWn4Ak0AoBdcdHJU5DffPJWkcDmthDBm6xPv3i9h40KwuV3/Q6opcyZmLA
         lknA7XzPPiBErfuHBqbK5gSwWvme2JAjUvVd9DFx0nNokvVIrf86h6ryUQQ7RweSzAh2
         HB2mwjqG8jXwXycAZE7dT2fcaEW+H1MhbWXf/Ez30Ofp+kej6AHNswMl68fmNDq5u7yw
         o/ppOz1/qfmXgY/+u4aZ26/EiiiL/RUgpyWKiNT8tGrqLL3Wlm9xc9O8aX4ibIRU0/LD
         SqEA==
X-Gm-Message-State: AOJu0YxlXb5Pv64JLJwfb3HNY73cLrMsy/3lVssIOeE57YlTvfzUDOiD
	XRmXsiMMNgin8kXijEefakYBUOOgtHot1pX18dN6UjcwVmHIUy9GTJHifQS5iliH89qTkR4Y3Xp
	w
X-Google-Smtp-Source: AGHT+IEeQvq8qLjdpCEErWKW5EnckZPPxwzF+DD7LxNXcsws4eCLS6HCdjuN9R4k9qB3f1XJBdyypA==
X-Received: by 2002:a50:d757:0:b0:57a:859e:4d81 with SMTP id 4fb4d7f45d1cf-57a859e4ef8mr334062a12.28.1717490454507;
        Tue, 04 Jun 2024 01:40:54 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a468ebb00sm5787129a12.52.2024.06.04.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:40:54 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:40:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yan Zhai <yan@cloudflare.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 5/6] udp: pass rx socket on rcv drops
Message-ID: <eccf0c62-73e1-4acd-a523-c519eb80d484@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64c8339aa96232b5d36738162e7bf58412bf6682.1717105215.git.yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-kfree_skb_for_sk-function/20240531-055120
base:   net-next/main
patch link:    https://lore.kernel.org/r/64c8339aa96232b5d36738162e7bf58412bf6682.1717105215.git.yan%40cloudflare.com
patch subject: [RFC net-next 5/6] udp: pass rx socket on rcv drops
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011751.NpVN0sSk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406011751.NpVN0sSk-lkp@intel.com/

New smatch warnings:
net/ipv6/udp.c:1057 __udp6_lib_rcv() error: uninitialized symbol 'sk'.
net/ipv4/udp.c:2488 __udp4_lib_rcv() error: uninitialized symbol 'sk'.

vim +/sk +1057 net/ipv6/udp.c

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

sk uninitialized

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
                                                                                      ^^

add459aa1afe05 Stephen Hemminger        2007-03-08  1058  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1059  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

