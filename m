Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8981DA2F7
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456382; cv=none; b=fnXOcx2yFKLCQOBnvfagF4G/wnaO9xql2bEsLawSq1tkQxFZv+VH2JM0bR8RzgAL+uChyRyhAvhxasrFEv+X2qAZlTlyRAJsMQMz7QdAdG+Jn36KAAD4QuEJ4eCXYEEuEhpASSm/BOs1ACb2+nSDUOjDjCiYXjMeOir2s0Px1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456382; c=relaxed/simple;
	bh=ruzFTITGUP6Vk064ABkvYNqdqpfEGw6HOsrMbZV0XHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDaHm/gPghewY7Dbfe4MgE1othnwDHstfqV1aT0sURNNcqY2yPBvwCbuOY7hZsNWr6HED8P+Ar6ouQXvXUEl0T1Wa9m4VIJt3BAx7wGp2Scbw2iLo3cjkIBvfJrto6/Wp61dUS8bvD+K0nvx+hWWsMHZsMMO2eiS4RD3DGidv6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4Fb7QDZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4Fb7QDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725456380; x=1756992380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ruzFTITGUP6Vk064ABkvYNqdqpfEGw6HOsrMbZV0XHw=;
  b=N4Fb7QDZg+eGpCZyn/q4qSwYtFT7/ZHy5MhJhxGcLzTQ1uFqc28E5St8
   y86j40qRBLLZRhdpGlPgUggzNZDjnfb1EyUWOBheIrY55lOq6zuuyejBe
   V1bglr5/ajQ9yZKwMjgFy85iRR8biKXEhR8YRO1zGh5N0FQMz4HiRhQeF
   +xMXY/Ta5XNn5RWbsiZej1YBTU+8W5X9TKiwN128DeSHnarE9lHkJ6viv
   nx5rWgY0riDAlgN/RUn7hx/PN/s0zU9YJL/jjUE9jYiiA2VvuvqUlSRN7
   gSo0oYFqn4jPWBw+QSMra0E50bl6ZcWSL8RD0inNs5eIQQrryHsBHR+eH
   A==;
X-CSE-ConnectionGUID: BpkJFDsNQzai/anOPsEI1A==
X-CSE-MsgGUID: +kyf/+feS9m970ru1NVkYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24226173"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24226173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:26:19 -0700
X-CSE-ConnectionGUID: /+LwZ4kZS26BVJKOcz8bQw==
X-CSE-MsgGUID: K/BKW3D7Sb+AAXeXuHC1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="69434675"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2024 06:26:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slq1X-000877-2K;
	Wed, 04 Sep 2024 13:26:15 +0000
Date: Wed, 4 Sep 2024 21:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net_tstamp: add SCM_TS_OPT_ID to provide
 OPT_ID in control message
Message-ID: <202409042149.JShdkgQr-lkp@intel.com>
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
In-Reply-To: <20240902130937.457115-1-vadfed@meta.com>
References: <20240902130937.457115-1-vadfed@meta.com>
TO: Vadim Fedorenko <vadfed@meta.com>
TO: Vadim Fedorenko <vadim.fedorenko@linux.dev>
TO: Willem de Bruijn <willemb@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: David Ahern <dsahern@kernel.org>
TO: Jason Xing <kerneljasonxing@gmail.com>
CC: netdev@vger.kernel.org

Hi Vadim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/selftests-txtimestamp-add-SCM_TS_OPT_ID-test/20240902-212008
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240902130937.457115-1-vadfed%40meta.com
patch subject: [PATCH net-next v2 1/2] net_tstamp: add SCM_TS_OPT_ID to provide OPT_ID in control message
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042149.JShdkgQr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409042149.JShdkgQr-lkp@intel.com/

smatch warnings:
net/ipv6/ip6_output.c:1815 __ip6_append_data() error: uninitialized symbol 'hold_tskey'.

vim +/hold_tskey +1815 net/ipv6/ip6_output.c

366e41d9774d70 Vlad Yasevich            2015-01-31  1414  
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1415  static int __ip6_append_data(struct sock *sk,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1416  			     struct sk_buff_head *queue,
f3b46a3e8c4030 Pavel Begunkov           2022-01-27  1417  			     struct inet_cork_full *cork_full,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1418  			     struct inet6_cork *v6_cork,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1419  			     struct page_frag *pfrag,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1420  			     int getfrag(void *from, char *to, int offset,
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1421  					 int len, int odd, struct sk_buff *skb),
f93431c86b631b Wang Yufen               2022-06-07  1422  			     void *from, size_t length, int transhdrlen,
5fdaa88dfefa87 Willem de Bruijn         2018-07-06  1423  			     unsigned int flags, struct ipcm6_cookie *ipc6)
366e41d9774d70 Vlad Yasevich            2015-01-31  1424  {
366e41d9774d70 Vlad Yasevich            2015-01-31  1425  	struct sk_buff *skb, *skb_prev = NULL;
f3b46a3e8c4030 Pavel Begunkov           2022-01-27  1426  	struct inet_cork *cork = &cork_full->base;
f37a4cc6bb0ba0 Pavel Begunkov           2022-01-27  1427  	struct flowi6 *fl6 = &cork_full->fl.u.ip6;
10b8a3de603df7 Paolo Abeni              2018-03-23  1428  	unsigned int maxfraglen, fragheaderlen, mtu, orig_mtu, pmtu;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1429  	struct ubuf_info *uarg = NULL;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1430  	int exthdrlen = 0;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1431  	int dst_exthdrlen = 0;
366e41d9774d70 Vlad Yasevich            2015-01-31  1432  	int hh_len;
366e41d9774d70 Vlad Yasevich            2015-01-31  1433  	int copy;
366e41d9774d70 Vlad Yasevich            2015-01-31  1434  	int err;
366e41d9774d70 Vlad Yasevich            2015-01-31  1435  	int offset = 0;
773ba4fe9104a6 Pavel Begunkov           2022-07-12  1436  	bool zc = false;
366e41d9774d70 Vlad Yasevich            2015-01-31  1437  	u32 tskey = 0;
e8dfd42c17faf1 Eric Dumazet             2024-04-26  1438  	struct rt6_info *rt = dst_rt6_info(cork->dst);
488b6d91b07112 Vadim Fedorenko          2024-02-13  1439  	bool paged, hold_tskey, extra_uref = false;
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1440  	struct ipv6_txoptions *opt = v6_cork->opt;
32dce968dd987a Vlad Yasevich            2015-01-31  1441  	int csummode = CHECKSUM_NONE;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1442  	unsigned int maxnonfragsize, headersize;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1443  	unsigned int wmem_alloc_delta = 0;
366e41d9774d70 Vlad Yasevich            2015-01-31  1444  
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1445  	skb = skb_peek_tail(queue);
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1446  	if (!skb) {
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1447  		exthdrlen = opt ? opt->opt_flen : 0;
7efdba5bd9a2f3 Romain KUNTZ             2013-01-16  1448  		dst_exthdrlen = rt->dst.header_len - rt->rt6i_nfheader_len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1449  	}
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1450  
15e36f5b8e982d Willem de Bruijn         2018-04-26  1451  	paged = !!cork->gso_size;
bec1f6f697362c Willem de Bruijn         2018-04-26  1452  	mtu = cork->gso_size ? IP6_MAX_MTU : cork->fragsize;
e367c2d03dba4c lucien                   2014-03-17  1453  	orig_mtu = mtu;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1454  
d8d1f30b95a635 Changli Gao              2010-06-10  1455  	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1456  
a1b051405bc162 Masahide NAKAMURA        2007-12-20  1457  	fragheaderlen = sizeof(struct ipv6hdr) + rt->rt6i_nfheader_len +
b4ce92775c2e7f Herbert Xu               2007-11-13  1458  			(opt ? opt->opt_nflen : 0);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1459  
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1460  	headersize = sizeof(struct ipv6hdr) +
3a1cebe7e05027 Hannes Frederic Sowa     2014-05-11  1461  		     (opt ? opt->opt_flen + opt->opt_nflen : 0) +
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1462  		     rt->rt6i_nfheader_len;
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1463  
5e34af4142ffe6 Tadeusz Struk            2022-03-10  1464  	if (mtu <= fragheaderlen ||
5e34af4142ffe6 Tadeusz Struk            2022-03-10  1465  	    ((mtu - fragheaderlen) & ~7) + fragheaderlen <= sizeof(struct frag_hdr))
6596a022954127 Jiri Bohac               2022-01-19  1466  		goto emsgsize;
6596a022954127 Jiri Bohac               2022-01-19  1467  
6596a022954127 Jiri Bohac               2022-01-19  1468  	maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen -
6596a022954127 Jiri Bohac               2022-01-19  1469  		     sizeof(struct frag_hdr);
6596a022954127 Jiri Bohac               2022-01-19  1470  
10b8a3de603df7 Paolo Abeni              2018-03-23  1471  	/* as per RFC 7112 section 5, the entire IPv6 Header Chain must fit
10b8a3de603df7 Paolo Abeni              2018-03-23  1472  	 * the first fragment
10b8a3de603df7 Paolo Abeni              2018-03-23  1473  	 */
10b8a3de603df7 Paolo Abeni              2018-03-23  1474  	if (headersize + transhdrlen > mtu)
10b8a3de603df7 Paolo Abeni              2018-03-23  1475  		goto emsgsize;
10b8a3de603df7 Paolo Abeni              2018-03-23  1476  
26879da58711aa Wei Wang                 2016-05-02  1477  	if (cork->length + length > mtu - headersize && ipc6->dontfrag &&
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1478  	    (sk->sk_protocol == IPPROTO_UDP ||
13651224c00b74 Jakub Kicinski           2022-02-16  1479  	     sk->sk_protocol == IPPROTO_ICMPV6 ||
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1480  	     sk->sk_protocol == IPPROTO_RAW)) {
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1481  		ipv6_local_rxpmtu(sk, fl6, mtu - headersize +
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1482  				sizeof(struct ipv6hdr));
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1483  		goto emsgsize;
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1484  	}
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1485  
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1486  	if (ip6_sk_ignore_df(sk))
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1487  		maxnonfragsize = sizeof(struct ipv6hdr) + IPV6_MAXPLEN;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1488  	else
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1489  		maxnonfragsize = mtu;
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1490  
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1491  	if (cork->length + length > maxnonfragsize - headersize) {
4df98e76cde7c6 Hannes Frederic Sowa     2013-12-16  1492  emsgsize:
10b8a3de603df7 Paolo Abeni              2018-03-23  1493  		pmtu = max_t(int, mtu - headersize + sizeof(struct ipv6hdr), 0);
10b8a3de603df7 Paolo Abeni              2018-03-23  1494  		ipv6_local_error(sk, EMSGSIZE, fl6, pmtu);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1495  		return -EMSGSIZE;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1496  	}
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1497  
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1498  	/* CHECKSUM_PARTIAL only with no extension headers and when
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1499  	 * we are not going to fragment
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1500  	 */
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1501  	if (transhdrlen && sk->sk_protocol == IPPROTO_UDP &&
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1502  	    headersize == sizeof(struct ipv6hdr) &&
2b89ed65a6f201 Vlad Yasevich            2017-01-29  1503  	    length <= mtu - headersize &&
bec1f6f697362c Willem de Bruijn         2018-04-26  1504  	    (!(flags & MSG_MORE) || cork->gso_size) &&
c8cd0989bd151f Tom Herbert              2015-12-14  1505  	    rt->dst.dev->features & (NETIF_F_IPV6_CSUM | NETIF_F_HW_CSUM))
682b1a9d3f9686 Hannes Frederic Sowa     2015-10-27  1506  		csummode = CHECKSUM_PARTIAL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1507  
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1508  	if ((flags & MSG_ZEROCOPY) && length) {
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1509  		struct msghdr *msg = from;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1510  
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1511  		if (getfrag == ip_generic_getfrag && msg->msg_ubuf) {
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1512  			if (skb_zcopy(skb) && msg->msg_ubuf != skb_zcopy(skb))
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1513  				return -EINVAL;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1514  
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1515  			/* Leave uarg NULL if can't zerocopy, callers should
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1516  			 * be able to handle it.
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1517  			 */
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1518  			if ((rt->dst.dev->features & NETIF_F_SG) &&
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1519  			    csummode == CHECKSUM_PARTIAL) {
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1520  				paged = true;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1521  				zc = true;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1522  				uarg = msg->msg_ubuf;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1523  			}
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1524  		} else if (sock_flag(sk, SOCK_ZEROCOPY)) {
8c793822c5803e Jonathan Lemon           2021-01-06  1525  			uarg = msg_zerocopy_realloc(sk, length, skb_zcopy(skb));
b5947e5d1e710c Willem de Bruijn         2018-11-30  1526  			if (!uarg)
b5947e5d1e710c Willem de Bruijn         2018-11-30  1527  				return -ENOBUFS;
522924b583082f Willem de Bruijn         2019-06-07  1528  			extra_uref = !skb_zcopy(skb);	/* only ref on new uarg */
b5947e5d1e710c Willem de Bruijn         2018-11-30  1529  			if (rt->dst.dev->features & NETIF_F_SG &&
b5947e5d1e710c Willem de Bruijn         2018-11-30  1530  			    csummode == CHECKSUM_PARTIAL) {
b5947e5d1e710c Willem de Bruijn         2018-11-30  1531  				paged = true;
773ba4fe9104a6 Pavel Begunkov           2022-07-12  1532  				zc = true;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1533  			} else {
e7d2b510165fff Pavel Begunkov           2022-09-23  1534  				uarg_to_msgzc(uarg)->zerocopy = 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1535  				skb_zcopy_set(skb, uarg, &extra_uref);
b5947e5d1e710c Willem de Bruijn         2018-11-30  1536  			}
b5947e5d1e710c Willem de Bruijn         2018-11-30  1537  		}
6d8192bd69bb43 David Howells            2023-05-22  1538  	} else if ((flags & MSG_SPLICE_PAGES) && length) {
cafbe182a467bf Eric Dumazet             2023-08-16  1539  		if (inet_test_bit(HDRINCL, sk))
6d8192bd69bb43 David Howells            2023-05-22  1540  			return -EPERM;
5a6f6873606e03 David Howells            2023-06-14  1541  		if (rt->dst.dev->features & NETIF_F_SG &&
5a6f6873606e03 David Howells            2023-06-14  1542  		    getfrag == ip_generic_getfrag)
6d8192bd69bb43 David Howells            2023-05-22  1543  			/* We need an empty buffer to attach stuff to */
6d8192bd69bb43 David Howells            2023-05-22  1544  			paged = true;
6d8192bd69bb43 David Howells            2023-05-22  1545  		else
6d8192bd69bb43 David Howells            2023-05-22  1546  			flags &= ~MSG_SPLICE_PAGES;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1547  	}
b5947e5d1e710c Willem de Bruijn         2018-11-30  1548  
b7399073687728 Vadim Fedorenko          2024-09-02  1549  	if (cork->tx_flags & SKBTX_ANY_TSTAMP &&
b7399073687728 Vadim Fedorenko          2024-09-02  1550  	    READ_ONCE(sk->sk_tsflags) & SOF_TIMESTAMPING_OPT_ID) {
b7399073687728 Vadim Fedorenko          2024-09-02  1551  		if (cork->flags & IPCORK_TS_OPT_ID) {
b7399073687728 Vadim Fedorenko          2024-09-02  1552  			tskey = cork->ts_opt_id;
b7399073687728 Vadim Fedorenko          2024-09-02  1553  		} else {
488b6d91b07112 Vadim Fedorenko          2024-02-13  1554  			tskey = atomic_inc_return(&sk->sk_tskey) - 1;
b7399073687728 Vadim Fedorenko          2024-09-02  1555  			hold_tskey = true;
b7399073687728 Vadim Fedorenko          2024-09-02  1556  		}
b7399073687728 Vadim Fedorenko          2024-09-02  1557  	}
488b6d91b07112 Vadim Fedorenko          2024-02-13  1558  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1559  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1560  	 * Let's try using as much space as possible.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1561  	 * Use MTU if total length of the message fits into the MTU.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1562  	 * Otherwise, we need to reserve fragment header and
^1da177e4c3f41 Linus Torvalds           2005-04-16  1563  	 * fragment alignment (= 8-15 octects, in total).
^1da177e4c3f41 Linus Torvalds           2005-04-16  1564  	 *
634a63e73f0594 Randy Dunlap             2020-09-17  1565  	 * Note that we may need to "move" the data from the tail
^1da177e4c3f41 Linus Torvalds           2005-04-16  1566  	 * of the buffer to the new fragment when we split
^1da177e4c3f41 Linus Torvalds           2005-04-16  1567  	 * the message.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1568  	 *
^1da177e4c3f41 Linus Torvalds           2005-04-16  1569  	 * FIXME: It may be fragmented into multiple chunks
^1da177e4c3f41 Linus Torvalds           2005-04-16  1570  	 *        at once if non-fragmentable extension headers
^1da177e4c3f41 Linus Torvalds           2005-04-16  1571  	 *        are too large.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1572  	 * --yoshfuji
^1da177e4c3f41 Linus Torvalds           2005-04-16  1573  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1574  
2811ebac2521ce Hannes Frederic Sowa     2013-09-21  1575  	cork->length += length;
2811ebac2521ce Hannes Frederic Sowa     2013-09-21  1576  	if (!skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1577  		goto alloc_new_skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1578  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1579  	while (length > 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1580  		/* Check if the remaining data fits into current packet. */
e57a34478586fe Yan Zhai                 2023-10-24  1581  		copy = (cork->length <= mtu ? mtu : maxfraglen) - skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1582  		if (copy < length)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1583  			copy = maxfraglen - skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1584  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1585  		if (copy <= 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1586  			char *data;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1587  			unsigned int datalen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1588  			unsigned int fraglen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1589  			unsigned int fraggap;
6d123b81ac6150 Jakub Kicinski           2021-06-23  1590  			unsigned int alloclen, alloc_extra;
aba36930a35e7f Willem de Bruijn         2018-11-24  1591  			unsigned int pagedlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1592  alloc_new_skb:
^1da177e4c3f41 Linus Torvalds           2005-04-16  1593  			/* There's no room in the current skb */
0c1833797a5a6e Gao feng                 2012-05-26  1594  			if (skb)
0c1833797a5a6e Gao feng                 2012-05-26  1595  				fraggap = skb->len - maxfraglen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1596  			else
^1da177e4c3f41 Linus Torvalds           2005-04-16  1597  				fraggap = 0;
0c1833797a5a6e Gao feng                 2012-05-26  1598  			/* update mtu and maxfraglen if necessary */
63159f29be1df7 Ian Morris               2015-03-29  1599  			if (!skb || !skb_prev)
0c1833797a5a6e Gao feng                 2012-05-26  1600  				ip6_append_data_mtu(&mtu, &maxfraglen,
75a493e60ac4bb Hannes Frederic Sowa     2013-07-02  1601  						    fragheaderlen, skb, rt,
e367c2d03dba4c lucien                   2014-03-17  1602  						    orig_mtu);
0c1833797a5a6e Gao feng                 2012-05-26  1603  
0c1833797a5a6e Gao feng                 2012-05-26  1604  			skb_prev = skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1605  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1606  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1607  			 * If remaining data exceeds the mtu,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1608  			 * we know we need more fragment(s).
^1da177e4c3f41 Linus Torvalds           2005-04-16  1609  			 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1610  			datalen = length + fraggap;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1611  
e57a34478586fe Yan Zhai                 2023-10-24  1612  			if (datalen > (cork->length <= mtu ? mtu : maxfraglen) - fragheaderlen)
0c1833797a5a6e Gao feng                 2012-05-26  1613  				datalen = maxfraglen - fragheaderlen - rt->dst.trailer_len;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1614  			fraglen = datalen + fragheaderlen;
aba36930a35e7f Willem de Bruijn         2018-11-24  1615  			pagedlen = 0;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1616  
6d123b81ac6150 Jakub Kicinski           2021-06-23  1617  			alloc_extra = hh_len;
6d123b81ac6150 Jakub Kicinski           2021-06-23  1618  			alloc_extra += dst_exthdrlen;
6d123b81ac6150 Jakub Kicinski           2021-06-23  1619  			alloc_extra += rt->dst.trailer_len;
6d123b81ac6150 Jakub Kicinski           2021-06-23  1620  
6d123b81ac6150 Jakub Kicinski           2021-06-23  1621  			/* We just reserve space for fragment header.
6d123b81ac6150 Jakub Kicinski           2021-06-23  1622  			 * Note: this may be overallocation if the message
6d123b81ac6150 Jakub Kicinski           2021-06-23  1623  			 * (without MSG_MORE) fits into the MTU.
6d123b81ac6150 Jakub Kicinski           2021-06-23  1624  			 */
6d123b81ac6150 Jakub Kicinski           2021-06-23  1625  			alloc_extra += sizeof(struct frag_hdr);
6d123b81ac6150 Jakub Kicinski           2021-06-23  1626  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1627  			if ((flags & MSG_MORE) &&
d8d1f30b95a635 Changli Gao              2010-06-10  1628  			    !(rt->dst.dev->features&NETIF_F_SG))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1629  				alloclen = mtu;
6d123b81ac6150 Jakub Kicinski           2021-06-23  1630  			else if (!paged &&
6d123b81ac6150 Jakub Kicinski           2021-06-23  1631  				 (fraglen + alloc_extra < SKB_MAX_ALLOC ||
6d123b81ac6150 Jakub Kicinski           2021-06-23  1632  				  !(rt->dst.dev->features & NETIF_F_SG)))
15e36f5b8e982d Willem de Bruijn         2018-04-26  1633  				alloclen = fraglen;
47cf88993c9108 Pavel Begunkov           2022-08-25  1634  			else {
773ba4fe9104a6 Pavel Begunkov           2022-07-12  1635  				alloclen = fragheaderlen + transhdrlen;
773ba4fe9104a6 Pavel Begunkov           2022-07-12  1636  				pagedlen = datalen - transhdrlen;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1637  			}
6d123b81ac6150 Jakub Kicinski           2021-06-23  1638  			alloclen += alloc_extra;
299b0767642a65 Steffen Klassert         2011-10-11  1639  
0c1833797a5a6e Gao feng                 2012-05-26  1640  			if (datalen != length + fraggap) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1641  				/*
0c1833797a5a6e Gao feng                 2012-05-26  1642  				 * this is not the last fragment, the trailer
0c1833797a5a6e Gao feng                 2012-05-26  1643  				 * space is regarded as data space.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1644  				 */
0c1833797a5a6e Gao feng                 2012-05-26  1645  				datalen += rt->dst.trailer_len;
0c1833797a5a6e Gao feng                 2012-05-26  1646  			}
0c1833797a5a6e Gao feng                 2012-05-26  1647  
0c1833797a5a6e Gao feng                 2012-05-26  1648  			fraglen = datalen + fragheaderlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1649  
15e36f5b8e982d Willem de Bruijn         2018-04-26  1650  			copy = datalen - transhdrlen - fraggap - pagedlen;
ce650a1663354a David Howells            2023-08-02  1651  			/* [!] NOTE: copy may be negative if pagedlen>0
ce650a1663354a David Howells            2023-08-02  1652  			 * because then the equation may reduces to -fraggap.
ce650a1663354a David Howells            2023-08-02  1653  			 */
ce650a1663354a David Howells            2023-08-02  1654  			if (copy < 0 && !(flags & MSG_SPLICE_PAGES)) {
232cd35d0804cc Eric Dumazet             2017-05-19  1655  				err = -EINVAL;
232cd35d0804cc Eric Dumazet             2017-05-19  1656  				goto error;
232cd35d0804cc Eric Dumazet             2017-05-19  1657  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1658  			if (transhdrlen) {
6d123b81ac6150 Jakub Kicinski           2021-06-23  1659  				skb = sock_alloc_send_skb(sk, alloclen,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1660  						(flags & MSG_DONTWAIT), &err);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1661  			} else {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1662  				skb = NULL;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1663  				if (refcount_read(&sk->sk_wmem_alloc) + wmem_alloc_delta <=
^1da177e4c3f41 Linus Torvalds           2005-04-16  1664  				    2 * sk->sk_sndbuf)
6d123b81ac6150 Jakub Kicinski           2021-06-23  1665  					skb = alloc_skb(alloclen,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1666  							sk->sk_allocation);
63159f29be1df7 Ian Morris               2015-03-29  1667  				if (unlikely(!skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1668  					err = -ENOBUFS;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1669  			}
63159f29be1df7 Ian Morris               2015-03-29  1670  			if (!skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1671  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1672  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1673  			 *	Fill in the control structures
^1da177e4c3f41 Linus Torvalds           2005-04-16  1674  			 */
9c9c9ad5fae7e9 Hannes Frederic Sowa     2013-08-26  1675  			skb->protocol = htons(ETH_P_IPV6);
32dce968dd987a Vlad Yasevich            2015-01-31  1676  			skb->ip_summed = csummode;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1677  			skb->csum = 0;
1f85851e17b64c Gao feng                 2012-03-19  1678  			/* reserve for fragmentation and ipsec header */
1f85851e17b64c Gao feng                 2012-03-19  1679  			skb_reserve(skb, hh_len + sizeof(struct frag_hdr) +
1f85851e17b64c Gao feng                 2012-03-19  1680  				    dst_exthdrlen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1681  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1682  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1683  			 *	Find where to start putting bytes
^1da177e4c3f41 Linus Torvalds           2005-04-16  1684  			 */
15e36f5b8e982d Willem de Bruijn         2018-04-26  1685  			data = skb_put(skb, fraglen - pagedlen);
1f85851e17b64c Gao feng                 2012-03-19  1686  			skb_set_network_header(skb, exthdrlen);
1f85851e17b64c Gao feng                 2012-03-19  1687  			data += fragheaderlen;
b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  1688  			skb->transport_header = (skb->network_header +
b0e380b1d8a8e0 Arnaldo Carvalho de Melo 2007-04-10  1689  						 fragheaderlen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1690  			if (fraggap) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1691  				skb->csum = skb_copy_and_csum_bits(
^1da177e4c3f41 Linus Torvalds           2005-04-16  1692  					skb_prev, maxfraglen,
8d5930dfb7edbf Al Viro                  2020-07-10  1693  					data + transhdrlen, fraggap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1694  				skb_prev->csum = csum_sub(skb_prev->csum,
^1da177e4c3f41 Linus Torvalds           2005-04-16  1695  							  skb->csum);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1696  				data += fraggap;
e9fa4f7bd291c2 Herbert Xu               2006-08-13  1697  				pskb_trim_unique(skb_prev, maxfraglen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1698  			}
232cd35d0804cc Eric Dumazet             2017-05-19  1699  			if (copy > 0 &&
232cd35d0804cc Eric Dumazet             2017-05-19  1700  			    getfrag(from, data + transhdrlen, offset,
232cd35d0804cc Eric Dumazet             2017-05-19  1701  				    copy, fraggap, skb) < 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1702  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1703  				kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1704  				goto error;
ce650a1663354a David Howells            2023-08-02  1705  			} else if (flags & MSG_SPLICE_PAGES) {
ce650a1663354a David Howells            2023-08-02  1706  				copy = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1707  			}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1708  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1709  			offset += copy;
15e36f5b8e982d Willem de Bruijn         2018-04-26  1710  			length -= copy + transhdrlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1711  			transhdrlen = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1712  			exthdrlen = 0;
299b0767642a65 Steffen Klassert         2011-10-11  1713  			dst_exthdrlen = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1714  
52900d22288e7d Willem de Bruijn         2018-11-30  1715  			/* Only the initial fragment is time stamped */
52900d22288e7d Willem de Bruijn         2018-11-30  1716  			skb_shinfo(skb)->tx_flags = cork->tx_flags;
52900d22288e7d Willem de Bruijn         2018-11-30  1717  			cork->tx_flags = 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1718  			skb_shinfo(skb)->tskey = tskey;
52900d22288e7d Willem de Bruijn         2018-11-30  1719  			tskey = 0;
52900d22288e7d Willem de Bruijn         2018-11-30  1720  			skb_zcopy_set(skb, uarg, &extra_uref);
52900d22288e7d Willem de Bruijn         2018-11-30  1721  
0dec879f636f11 Julian Anastasov         2017-02-06  1722  			if ((flags & MSG_CONFIRM) && !skb_prev)
0dec879f636f11 Julian Anastasov         2017-02-06  1723  				skb_set_dst_pending_confirm(skb, 1);
0dec879f636f11 Julian Anastasov         2017-02-06  1724  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1725  			/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1726  			 * Put the packet on the pending queue
^1da177e4c3f41 Linus Torvalds           2005-04-16  1727  			 */
1f4c6eb2402968 Eric Dumazet             2018-03-31  1728  			if (!skb->destructor) {
1f4c6eb2402968 Eric Dumazet             2018-03-31  1729  				skb->destructor = sock_wfree;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1730  				skb->sk = sk;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1731  				wmem_alloc_delta += skb->truesize;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1732  			}
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1733  			__skb_queue_tail(queue, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1734  			continue;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1735  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1736  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1737  		if (copy > length)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1738  			copy = length;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1739  
113f99c3358564 Willem de Bruijn         2018-05-17  1740  		if (!(rt->dst.dev->features&NETIF_F_SG) &&
113f99c3358564 Willem de Bruijn         2018-05-17  1741  		    skb_tailroom(skb) >= copy) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1742  			unsigned int off;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1743  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1744  			off = skb->len;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1745  			if (getfrag(from, skb_put(skb, copy),
^1da177e4c3f41 Linus Torvalds           2005-04-16  1746  						offset, copy, off, skb) < 0) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1747  				__skb_trim(skb, off);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1748  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1749  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1750  			}
6d8192bd69bb43 David Howells            2023-05-22  1751  		} else if (flags & MSG_SPLICE_PAGES) {
6d8192bd69bb43 David Howells            2023-05-22  1752  			struct msghdr *msg = from;
6d8192bd69bb43 David Howells            2023-05-22  1753  
ce650a1663354a David Howells            2023-08-02  1754  			err = -EIO;
ce650a1663354a David Howells            2023-08-02  1755  			if (WARN_ON_ONCE(copy > msg->msg_iter.count))
ce650a1663354a David Howells            2023-08-02  1756  				goto error;
ce650a1663354a David Howells            2023-08-02  1757  
6d8192bd69bb43 David Howells            2023-05-22  1758  			err = skb_splice_from_iter(skb, &msg->msg_iter, copy,
6d8192bd69bb43 David Howells            2023-05-22  1759  						   sk->sk_allocation);
6d8192bd69bb43 David Howells            2023-05-22  1760  			if (err < 0)
6d8192bd69bb43 David Howells            2023-05-22  1761  				goto error;
6d8192bd69bb43 David Howells            2023-05-22  1762  			copy = err;
6d8192bd69bb43 David Howells            2023-05-22  1763  			wmem_alloc_delta += copy;
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1764  		} else if (!zc) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1765  			int i = skb_shinfo(skb)->nr_frags;
5640f7685831e0 Eric Dumazet             2012-09-23  1766  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1767  			err = -ENOMEM;
5640f7685831e0 Eric Dumazet             2012-09-23  1768  			if (!sk_page_frag_refill(sk, pfrag))
^1da177e4c3f41 Linus Torvalds           2005-04-16  1769  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1770  
1fd3ae8c906c0f Pavel Begunkov           2022-07-12  1771  			skb_zcopy_downgrade_managed(skb);
5640f7685831e0 Eric Dumazet             2012-09-23  1772  			if (!skb_can_coalesce(skb, i, pfrag->page,
5640f7685831e0 Eric Dumazet             2012-09-23  1773  					      pfrag->offset)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1774  				err = -EMSGSIZE;
5640f7685831e0 Eric Dumazet             2012-09-23  1775  				if (i == MAX_SKB_FRAGS)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1776  					goto error;
5640f7685831e0 Eric Dumazet             2012-09-23  1777  
5640f7685831e0 Eric Dumazet             2012-09-23  1778  				__skb_fill_page_desc(skb, i, pfrag->page,
5640f7685831e0 Eric Dumazet             2012-09-23  1779  						     pfrag->offset, 0);
5640f7685831e0 Eric Dumazet             2012-09-23  1780  				skb_shinfo(skb)->nr_frags = ++i;
5640f7685831e0 Eric Dumazet             2012-09-23  1781  				get_page(pfrag->page);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1782  			}
5640f7685831e0 Eric Dumazet             2012-09-23  1783  			copy = min_t(int, copy, pfrag->size - pfrag->offset);
9e903e085262ff Eric Dumazet             2011-10-18  1784  			if (getfrag(from,
5640f7685831e0 Eric Dumazet             2012-09-23  1785  				    page_address(pfrag->page) + pfrag->offset,
5640f7685831e0 Eric Dumazet             2012-09-23  1786  				    offset, copy, skb->len, skb) < 0)
5640f7685831e0 Eric Dumazet             2012-09-23  1787  				goto error_efault;
5640f7685831e0 Eric Dumazet             2012-09-23  1788  
5640f7685831e0 Eric Dumazet             2012-09-23  1789  			pfrag->offset += copy;
5640f7685831e0 Eric Dumazet             2012-09-23  1790  			skb_frag_size_add(&skb_shinfo(skb)->frags[i - 1], copy);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1791  			skb->len += copy;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1792  			skb->data_len += copy;
f945fa7ad9c12a Herbert Xu               2008-01-22  1793  			skb->truesize += copy;
1f4c6eb2402968 Eric Dumazet             2018-03-31  1794  			wmem_alloc_delta += copy;
b5947e5d1e710c Willem de Bruijn         2018-11-30  1795  		} else {
b5947e5d1e710c Willem de Bruijn         2018-11-30  1796  			err = skb_zerocopy_iter_dgram(skb, from, copy);
b5947e5d1e710c Willem de Bruijn         2018-11-30  1797  			if (err < 0)
b5947e5d1e710c Willem de Bruijn         2018-11-30  1798  				goto error;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1799  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  1800  		offset += copy;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1801  		length -= copy;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1802  	}
5640f7685831e0 Eric Dumazet             2012-09-23  1803  
9e8445a56c253f Paolo Abeni              2018-04-04  1804  	if (wmem_alloc_delta)
1f4c6eb2402968 Eric Dumazet             2018-03-31  1805  		refcount_add(wmem_alloc_delta, &sk->sk_wmem_alloc);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1806  	return 0;
5640f7685831e0 Eric Dumazet             2012-09-23  1807  
5640f7685831e0 Eric Dumazet             2012-09-23  1808  error_efault:
5640f7685831e0 Eric Dumazet             2012-09-23  1809  	err = -EFAULT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1810  error:
8e0449172497a9 Jonathan Lemon           2021-01-06  1811  	net_zcopy_put_abort(uarg, extra_uref);
bdc712b4c2baf9 David S. Miller          2011-05-06  1812  	cork->length -= length;
3bd653c8455bc7 Denis V. Lunev           2008-10-08  1813  	IP6_INC_STATS(sock_net(sk), rt->rt6i_idev, IPSTATS_MIB_OUTDISCARDS);
1f4c6eb2402968 Eric Dumazet             2018-03-31  1814  	refcount_add(wmem_alloc_delta, &sk->sk_wmem_alloc);
488b6d91b07112 Vadim Fedorenko          2024-02-13 @1815  	if (hold_tskey)
488b6d91b07112 Vadim Fedorenko          2024-02-13  1816  		atomic_dec(&sk->sk_tskey);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1817  	return err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1818  }
0bbe84a67b0b54 Vlad Yasevich            2015-01-31  1819  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
