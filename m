Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855400;
	b=ZwJhMXvxnHIbzjMnJ2ckXvhNGoaIPsNnz/TOx8p2FXsorSBupdtRFGkaZbI0yvCriXgn
	 j6lgO72t5ozBPRD8W33P36C3vb7TT3wW86XKmE9Ixl1cX1GMAzRhnw5sbbA4mzxEMLaH5
	 QMjjkdf+13baWCknXI/2LxLf2cQKe1K+IEBGLa0Sd2bSZSwMoBZnwR8ydDZmrv2MZH5FN
	 Y6k1EqVD+E1WYHk4PswsyI0pzjvtzGivNaGmkrTg5DNcEhi9raHprRaOm2qIE3bR4wWE2
	 GKU64+o5O0qRnwsotx9gfKN94E8ghs+Oy3rwSKG2DEtVTP6Sq11uHQ+/pUTA4O6sugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DygaCcjuH0mQDI5SfMmRIb+4EH3wsDMIwMO0KAoriLQ=;
	b=qtUMmqunOP3+AqhhI4y2aFYlqotsiPLPzy38Ya2yI1JiY/JMWYbonQOsp98Lrqbup/Nt
	 GHvAnt4v2ET04K8fRKZiX8Quit0V8sRQdql2fnskf/zuZPcBXC1YcLOBZewIEBNPxR2rQ
	 rhEtxN6v9BA0+iDy3tx6J9l0Z3Qic2jDnU0Bl+RPSjlWP/SG3fLKY7HGARh8MGFK3ywdo
	 gUlnHV3pG6SH1VQj4GMexyp8yMWtp1m6SLE+CCTNHOC7hDyLymsXSrPBYSyiyoOOM+xMm
	 Mdoq1GNrcHxjKzzKJ4o2DmB8qBG1qAa8FUcJs9JRJVTiSDG9gfUbgak04yXQMdLqgkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmnZHKom;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C4C606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 18:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmnZHKom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794855398; x=1826391398;
  h=date:from:to:cc:subject:message-id;
  bh=iMrdJtlQMJ4NMg18mgvfSD48SJrGXLdaP9ASy7enqyY=;
  b=bmnZHKomwn0IR+Jog1Ep65e+ffHLV5OVTljjNsL+iP8G3MlyjiGu74yY
   F/m5RZiC6R9BlMoUaY+dE7g1aD4qu2p1FfHOgMAPozS2etobf2Ndg2qYS
   Ry/wvFET24ZmPYqcSXqgb/x1OgGawghFXUlrccFcnpPPbE/BYgpXSFzQp
   eIEkQ841ECOW/MVaYLAScViduBOX8JxLZWMoOoLKNCRnx5OvgcHsw9onB
   NH2wzbnmvH2wt9gz5JRR6faavQseIoMH/VOmeCCh8RZNbFm3lfvBqwxwv
   wgxaqHeQRVkPROcUCTfGstR4sOZxyYU4jRijhIrl6FO6TlxVqlWBkVmAQ
   A==;
X-CSE-ConnectionGUID: z9a1dxxlTIuaWGWPBB6kfw==
X-CSE-MsgGUID: Mx8fIOcyTr+fviA9YFBUaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3477997"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3477997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:56:37 -0800
X-CSE-ConnectionGUID: FR5Vv0BZRSGl9ouGsCBCZA==
X-CSE-MsgGUID: 2tSMWS6nQciOp2e75MIkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9455315"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Nov 2026 10:56:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT1sX-000000002mw-2we6;
	Mon, 16 Nov 2026 18:56:33 +0000
Date: Mon, 16 Nov 2026 19:55:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/tun.c:1965 tun_get_user() error: we previously
 assumed 'msg_control' could be null (see line 1851)
Message-ID: <202611161911.K8V4nhGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Willem de Bruijn <willemb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 73e08d50eb139e7329032c89a4cb105cf43ef278 net: virtio: validate outer protocol of UDP tunnel GSO packets
date:   4 days ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 days ago
config: xtensa-randconfig-2200-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161911.K8V4nhGq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73e08d50eb13 ("net: virtio: validate outer protocol of UDP tunnel GSO packets")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611161911.K8V4nhGq-lkp@intel.com/

New smatch warnings:
drivers/net/tun.c:1965 tun_get_user() error: we previously assumed 'msg_control' could be null (see line 1851)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +/msg_control +1965 drivers/net/tun.c

66ccbc9c87c2ae Jason Wang                2017-08-11  1791  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1792  /* Get packet from user space buffer */
54f968d6efdbf7 Jason Wang                2012-10-31  1793  static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
f5ff53b4d97c62 Al Viro                   2014-06-19  1794  			    void *msg_control, struct iov_iter *from,
5503fcecd49f59 Jason Wang                2017-01-18  1795  			    int noblock, bool more)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1796  {
09640e6365c679 Harvey Harrison           2009-02-01  1797  	struct tun_pi pi = { 0, cpu_to_be16(ETH_P_IP) };
^1da177e4c3f41 Linus Torvalds            2005-04-16  1798  	struct sk_buff *skb;
f5ff53b4d97c62 Al Viro                   2014-06-19  1799  	size_t total_len = iov_iter_count(from);
eaea34b23c46bf Paolo Abeni               2016-02-26  1800  	size_t len = total_len, align = tun->align, linear;
288f30435132d2 Paolo Abeni               2025-07-08  1801  	struct virtio_net_hdr_v1_hash_tunnel hdr;
288f30435132d2 Paolo Abeni               2025-07-08  1802  	struct virtio_net_hdr *gso;
96f8d9ecf22763 Jason Wang                2013-11-13  1803  	int good_linear;
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1804  	int copylen;
07e8b3bae2f8f4 Akihiko Odaki             2025-02-07  1805  	int hdr_len = 0;
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1806  	bool zerocopy = false;
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1807  	int err;
96f84061620c63 Jason Wang                2017-12-04  1808  	u32 rxhash = 0;
1cfe6e9351c256 Jason Wang                2017-09-04  1809  	int skb_xdp = 1;
af3fb24eecb2c5 Eric Dumazet              2018-09-28  1810  	bool frags = tun_napi_frags_enabled(tfile);
ab00af85d2f886 Chuang Wang               2022-11-10  1811  	enum skb_drop_reason drop_reason = SKB_DROP_REASON_NOT_SPECIFIED;
288f30435132d2 Paolo Abeni               2025-07-08  1812  	netdev_features_t features = 0;
288f30435132d2 Paolo Abeni               2025-07-08  1813  
288f30435132d2 Paolo Abeni               2025-07-08  1814  	/*
288f30435132d2 Paolo Abeni               2025-07-08  1815  	 * Keep it easy and always zero the whole buffer, even if the
288f30435132d2 Paolo Abeni               2025-07-08  1816  	 * tunnel-related field will be touched only when the feature
288f30435132d2 Paolo Abeni               2025-07-08  1817  	 * is enabled and the hdr size id compatible.
288f30435132d2 Paolo Abeni               2025-07-08  1818  	 */
288f30435132d2 Paolo Abeni               2025-07-08  1819  	memset(&hdr, 0, sizeof(hdr));
288f30435132d2 Paolo Abeni               2025-07-08  1820  	gso = (struct virtio_net_hdr *)&hdr;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1821  
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1822  	if (!(tun->flags & IFF_NO_PI)) {
15718ea0d844e4 Dan Carpenter             2013-08-15  1823  		if (len < sizeof(pi))
^1da177e4c3f41 Linus Torvalds            2005-04-16  1824  			return -EINVAL;
15718ea0d844e4 Dan Carpenter             2013-08-15  1825  		len -= sizeof(pi);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1826  
cbbd26b8b1a6af Al Viro                   2016-11-01  1827  		if (!copy_from_iter_full(&pi, sizeof(pi), from))
^1da177e4c3f41 Linus Torvalds            2005-04-16  1828  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1829  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1830  
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1831  	if (tun->flags & IFF_VNET_HDR) {
e1edab87faf6ca Willem de Bruijn          2017-02-03  1832  		int vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
4909122fb8350e Herbert Xu                2009-06-08  1833  
288f30435132d2 Paolo Abeni               2025-07-08  1834  		features = tun_vnet_hdr_guest_features(vnet_hdr_sz);
288f30435132d2 Paolo Abeni               2025-07-08  1835  		hdr_len = __tun_vnet_hdr_get(vnet_hdr_sz, tun->flags,
288f30435132d2 Paolo Abeni               2025-07-08  1836  					     features, from, gso);
2506251e81d187 Akihiko Odaki             2025-02-07  1837  		if (hdr_len < 0)
2506251e81d187 Akihiko Odaki             2025-02-07  1838  			return hdr_len;
07e8b3bae2f8f4 Akihiko Odaki             2025-02-07  1839  
2506251e81d187 Akihiko Odaki             2025-02-07  1840  		len -= vnet_hdr_sz;
f43798c27684ab Rusty Russell             2008-07-03  1841  	}
f43798c27684ab Rusty Russell             2008-07-03  1842  
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1843  	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP) {
a504b86e718a42 stephen hemminger         2011-06-08  1844  		align += NET_IP_ALIGN;
07e8b3bae2f8f4 Akihiko Odaki             2025-02-07  1845  		if (unlikely(len < ETH_HLEN || (hdr_len && hdr_len < ETH_HLEN)))
e01bf1c83332c4 Rusty Russell             2008-04-12  1846  			return -EINVAL;
e01bf1c83332c4 Rusty Russell             2008-04-12  1847  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1848  
96f8d9ecf22763 Jason Wang                2013-11-13  1849  	good_linear = SKB_MAX_HEAD(align);
96f8d9ecf22763 Jason Wang                2013-11-13  1850  
885291761dba2b Jason Wang                2013-07-18 @1851  	if (msg_control) {
f5ff53b4d97c62 Al Viro                   2014-06-19  1852  		struct iov_iter i = *from;
f5ff53b4d97c62 Al Viro                   2014-06-19  1853  
885291761dba2b Jason Wang                2013-07-18  1854  		/* There are 256 bytes to be copied in skb, so there is
885291761dba2b Jason Wang                2013-07-18  1855  		 * enough room for skb expand head in case it is used.
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1856  		 * The rest of the buffer is mapped from userspace.
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1857  		 */
07e8b3bae2f8f4 Akihiko Odaki             2025-02-07  1858  		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
3dd5c3308e8b67 Jason Wang                2013-07-10  1859  		linear = copylen;
f5ff53b4d97c62 Al Viro                   2014-06-19  1860  		iov_iter_advance(&i, copylen);
f5ff53b4d97c62 Al Viro                   2014-06-19  1861  		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
885291761dba2b Jason Wang                2013-07-18  1862  			zerocopy = true;
885291761dba2b Jason Wang                2013-07-18  1863  	}
885291761dba2b Jason Wang                2013-07-18  1864  
90e33d45940793 Petar Penkov              2017-09-22  1865  	if (!frags && tun_can_build_skb(tun, tfile, len, noblock, zerocopy)) {
1cfe6e9351c256 Jason Wang                2017-09-04  1866  		/* For the packet that is not easy to be processed
1cfe6e9351c256 Jason Wang                2017-09-04  1867  		 * (e.g gso or jumbo packet), we will do it at after
1cfe6e9351c256 Jason Wang                2017-09-04  1868  		 * skb was created with generic XDP routine.
1cfe6e9351c256 Jason Wang                2017-09-04  1869  		 */
288f30435132d2 Paolo Abeni               2025-07-08  1870  		skb = tun_build_skb(tun, tfile, from, gso, len, &skb_xdp);
ab00af85d2f886 Chuang Wang               2022-11-10  1871  		err = PTR_ERR_OR_ZERO(skb);
ab00af85d2f886 Chuang Wang               2022-11-10  1872  		if (err)
ab00af85d2f886 Chuang Wang               2022-11-10  1873  			goto drop;
761876c857cb2e Jason Wang                2017-08-11  1874  		if (!skb)
761876c857cb2e Jason Wang                2017-08-11  1875  			return total_len;
66ccbc9c87c2ae Jason Wang                2017-08-11  1876  	} else {
885291761dba2b Jason Wang                2013-07-18  1877  		if (!zerocopy) {
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1878  			copylen = len;
07e8b3bae2f8f4 Akihiko Odaki             2025-02-07  1879  			linear = min(hdr_len, good_linear);
3dd5c3308e8b67 Jason Wang                2013-07-10  1880  		}
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1881  
90e33d45940793 Petar Penkov              2017-09-22  1882  		if (frags) {
90e33d45940793 Petar Penkov              2017-09-22  1883  			mutex_lock(&tfile->napi_mutex);
90e33d45940793 Petar Penkov              2017-09-22  1884  			skb = tun_napi_alloc_frags(tfile, copylen, from);
90e33d45940793 Petar Penkov              2017-09-22  1885  			/* tun_napi_alloc_frags() enforces a layout for the skb.
90e33d45940793 Petar Penkov              2017-09-22  1886  			 * If zerocopy is enabled, then this layout will be
90e33d45940793 Petar Penkov              2017-09-22  1887  			 * overwritten by zerocopy_sg_from_iter().
90e33d45940793 Petar Penkov              2017-09-22  1888  			 */
90e33d45940793 Petar Penkov              2017-09-22  1889  			zerocopy = false;
90e33d45940793 Petar Penkov              2017-09-22  1890  		} else {
6231e47b6fadf4 Tahsin Erdogan            2023-08-09  1891  			if (!linear)
6231e47b6fadf4 Tahsin Erdogan            2023-08-09  1892  				linear = min_t(size_t, good_linear, copylen);
6231e47b6fadf4 Tahsin Erdogan            2023-08-09  1893  
90e33d45940793 Petar Penkov              2017-09-22  1894  			skb = tun_alloc_skb(tfile, align, copylen, linear,
90e33d45940793 Petar Penkov              2017-09-22  1895  					    noblock);
90e33d45940793 Petar Penkov              2017-09-22  1896  		}
90e33d45940793 Petar Penkov              2017-09-22  1897  
ab00af85d2f886 Chuang Wang               2022-11-10  1898  		err = PTR_ERR_OR_ZERO(skb);
ab00af85d2f886 Chuang Wang               2022-11-10  1899  		if (err)
ab00af85d2f886 Chuang Wang               2022-11-10  1900  			goto drop;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1901  
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1902  		if (zerocopy)
f5ff53b4d97c62 Al Viro                   2014-06-19  1903  			err = zerocopy_sg_from_iter(skb, from);
af1cc7a2b86ddb Jason Wang                2016-11-30  1904  		else
f5ff53b4d97c62 Al Viro                   2014-06-19  1905  			err = skb_copy_datagram_from_iter(skb, 0, from, len);
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1906  
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1907  		if (err) {
4477138fa0ae4e Eric Dumazet              2019-03-14  1908  			err = -EFAULT;
4b4f052e2d89c2 Dongli Zhang              2022-03-04  1909  			drop_reason = SKB_DROP_REASON_SKB_UCOPY_FAULT;
ab00af85d2f886 Chuang Wang               2022-11-10  1910  			goto drop;
8f22757ee84da6 Dave Jones                2006-03-11  1911  		}
66ccbc9c87c2ae Jason Wang                2017-08-11  1912  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1913  
44378d02c5aaae Eric Dumazet              2026-10-01  1914  	skb->dev = tun->dev;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1915  	switch (tun->flags & TUN_TYPE_MASK) {
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1916  	case IFF_TUN:
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1917  		if (tun->flags & IFF_NO_PI) {
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1918  			u8 ip_version;
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1919  
47b393b997aee3 Anton Danilov             2026-10-14  1920  			drop_reason = pskb_may_pull_reason(skb, 1);
47b393b997aee3 Anton Danilov             2026-10-14  1921  			if (drop_reason) {
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1922  				err = -EINVAL;
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1923  				goto drop;
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1924  			}
447c9303942c43 Asim Viladi Oglu Manizada 2026-08-12  1925  			ip_version = skb->data[0] >> 4;
2580c4c17aee3a Alexander Potapenko       2017-09-28  1926  
2580c4c17aee3a Alexander Potapenko       2017-09-28  1927  			switch (ip_version) {
2580c4c17aee3a Alexander Potapenko       2017-09-28  1928  			case 4:
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1929  				pi.proto = htons(ETH_P_IP);
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1930  				break;
2580c4c17aee3a Alexander Potapenko       2017-09-28  1931  			case 6:
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1932  				pi.proto = htons(ETH_P_IPV6);
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1933  				break;
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1934  			default:
ab00af85d2f886 Chuang Wang               2022-11-10  1935  				err = -EINVAL;
ab00af85d2f886 Chuang Wang               2022-11-10  1936  				goto drop;
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1937  			}
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1938  		}
f09f7ee20c8678 Ang Way Chuang            2008-06-17  1939  
44378d02c5aaae Eric Dumazet              2026-10-01  1940  		skb_reset_network_header(skb);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1941  		skb->protocol = pi.proto;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1942  		break;
40630b82c20b7d Michael S. Tsirkin        2014-11-19  1943  	case IFF_TAP:
47b393b997aee3 Anton Danilov             2026-10-14  1944  		drop_reason = pskb_may_pull_reason(skb, ETH_HLEN);
47b393b997aee3 Anton Danilov             2026-10-14  1945  		if (drop_reason) {
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  1946  			err = -ENOMEM;
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  1947  			goto drop;
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  1948  		}
44378d02c5aaae Eric Dumazet              2026-10-01  1949  		skb_set_network_header(skb, ETH_HLEN);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1950  		break;
6403eab143205a Joe Perches               2011-06-03  1951  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  1952  
73e08d50eb139e Eric Dumazet              2026-11-10  1953  	if (tun_vnet_hdr_tnl_to_skb(tun->flags, features, skb, &hdr,
73e08d50eb139e Eric Dumazet              2026-11-10  1954  				    (tun->flags & TUN_TYPE_MASK) == IFF_TAP)) {
44378d02c5aaae Eric Dumazet              2026-10-01  1955  		atomic_long_inc(&tun->rx_frame_errors);
44378d02c5aaae Eric Dumazet              2026-10-01  1956  		err = -EINVAL;
44378d02c5aaae Eric Dumazet              2026-10-01  1957  		goto free_skb;
44378d02c5aaae Eric Dumazet              2026-10-01  1958  	}
44378d02c5aaae Eric Dumazet              2026-10-01  1959  
44378d02c5aaae Eric Dumazet              2026-10-01  1960  	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP)
44378d02c5aaae Eric Dumazet              2026-10-01  1961  		skb->protocol = eth_type_trans(skb, tun->dev);
44378d02c5aaae Eric Dumazet              2026-10-01  1962  
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1963  	/* copy skb_ubuf_info for callback when skb has no error */
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1964  	if (zerocopy) {
9ee5e5ade03387 Jonathan Lemon            2021-01-06 @1965  		skb_zcopy_init(skb, msg_control);
af1cc7a2b86ddb Jason Wang                2016-11-30  1966  	} else if (msg_control) {
af1cc7a2b86ddb Jason Wang                2016-11-30  1967  		struct ubuf_info *uarg = msg_control;
7ab4f16f9e2440 Pavel Begunkov            2024-04-19  1968  		uarg->ops->complete(NULL, uarg, false);
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1969  	}
0690899b4d4501 Michael S. Tsirkin        2012-07-20  1970  
72f6510745592c Vlad Yasevich             2015-02-03  1971  	skb_reset_network_header(skb);
d2aa125d629080 Alice Mikityanska         2019-02-21  1972  	skb_probe_transport_header(skb);
3fe260e00cd0bf Gilberto Bertin           2020-04-10  1973  	skb_record_rx_queue(skb, tfile->queue_index);
38502af77e07b5 Jason Wang                2013-03-25  1974  
1cfe6e9351c256 Jason Wang                2017-09-04  1975  	if (skb_xdp) {
761876c857cb2e Jason Wang                2017-08-11  1976  		struct bpf_prog *xdp_prog;
761876c857cb2e Jason Wang                2017-08-11  1977  		int ret;
761876c857cb2e Jason Wang                2017-08-11  1978  
6547e387d7f52f Toshiaki Makita           2018-05-28  1979  		local_bh_disable();
761876c857cb2e Jason Wang                2017-08-11  1980  		rcu_read_lock();
761876c857cb2e Jason Wang                2017-08-11  1981  		xdp_prog = rcu_dereference(tun->xdp_prog);
761876c857cb2e Jason Wang                2017-08-11  1982  		if (xdp_prog) {
4d2bb0bfe8741a Lorenzo Bianconi          2024-02-12  1983  			ret = do_xdp_generic(xdp_prog, &skb);
761876c857cb2e Jason Wang                2017-08-11  1984  			if (ret != XDP_PASS) {
761876c857cb2e Jason Wang                2017-08-11  1985  				rcu_read_unlock();
6547e387d7f52f Toshiaki Makita           2018-05-28  1986  				local_bh_enable();
ab00af85d2f886 Chuang Wang               2022-11-10  1987  				goto unlock_frags;
761876c857cb2e Jason Wang                2017-08-11  1988  			}
1091860a16a86c Wang Liang                2025-09-17  1989  
1091860a16a86c Wang Liang                2025-09-17  1990  			if (frags && skb != tfile->napi.skb)
1091860a16a86c Wang Liang                2025-09-17  1991  				tfile->napi.skb = skb;
761876c857cb2e Jason Wang                2017-08-11  1992  		}
761876c857cb2e Jason Wang                2017-08-11  1993  		rcu_read_unlock();
6547e387d7f52f Toshiaki Makita           2018-05-28  1994  		local_bh_enable();
761876c857cb2e Jason Wang                2017-08-11  1995  	}
761876c857cb2e Jason Wang                2017-08-11  1996  
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  1997  	/* Compute the costly rx hash only if needed for flow updates.
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  1998  	 * We may get a very small possibility of OOO during switching, not
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  1999  	 * worth to optimize.
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  2000  	 */
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  2001  	if (!rcu_access_pointer(tun->steering_prog) && tun->numqueues > 1 &&
cf1a1e07fc8bb2 Paolo Abeni               2018-04-20  2002  	    !tfile->detached)
feec084a7cf49a Jason Wang                2017-06-06  2003  		rxhash = __skb_get_hash_symmetric(skb);
943170998b2001 Petar Penkov              2017-09-22  2004  
4477138fa0ae4e Eric Dumazet              2019-03-14  2005  	rcu_read_lock();
4477138fa0ae4e Eric Dumazet              2019-03-14  2006  	if (unlikely(!(tun->dev->flags & IFF_UP))) {
4477138fa0ae4e Eric Dumazet              2019-03-14  2007  		err = -EIO;
9180bb4f046064 Eric Dumazet              2019-03-16  2008  		rcu_read_unlock();
4b4f052e2d89c2 Dongli Zhang              2022-03-04  2009  		drop_reason = SKB_DROP_REASON_DEV_READY;
4477138fa0ae4e Eric Dumazet              2019-03-14  2010  		goto drop;
4477138fa0ae4e Eric Dumazet              2019-03-14  2011  	}
4477138fa0ae4e Eric Dumazet              2019-03-14  2012  
90e33d45940793 Petar Penkov              2017-09-22  2013  	if (frags) {
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  2014  		u32 headlen;
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  2015  
90e33d45940793 Petar Penkov              2017-09-22  2016  		/* Exercise flow dissector code path. */
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  2017  		skb_push(skb, ETH_HLEN);
96aa1b22bd6bb9 Willem de Bruijn          2020-05-30  2018  		headlen = eth_get_headlen(tun->dev, skb->data,
c43f1255b866b4 Stanislav Fomichev        2019-04-22  2019  					  skb_headlen(skb));
90e33d45940793 Petar Penkov              2017-09-22  2020  
010f245b9dd734 Eric Dumazet              2017-10-17  2021  		if (unlikely(headlen > skb_headlen(skb))) {
07d120aa33cc9d Eric Dumazet              2022-11-07  2022  			WARN_ON_ONCE(1);
07d120aa33cc9d Eric Dumazet              2022-11-07  2023  			err = -ENOMEM;
625788b5844511 Eric Dumazet              2022-03-10  2024  			dev_core_stats_rx_dropped_inc(tun->dev);
07d120aa33cc9d Eric Dumazet              2022-11-07  2025  napi_busy:
90e33d45940793 Petar Penkov              2017-09-22  2026  			napi_free_frags(&tfile->napi);
4477138fa0ae4e Eric Dumazet              2019-03-14  2027  			rcu_read_unlock();
90e33d45940793 Petar Penkov              2017-09-22  2028  			mutex_unlock(&tfile->napi_mutex);
07d120aa33cc9d Eric Dumazet              2022-11-07  2029  			return err;
90e33d45940793 Petar Penkov              2017-09-22  2030  		}
90e33d45940793 Petar Penkov              2017-09-22  2031  
07d120aa33cc9d Eric Dumazet              2022-11-07  2032  		if (likely(napi_schedule_prep(&tfile->napi))) {
90e33d45940793 Petar Penkov              2017-09-22  2033  			local_bh_disable();
90e33d45940793 Petar Penkov              2017-09-22  2034  			napi_gro_frags(&tfile->napi);
1118b2049d77ca Wang Yufen                2022-11-02  2035  			napi_complete(&tfile->napi);
90e33d45940793 Petar Penkov              2017-09-22  2036  			local_bh_enable();
07d120aa33cc9d Eric Dumazet              2022-11-07  2037  		} else {
07d120aa33cc9d Eric Dumazet              2022-11-07  2038  			err = -EBUSY;
07d120aa33cc9d Eric Dumazet              2022-11-07  2039  			goto napi_busy;
07d120aa33cc9d Eric Dumazet              2022-11-07  2040  		}
90e33d45940793 Petar Penkov              2017-09-22  2041  		mutex_unlock(&tfile->napi_mutex);
aec72f3392b1d5 Eric Dumazet              2017-10-18  2042  	} else if (tfile->napi_enabled) {
943170998b2001 Petar Penkov              2017-09-22  2043  		struct sk_buff_head *queue = &tfile->sk.sk_write_queue;
943170998b2001 Petar Penkov              2017-09-22  2044  		int queue_len;
943170998b2001 Petar Penkov              2017-09-22  2045  
943170998b2001 Petar Penkov              2017-09-22  2046  		spin_lock_bh(&queue->lock);
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2047  
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2048  		if (unlikely(tfile->detached)) {
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2049  			spin_unlock_bh(&queue->lock);
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2050  			rcu_read_unlock();
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2051  			err = -EBUSY;
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2052  			goto free_skb;
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2053  		}
82b2bc279467c8 Kuniyuki Iwashima         2023-05-15  2054  
943170998b2001 Petar Penkov              2017-09-22  2055  		__skb_queue_tail(queue, skb);
943170998b2001 Petar Penkov              2017-09-22  2056  		queue_len = skb_queue_len(queue);
943170998b2001 Petar Penkov              2017-09-22  2057  		spin_unlock(&queue->lock);
943170998b2001 Petar Penkov              2017-09-22  2058  
943170998b2001 Petar Penkov              2017-09-22  2059  		if (!more || queue_len > NAPI_POLL_WEIGHT)
943170998b2001 Petar Penkov              2017-09-22  2060  			napi_schedule(&tfile->napi);
943170998b2001 Petar Penkov              2017-09-22  2061  
943170998b2001 Petar Penkov              2017-09-22  2062  		local_bh_enable();
943170998b2001 Petar Penkov              2017-09-22  2063  	} else if (!IS_ENABLED(CONFIG_4KSTACKS)) {
5503fcecd49f59 Jason Wang                2017-01-18  2064  		tun_rx_batched(tun, tfile, skb, more);
943170998b2001 Petar Penkov              2017-09-22  2065  	} else {
3d391f6518fddc Sebastian Andrzej Siewior 2022-03-06  2066  		netif_rx(skb);
943170998b2001 Petar Penkov              2017-09-22  2067  	}
4477138fa0ae4e Eric Dumazet              2019-03-14  2068  	rcu_read_unlock();
^1da177e4c3f41 Linus Torvalds            2005-04-16  2069  
497a5757ce4e8f Heiner Kallweit           2020-11-07  2070  	preempt_disable();
497a5757ce4e8f Heiner Kallweit           2020-11-07  2071  	dev_sw_netstats_rx_add(tun->dev, len);
497a5757ce4e8f Heiner Kallweit           2020-11-07  2072  	preempt_enable();
^1da177e4c3f41 Linus Torvalds            2005-04-16  2073  
96f84061620c63 Jason Wang                2017-12-04  2074  	if (rxhash)
9e85722d58ca9d Jason Wang                2013-01-28  2075  		tun_flow_update(tun, rxhash, tfile);
96f84061620c63 Jason Wang                2017-12-04  2076  
0690899b4d4501 Michael S. Tsirkin        2012-07-20  2077  	return total_len;
ab00af85d2f886 Chuang Wang               2022-11-10  2078  
ab00af85d2f886 Chuang Wang               2022-11-10  2079  drop:
ab00af85d2f886 Chuang Wang               2022-11-10  2080  	if (err != -EAGAIN)
ab00af85d2f886 Chuang Wang               2022-11-10  2081  		dev_core_stats_rx_dropped_inc(tun->dev);
ab00af85d2f886 Chuang Wang               2022-11-10  2082  
ab00af85d2f886 Chuang Wang               2022-11-10  2083  free_skb:
47b393b997aee3 Anton Danilov             2026-10-14  2084  	drop_reason = drop_reason ?: SKB_DROP_REASON_NOT_SPECIFIED;
ab00af85d2f886 Chuang Wang               2022-11-10  2085  	if (!IS_ERR_OR_NULL(skb))
ab00af85d2f886 Chuang Wang               2022-11-10  2086  		kfree_skb_reason(skb, drop_reason);
ab00af85d2f886 Chuang Wang               2022-11-10  2087  
ab00af85d2f886 Chuang Wang               2022-11-10  2088  unlock_frags:
ab00af85d2f886 Chuang Wang               2022-11-10  2089  	if (frags) {
ab00af85d2f886 Chuang Wang               2022-11-10  2090  		tfile->napi.skb = NULL;
ab00af85d2f886 Chuang Wang               2022-11-10  2091  		mutex_unlock(&tfile->napi_mutex);
ab00af85d2f886 Chuang Wang               2022-11-10  2092  	}
ab00af85d2f886 Chuang Wang               2022-11-10  2093  
ab00af85d2f886 Chuang Wang               2022-11-10  2094  	return err ?: total_len;
^1da177e4c3f41 Linus Torvalds            2005-04-16  2095  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  2096  

:::::: The code at line 1965 was first introduced by commit
:::::: 9ee5e5ade033875191a2d2e470033e9cdde44a6a tap/tun: add skb_zcopy_init() helper for initialization.

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
