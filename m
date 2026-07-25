Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0C16A395
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990208; cv=none; b=caXpVEBCFWlbCof8CiCOThjyOE2MaAlTBiyil8K/FjV0zg665CF9hQbGoQl40Eb0OhuKPbGwsuev1KjQO7dv+H7+oyNIfANHtiqhaX7SgBYh/FoV3Y+O3eYRstgCjTQ7qEoa4bJaWm8Ky43vgK578MpnGx+GlP7vTEZhAeT4Rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990208; c=relaxed/simple;
	bh=ruWukX+OtNwXe8MmPAjThW8KlVE9fpAaA4zdwayhFM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h59xJ0mRYk1Fk7bRwZqAwOtHTVcc46vkkv8PxIySRIhErv2THDfpB/M1QjHq5fmHmvrEKBXg2J/ID9GLSnTmsepKPWXHnmrUW3er0EKOe+n1hSOEoEPY7+SQc3fAtMu30oZOGZlb6S6wOrxVlH+bdvvqvMH+B6QdKiT01dBET74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTzQ9Rw+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTzQ9Rw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784990206; x=1816526206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ruWukX+OtNwXe8MmPAjThW8KlVE9fpAaA4zdwayhFM4=;
  b=UTzQ9Rw+AdI05Gjon+LaNua/VpFojxl+R9oFxKkxIThbPr+06i0T3Q0E
   v1roaKBM2sfmSTOgPK5HGckXNUq/+0br74Mz4ugxnIIAMs5UTb6BV2CVK
   DxdpVweAPjF7NF62/RbceiJUAITp37XUKpRM2Bx9/cdNi8/bVznC/sD78
   5GdLbiqM99CE2m4pbm7GTobFDWAO6QYru6ufA5KHOjb2+Xrq/2jq3xKgb
   ZjOQ0wGa/cIP2MVw7RJxcKwJIoFUdrNc1ca3zbZ/zKkw7YgKRo7WcZjnj
   MtPgi0YRU1gCnrSRoM2pCpE6UPEwJ5YMRrEA2EBr1znt4C+/v+Lcrcoug
   w==;
X-CSE-ConnectionGUID: IpTRNOX2RG+T1cAwpqB7Dg==
X-CSE-MsgGUID: 8hB+QIpURwStGERm3BK81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="84755422"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="84755422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 07:36:45 -0700
X-CSE-ConnectionGUID: G20/B6PlTeSYgeq40IIDfA==
X-CSE-MsgGUID: 8JvtG87VQYyYiY7j4ZvGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="259036055"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Jul 2026 07:36:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wndUX-00000000bkE-234U;
	Sat, 25 Jul 2026 14:36:41 +0000
Date: Sat, 25 Jul 2026 22:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/emulex/benet/be_main.c:2461
 be_rx_compl_process_gro() error: buffer overflow
 '((skb_end_pointer(skb)))->frags' 17 <= u16max
Message-ID: <202607252243.pfaeplGg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: David Gow <davidgow@google.com>

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   48a5a7ab8d6ab7090564339e039c421f315de912
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML w=
ithout triggering WARN()
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: um-randconfig-r073-20260725 (https://download.01.org/0day-ci/archiv=
e/20260725/202607252243.pfaeplGg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607252243.pfaeplGg-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/emulex/benet/be_main.c:2461 be_rx_compl_process_gro() =
error: buffer overflow '((skb_end_pointer(skb)))->frags' 17 <=3D u16max
drivers/gpu/drm/nouveau/nouveau_backlight.c:349 nouveau_backlight_init() wa=
rn: missing error code 'ret'

vim +2461 drivers/net/ethernet/emulex/benet/be_main.c

6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2427 =20
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2428  /* Process the RX completion indicated by rxcp when GRO =
is enabled */
4188e7df44bf316 drivers/net/ethernet/emulex/benet/be_main.c Jingoo Han     =
 2013-08-05  2429  static void be_rx_compl_process_gro(struct be_rx_obj *rx=
o,
4188e7df44bf316 drivers/net/ethernet/emulex/benet/be_main.c Jingoo Han     =
 2013-08-05  2430  				    struct napi_struct *napi,
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2431  				    struct be_rx_compl_info *rxcp)
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2432  {
10ef9ab4329edd0 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla   =
 2012-02-09  2433  	struct be_adapter *adapter =3D rxo->adapter;
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2434  	struct be_rx_page_info *page_info;
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2435  	struct sk_buff *skb =3D NULL;
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2436  	u16 remaining, curr_frag_len;
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2437  	u16 i, j;
3968fa1e5889618 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2011-02-20  2438 =20
10ef9ab4329edd0 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla   =
 2012-02-09  2439  	skb =3D napi_get_frags(napi);
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2440  	if (!skb) {
10ef9ab4329edd0 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla   =
 2012-02-09  2441  		be_rx_compl_discard(rxo, rxcp);
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2442  		return;
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2443  	}
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2444 =20
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2445  	remaining =3D rxcp->pkt_size;
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2446  	for (i =3D 0, j =3D -1; i < rxcp->num_rcvd; i++) {
0b0ef1d027008f0 drivers/net/ethernet/emulex/benet/be_main.c Suresh Reddy   =
 2014-01-15  2447  		page_info =3D get_rx_page_info(rxo);
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2448 =20
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2449  		curr_frag_len =3D min(remaining, rx_frag_size);
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2450 =20
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2451  		/* Coalesce all frags from the same physical page in o=
ne slot */
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2452  		if (i =3D=3D 0 || page_info->page_offset =3D=3D 0) {
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2453  			/* First frag or Fresh page */
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2454  			j++;
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2455  			skb_frag_fill_page_desc(&skb_shinfo(skb)->frags[j],
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2456  						page_info->page,
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2457  						page_info->page_offset,
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2458  						curr_frag_len);
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2459  		} else {
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2460  			put_page(page_info->page);
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11 @2461  			skb_frag_size_add(&skb_shinfo(skb)->frags[j],
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2462  					  curr_frag_len);
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2463  		}
b51f4113ebb0201 drivers/net/ethernet/emulex/benet/be_main.c Yunsheng Lin   =
 2023-05-11  2464 =20
bdb28a97f46b530 drivers/net/ethernet/emulex/benet/be_main.c Eric Dumazet   =
 2011-10-13  2465  		skb->truesize +=3D rx_frag_size;
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2466  		remaining -=3D curr_frag_len;
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2467  		memset(page_info, 0, sizeof(*page_info));
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2468  	}
bd46cb6cf118671 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-06-26  2469  	BUG_ON(j > MAX_SKB_FRAGS);
6b7c5b947c671a9 drivers/net/benet/be_main.c                 Sathya Perla   =
 2009-03-11  2470 =20
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2471  	skb_shinfo(skb)->nr_frags =3D j + 1;
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2472  	skb->len =3D rxcp->pkt_size;
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2473  	skb->data_len =3D rxcp->pkt_size;
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2474  	skb->ip_summed =3D CHECKSUM_UNNECESSARY;
aaa6daec586cd39 drivers/net/ethernet/emulex/benet/be_main.c Somnath Kotur  =
 2012-05-02  2475  	skb_record_rx_queue(skb, rxo - &adapter->rx_obj[0]);
4b97291429bf59c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2011-04-06  2476  	if (adapter->netdev->features & NETIF_F_RXHASH)
d2464c8c547333e drivers/net/ethernet/emulex/benet/be_main.c Tom Herbert    =
 2013-12-17  2477  		skb_set_hash(skb, rxcp->rss_hash, PKT_HASH_TYPE_L3);
c9c47142f6bf468 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla   =
 2014-03-27  2478 =20
b6c0e89dd3a1b22 drivers/net/ethernet/emulex/benet/be_main.c Tom Herbert    =
 2014-08-27  2479  	skb->csum_level =3D rxcp->tunneled;
5be93b9a865344c drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2009-07-21  2480 =20
343e43c02850a3a drivers/net/ethernet/emulex/benet/be_main.c Jiri Pirko     =
 2011-08-25  2481  	if (rxcp->vlanf)
86a9bad3ab6b6f8 drivers/net/ethernet/emulex/benet/be_main.c Patrick McHardy=
 2013-04-19  2482  		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), rxcp->=
vlan_tag);
4c5102f94c175d8 drivers/net/benet/be_main.c                 Ajit Khaparde  =
 2011-07-12  2483 =20
10ef9ab4329edd0 drivers/net/ethernet/emulex/benet/be_main.c Sathya Perla   =
 2012-02-09  2484  	napi_gro_frags(napi);
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2485  }
2e588f84f254cca drivers/net/benet/be_main.c                 Sathya Perla   =
 2011-03-11  2486 =20

:::::: The code at line 2461 was first introduced by commit
:::::: b51f4113ebb02011f0ca86abc3134b28d2071b6a net: introduce and use skb_=
frag_fill_page_desc()

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
