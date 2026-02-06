Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEBE303A0D
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417622; cv=none; b=hryk9uOjvd5D89UNEnPSYm1cah5TxPTfx6wWh/fZPuPdqDy/pqrthFAMOwAQk4yH8bgOmJO45O7ljQhrK3FnIyOo3W/161dcRn6fL3txKJVRmJ9bqHsVvJl6bHCZkWEx0VGpRDIScYxt7MIexnosVbZ22nZym/qn566wD4jyGL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417622; c=relaxed/simple;
	bh=S3J480w+Hf48fvsheE/vvAxCiMHVkAOaeSKRozs7beI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ho2XbR+BatX9vyZSdNABmeDoRGngJl/m62VXa+ri+jSF/ouTKnu5fJjP54YvnzQXN1SojtJJKkfmuR4eNlZoH42LYmEM/C1bl6uuIcvk46JJjoxPLhRJKOn9/QZiYM07348Iud7/Y2A+RNmTsrq7yhJ15EjrTsYAU8iSW17ZbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+JuYPOI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+JuYPOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770417623; x=1801953623;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S3J480w+Hf48fvsheE/vvAxCiMHVkAOaeSKRozs7beI=;
  b=Z+JuYPOIl+K+hAihhCVX1MBxHT7cbUhr1iOYkBlPyqJJZkBojEZDnvdO
   HPwDc3za0ykDqyGJDv4QpzOlRRG8mBhKhVGvRdKfNh1u31CiGgIT/4o2e
   MNs7h3RcyJVP8t6vm8fXcPwaO3iyEHa+Uy5oYk4SN85eWy5ctv7SmBvWL
   4xLQLme4QnL+2GOQaQEzbbROXnlHft3q4ajERB7MMBLwAm/AZ/WRKkTRl
   mjwV4z/LnyB1Qho9yX6ToU70BAd3WVR0Q8X+gvbRvOiWmue9K+nnCKpvn
   sPsGVKWEbzyAyF4d4gSQhnYJo6KFn5cCqzLQx7zacbo2d1UQkb4Bv4li6
   g==;
X-CSE-ConnectionGUID: P37vhNTlT8aHZkZHcLLn+Q==
X-CSE-MsgGUID: cWt+MczmRNKHhypaWyXNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71732404"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71732404"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 14:40:22 -0800
X-CSE-ConnectionGUID: 9aYyOogBRuKmfWh1Gph24A==
X-CSE-MsgGUID: uYQ12O72TtGwGHaU4UlKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215169700"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 14:40:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voUUs-00000000lEO-0RCs;
	Fri, 06 Feb 2026 22:40:18 +0000
Date: Sat, 7 Feb 2026 06:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 net-next] virtio_net: Improve RSS key size validation
 and use NETDEV_RSS_KEY_LEN
Message-ID: <202602070652.PgDE9Fp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260206120154.2548079-1-schalla@marvell.com>
References: <20260206120154.2548079-1-schalla@marvell.com>
TO: Srujana Challa <schalla@marvell.com>
TO: netdev@vger.kernel.org
TO: virtualization@lists.linux.dev
CC: pabeni@redhat.com
CC: mst@redhat.com
CC: jasowang@redhat.com
CC: xuanzhuo@linux.alibaba.com
CC: eperezma@redhat.com
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: ndabilpuram@marvell.com
CC: kshankar@marvell.com
CC: schalla@marvell.com

Hi Srujana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Srujana-Challa/virtio_net-Improve-RSS-key-size-validation-and-use-NETDEV_RSS_KEY_LEN/20260206-200801
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260206120154.2548079-1-schalla%40marvell.com
patch subject: [PATCH v2 net-next] virtio_net: Improve RSS key size validation and use NETDEV_RSS_KEY_LEN
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070652.PgDE9Fp7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602070652.PgDE9Fp7-lkp@intel.com/

smatch warnings:
drivers/net/virtio_net.c:6841 virtnet_probe() warn: impossible condition '(vi->rss_key_size > 256) => (40-255 > 256)'

vim +6841 drivers/net/virtio_net.c

aa37f8916d20cf Liang Chen            2024-04-17  6699  
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6700  static int virtnet_probe(struct virtio_device *vdev)
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6701  {
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  6702  	int i, err = -ENOMEM;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6703  	struct net_device *dev;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6704  	struct virtnet_info *vi;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6705  	u16 max_queue_pairs;
4959aebba8c069 Gavin Li              2022-09-14  6706  	int mtu = 0;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6707  
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6708  	/* Find if host supports multiqueue/rss virtio_net device */
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6709  	max_queue_pairs = 1;
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6710  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MQ) || virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6711  		max_queue_pairs =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6712  		     virtio_cread16(vdev, offsetof(struct virtio_net_config, max_virtqueue_pairs));
986a4f4d452dec Jason Wang            2012-12-07  6713  
986a4f4d452dec Jason Wang            2012-12-07  6714  	/* We need at least 2 queue's */
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6715  	if (max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
986a4f4d452dec Jason Wang            2012-12-07  6716  	    max_queue_pairs > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
986a4f4d452dec Jason Wang            2012-12-07  6717  	    !virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
986a4f4d452dec Jason Wang            2012-12-07  6718  		max_queue_pairs = 1;
296f96fcfc160e Rusty Russell         2007-10-22  6719  
296f96fcfc160e Rusty Russell         2007-10-22  6720  	/* Allocate ourselves a network device with room for our info */
986a4f4d452dec Jason Wang            2012-12-07  6721  	dev = alloc_etherdev_mq(sizeof(struct virtnet_info), max_queue_pairs);
296f96fcfc160e Rusty Russell         2007-10-22  6722  	if (!dev)
296f96fcfc160e Rusty Russell         2007-10-22  6723  		return -ENOMEM;
296f96fcfc160e Rusty Russell         2007-10-22  6724  
296f96fcfc160e Rusty Russell         2007-10-22  6725  	/* Set up network device as normal. */
ab5bd583b92896 Xuan Zhuo             2021-02-18  6726  	dev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE |
ab5bd583b92896 Xuan Zhuo             2021-02-18  6727  			   IFF_TX_SKB_NO_LINEAR;
76288b4e573e06 Stephen Hemminger     2009-01-06  6728  	dev->netdev_ops = &virtnet_netdev;
d888f04c09bb2c Xuan Zhuo             2024-04-26  6729  	dev->stat_ops = &virtnet_stat_ops;
296f96fcfc160e Rusty Russell         2007-10-22  6730  	dev->features = NETIF_F_HIGHDMA;
3fa2a1df909482 stephen hemminger     2011-06-15  6731  
7ad24ea4bf620a Wilfried Klaebe       2014-05-11  6732  	dev->ethtool_ops = &virtnet_ethtool_ops;
296f96fcfc160e Rusty Russell         2007-10-22  6733  	SET_NETDEV_DEV(dev, &vdev->dev);
296f96fcfc160e Rusty Russell         2007-10-22  6734  
296f96fcfc160e Rusty Russell         2007-10-22  6735  	/* Do we support "hardware" checksums? */
98e778c9aa4f4f Michał Mirosław       2011-03-31  6736  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CSUM)) {
296f96fcfc160e Rusty Russell         2007-10-22  6737  		/* This opens up the world of extra features. */
48900cb6af4282 Jason Wang            2015-08-05  6738  		dev->hw_features |= NETIF_F_HW_CSUM | NETIF_F_SG;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6739  		if (csum)
48900cb6af4282 Jason Wang            2015-08-05  6740  			dev->features |= NETIF_F_HW_CSUM | NETIF_F_SG;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6741  
98e778c9aa4f4f Michał Mirosław       2011-03-31  6742  		if (virtio_has_feature(vdev, VIRTIO_NET_F_GSO)) {
e078de03788353 David S. Miller       2017-07-03  6743  			dev->hw_features |= NETIF_F_TSO
34a48579e4fb38 Rusty Russell         2008-02-04  6744  				| NETIF_F_TSO_ECN | NETIF_F_TSO6;
34a48579e4fb38 Rusty Russell         2008-02-04  6745  		}
5539ae9613587e Rusty Russell         2008-05-02  6746  		/* Individual feature bits: what can host handle? */
98e778c9aa4f4f Michał Mirosław       2011-03-31  6747  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO4))
98e778c9aa4f4f Michał Mirosław       2011-03-31  6748  			dev->hw_features |= NETIF_F_TSO;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6749  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO6))
98e778c9aa4f4f Michał Mirosław       2011-03-31  6750  			dev->hw_features |= NETIF_F_TSO6;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6751  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_ECN))
98e778c9aa4f4f Michał Mirosław       2011-03-31  6752  			dev->hw_features |= NETIF_F_TSO_ECN;
418044e1de3063 Andrew Melnychenko    2022-12-07  6753  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_USO))
418044e1de3063 Andrew Melnychenko    2022-12-07  6754  			dev->hw_features |= NETIF_F_GSO_UDP_L4;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6755  
56a06bd40fab64 Paolo Abeni           2025-07-08  6756  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO)) {
56a06bd40fab64 Paolo Abeni           2025-07-08  6757  			dev->hw_features |= NETIF_F_GSO_UDP_TUNNEL;
56a06bd40fab64 Paolo Abeni           2025-07-08  6758  			dev->hw_enc_features = dev->hw_features;
56a06bd40fab64 Paolo Abeni           2025-07-08  6759  		}
56a06bd40fab64 Paolo Abeni           2025-07-08  6760  		if (dev->hw_features & NETIF_F_GSO_UDP_TUNNEL &&
56a06bd40fab64 Paolo Abeni           2025-07-08  6761  		    virtio_has_feature(vdev, VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM)) {
56a06bd40fab64 Paolo Abeni           2025-07-08  6762  			dev->hw_features |= NETIF_F_GSO_UDP_TUNNEL_CSUM;
56a06bd40fab64 Paolo Abeni           2025-07-08  6763  			dev->hw_enc_features |= NETIF_F_GSO_UDP_TUNNEL_CSUM;
56a06bd40fab64 Paolo Abeni           2025-07-08  6764  		}
56a06bd40fab64 Paolo Abeni           2025-07-08  6765  
41f2f1273caee2 Jason Wang            2014-12-24  6766  		dev->features |= NETIF_F_GSO_ROBUST;
41f2f1273caee2 Jason Wang            2014-12-24  6767  
98e778c9aa4f4f Michał Mirosław       2011-03-31  6768  		if (gso)
56a06bd40fab64 Paolo Abeni           2025-07-08  6769  			dev->features |= dev->hw_features;
98e778c9aa4f4f Michał Mirosław       2011-03-31  6770  		/* (!csum && gso) case will be fixed by register_netdev() */
296f96fcfc160e Rusty Russell         2007-10-22  6771  	}
604141c036e1b6 Heng Qi               2024-06-17  6772  
604141c036e1b6 Heng Qi               2024-06-17  6773  	/* 1. With VIRTIO_NET_F_GUEST_CSUM negotiation, the driver doesn't
604141c036e1b6 Heng Qi               2024-06-17  6774  	 * need to calculate checksums for partially checksummed packets,
604141c036e1b6 Heng Qi               2024-06-17  6775  	 * as they're considered valid by the upper layer.
604141c036e1b6 Heng Qi               2024-06-17  6776  	 * 2. Without VIRTIO_NET_F_GUEST_CSUM negotiation, the driver only
604141c036e1b6 Heng Qi               2024-06-17  6777  	 * receives fully checksummed packets. The device may assist in
604141c036e1b6 Heng Qi               2024-06-17  6778  	 * validating these packets' checksums, so the driver won't have to.
604141c036e1b6 Heng Qi               2024-06-17  6779  	 */
4f49129be6fa9b Thomas Huth           2013-08-27  6780  	dev->features |= NETIF_F_RXCSUM;
604141c036e1b6 Heng Qi               2024-06-17  6781  
a02e8964eaf927 Willem de Bruijn      2018-12-20  6782  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
a02e8964eaf927 Willem de Bruijn      2018-12-20  6783  	    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
dbcf24d1538844 Jason Wang            2021-08-17  6784  		dev->features |= NETIF_F_GRO_HW;
cf8691cbc28659 Michael S. Tsirkin    2020-10-21  6785  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
dbcf24d1538844 Jason Wang            2021-08-17  6786  		dev->hw_features |= NETIF_F_GRO_HW;
296f96fcfc160e Rusty Russell         2007-10-22  6787  
4fda830263c52a Jason Wang            2013-04-10  6788  	dev->vlan_features = dev->features;
37e0ca657a3dd2 Xuan Zhuo             2024-11-12  6789  	dev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
37e0ca657a3dd2 Xuan Zhuo             2024-11-12  6790  		NETDEV_XDP_ACT_XSK_ZEROCOPY;
4fda830263c52a Jason Wang            2013-04-10  6791  
d0c2c9973ecd26 Jarod Wilson          2016-10-20  6792  	/* MTU range: 68 - 65535 */
d0c2c9973ecd26 Jarod Wilson          2016-10-20  6793  	dev->min_mtu = MIN_MTU;
d0c2c9973ecd26 Jarod Wilson          2016-10-20  6794  	dev->max_mtu = MAX_MTU;
d0c2c9973ecd26 Jarod Wilson          2016-10-20  6795  
296f96fcfc160e Rusty Russell         2007-10-22  6796  	/* Configuration may specify what MAC to use.  Otherwise random. */
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6797  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MAC)) {
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6798  		u8 addr[ETH_ALEN];
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6799  
855e0c5288177b Rusty Russell         2013-10-14  6800  		virtio_cread_bytes(vdev,
a586d4f6016f71 Rusty Russell         2008-02-04  6801  				   offsetof(struct virtio_net_config, mac),
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6802  				   addr, ETH_ALEN);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6803  		eth_hw_addr_set(dev, addr);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6804  	} else {
f2cedb63df1434 Danny Kukawka         2012-02-15  6805  		eth_hw_addr_random(dev);
9f62d221a4b0aa Laurent Vivier        2023-01-27  6806  		dev_info(&vdev->dev, "Assigned random MAC address %pM\n",
9f62d221a4b0aa Laurent Vivier        2023-01-27  6807  			 dev->dev_addr);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  6808  	}
296f96fcfc160e Rusty Russell         2007-10-22  6809  
296f96fcfc160e Rusty Russell         2007-10-22  6810  	/* Set up our device-specific information */
296f96fcfc160e Rusty Russell         2007-10-22  6811  	vi = netdev_priv(dev);
296f96fcfc160e Rusty Russell         2007-10-22  6812  	vi->dev = dev;
296f96fcfc160e Rusty Russell         2007-10-22  6813  	vi->vdev = vdev;
d9d5dcc88ca5c7 Christian Borntraeger 2008-02-18  6814  	vdev->priv = vi;
827da44c61419f John Stultz           2013-10-07  6815  
586d17c5a01bf1 Jason Wang            2012-04-11  6816  	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
b9f7425239a099 Jason Wang            2023-07-20  6817  	INIT_WORK(&vi->rx_mode_work, virtnet_rx_mode_work);
296f96fcfc160e Rusty Russell         2007-10-22  6818  
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  6819  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF)) {
3f2c31d90327f2 Mark McLoughlin       2008-11-16  6820  		vi->mergeable_rx_bufs = true;
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  6821  		dev->xdp_features |= NETDEV_XDP_ACT_RX_SG;
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  6822  	}
3f2c31d90327f2 Mark McLoughlin       2008-11-16  6823  
91f41f01d2195d Andrew Melnychenko    2022-03-28  6824  	if (virtio_has_feature(vdev, VIRTIO_NET_F_HASH_REPORT))
91f41f01d2195d Andrew Melnychenko    2022-03-28  6825  		vi->has_rss_hash_report = true;
91f41f01d2195d Andrew Melnychenko    2022-03-28  6826  
239facd41f0134 Srujana Challa        2026-02-06  6827  	if (virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6828  		vi->has_rss = true;
91f41f01d2195d Andrew Melnychenko    2022-03-28  6829  
059a49aa2e25c5 Breno Leitao          2024-04-03  6830  	if (vi->has_rss || vi->has_rss_hash_report) {
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6831  		vi->rss_key_size =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6832  			virtio_cread8(vdev, offsetof(struct virtio_net_config, rss_max_key_size));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6833  
239facd41f0134 Srujana Challa        2026-02-06  6834  		/* Spec requires at least 40 bytes */
239facd41f0134 Srujana Challa        2026-02-06  6835  		if (vi->rss_key_size < VIRTIO_NET_RSS_MIN_KEY_SIZE) {
239facd41f0134 Srujana Challa        2026-02-06  6836  			dev_warn(&vdev->dev,
239facd41f0134 Srujana Challa        2026-02-06  6837  				 "rss_max_key_size=%u is less than spec minimum %u, disabling RSS\n",
239facd41f0134 Srujana Challa        2026-02-06  6838  				 vi->rss_key_size, VIRTIO_NET_RSS_MIN_KEY_SIZE);
239facd41f0134 Srujana Challa        2026-02-06  6839  			vi->has_rss = false;
239facd41f0134 Srujana Challa        2026-02-06  6840  			vi->has_rss_hash_report = false;
239facd41f0134 Srujana Challa        2026-02-06 @6841  		} else if (vi->rss_key_size > VIRTIO_NET_RSS_MAX_KEY_SIZE) {
239facd41f0134 Srujana Challa        2026-02-06  6842  			dev_warn(&vdev->dev,
239facd41f0134 Srujana Challa        2026-02-06  6843  				 "rss_max_key_size=%u exceeds driver limit %u, disabling RSS\n",
239facd41f0134 Srujana Challa        2026-02-06  6844  				 vi->rss_key_size, VIRTIO_NET_RSS_MAX_KEY_SIZE);
239facd41f0134 Srujana Challa        2026-02-06  6845  			vi->has_rss = false;
239facd41f0134 Srujana Challa        2026-02-06  6846  			vi->has_rss_hash_report = false;
239facd41f0134 Srujana Challa        2026-02-06  6847  		} else {
239facd41f0134 Srujana Challa        2026-02-06  6848  			vi->rss_indir_table_size =
239facd41f0134 Srujana Challa        2026-02-06  6849  				virtio_cread16(vdev, offsetof(struct virtio_net_config,
239facd41f0134 Srujana Challa        2026-02-06  6850  							      rss_max_indirection_table_length));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6851  			vi->rss_hash_types_supported =
239facd41f0134 Srujana Challa        2026-02-06  6852  			    virtio_cread32(vdev, offsetof(struct virtio_net_config,
239facd41f0134 Srujana Challa        2026-02-06  6853  							  supported_hash_types));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6854  			vi->rss_hash_types_supported &=
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6855  					~(VIRTIO_NET_RSS_HASH_TYPE_IP_EX |
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6856  					  VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6857  					  VIRTIO_NET_RSS_HASH_TYPE_UDP_EX);
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6858  
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6859  			dev->hw_features |= NETIF_F_RXHASH;
aa37f8916d20cf Liang Chen            2024-04-17  6860  			dev->xdp_metadata_ops = &virtnet_xdp_metadata_ops;
c7114b1249fa3b Andrew Melnychenko    2022-03-28  6861  		}
239facd41f0134 Srujana Challa        2026-02-06  6862  	}
239facd41f0134 Srujana Challa        2026-02-06  6863  
239facd41f0134 Srujana Challa        2026-02-06  6864  	vi->rss_hdr = devm_kzalloc(&vdev->dev, virtnet_rss_hdr_size(vi), GFP_KERNEL);
239facd41f0134 Srujana Challa        2026-02-06  6865  	if (!vi->rss_hdr) {
239facd41f0134 Srujana Challa        2026-02-06  6866  		err = -ENOMEM;
239facd41f0134 Srujana Challa        2026-02-06  6867  		goto free;
239facd41f0134 Srujana Challa        2026-02-06  6868  	}
91f41f01d2195d Andrew Melnychenko    2022-03-28  6869  
56a06bd40fab64 Paolo Abeni           2025-07-08  6870  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) ||
56a06bd40fab64 Paolo Abeni           2025-07-08  6871  	    virtio_has_feature(vdev, VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO))
56a06bd40fab64 Paolo Abeni           2025-07-08  6872  		vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash_tunnel);
56a06bd40fab64 Paolo Abeni           2025-07-08  6873  	else if (vi->has_rss_hash_report)
91f41f01d2195d Andrew Melnychenko    2022-03-28  6874  		vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
91f41f01d2195d Andrew Melnychenko    2022-03-28  6875  	else if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF) ||
d04302b334bde9 Michael S. Tsirkin    2014-10-24  6876  		 virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
012873d057a449 Michael S. Tsirkin    2014-10-24  6877  		vi->hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
012873d057a449 Michael S. Tsirkin    2014-10-24  6878  	else
012873d057a449 Michael S. Tsirkin    2014-10-24  6879  		vi->hdr_len = sizeof(struct virtio_net_hdr);
012873d057a449 Michael S. Tsirkin    2014-10-24  6880  
56a06bd40fab64 Paolo Abeni           2025-07-08  6881  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM))
56a06bd40fab64 Paolo Abeni           2025-07-08  6882  		vi->rx_tnl_csum = true;
56a06bd40fab64 Paolo Abeni           2025-07-08  6883  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO))
56a06bd40fab64 Paolo Abeni           2025-07-08  6884  		vi->rx_tnl = true;
56a06bd40fab64 Paolo Abeni           2025-07-08  6885  	if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO))
56a06bd40fab64 Paolo Abeni           2025-07-08  6886  		vi->tx_tnl = true;
56a06bd40fab64 Paolo Abeni           2025-07-08  6887  
75993300d008f4 Michael S. Tsirkin    2015-07-15  6888  	if (virtio_has_feature(vdev, VIRTIO_F_ANY_LAYOUT) ||
75993300d008f4 Michael S. Tsirkin    2015-07-15  6889  	    virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
e7428e95a06fb5 Michael S. Tsirkin    2013-07-25  6890  		vi->any_header_sg = true;
e7428e95a06fb5 Michael S. Tsirkin    2013-07-25  6891  
986a4f4d452dec Jason Wang            2012-12-07  6892  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
986a4f4d452dec Jason Wang            2012-12-07  6893  		vi->has_cvq = true;
986a4f4d452dec Jason Wang            2012-12-07  6894  
6f45ab3e0409cf Daniel Jurgens        2024-05-03  6895  	mutex_init(&vi->cvq_lock);
6f45ab3e0409cf Daniel Jurgens        2024-05-03  6896  
14de9d114a82a5 Aaron Conole          2016-06-03  6897  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
14de9d114a82a5 Aaron Conole          2016-06-03  6898  		mtu = virtio_cread16(vdev,
14de9d114a82a5 Aaron Conole          2016-06-03  6899  				     offsetof(struct virtio_net_config,
14de9d114a82a5 Aaron Conole          2016-06-03  6900  					      mtu));
93a205ee98a488 Aaron Conole          2016-10-25  6901  		if (mtu < dev->min_mtu) {
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6902  			/* Should never trigger: MTU was previously validated
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6903  			 * in virtnet_validate.
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6904  			 */
7934b481ab1a36 Yuval Shaia           2019-04-03  6905  			dev_err(&vdev->dev,
7934b481ab1a36 Yuval Shaia           2019-04-03  6906  				"device MTU appears to have changed it is now %d < %d",
7934b481ab1a36 Yuval Shaia           2019-04-03  6907  				mtu, dev->min_mtu);
411ea23a76526e Dan Carpenter         2020-12-04  6908  			err = -EINVAL;
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  6909  			goto free;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6910  		}
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  6911  
d0c2c9973ecd26 Jarod Wilson          2016-10-20  6912  		dev->mtu = mtu;
93a205ee98a488 Aaron Conole          2016-10-25  6913  		dev->max_mtu = mtu;
14de9d114a82a5 Aaron Conole          2016-06-03  6914  	}
14de9d114a82a5 Aaron Conole          2016-06-03  6915  
4959aebba8c069 Gavin Li              2022-09-14  6916  	virtnet_set_big_packets(vi, mtu);
4959aebba8c069 Gavin Li              2022-09-14  6917  
012873d057a449 Michael S. Tsirkin    2014-10-24  6918  	if (vi->any_header_sg)
012873d057a449 Michael S. Tsirkin    2014-10-24  6919  		dev->needed_headroom = vi->hdr_len;
6ebbc1a6383fe7 Zhangjie \(HZ\        2014-04-29  6920) 
44900010290125 Jason Wang            2016-11-25  6921  	/* Enable multiqueue by default */
44900010290125 Jason Wang            2016-11-25  6922  	if (num_online_cpus() >= max_queue_pairs)
44900010290125 Jason Wang            2016-11-25  6923  		vi->curr_queue_pairs = max_queue_pairs;
44900010290125 Jason Wang            2016-11-25  6924  	else
44900010290125 Jason Wang            2016-11-25  6925  		vi->curr_queue_pairs = num_online_cpus();
986a4f4d452dec Jason Wang            2012-12-07  6926  	vi->max_queue_pairs = max_queue_pairs;
986a4f4d452dec Jason Wang            2012-12-07  6927  
986a4f4d452dec Jason Wang            2012-12-07  6928  	/* Allocate/initialize the rx/tx queues, and invoke find_vqs */
3f9c10b0d478a3 Amit Shah             2011-12-22  6929  	err = init_vqs(vi);
d2a7ddda9ffb1c Michael S. Tsirkin    2009-06-12  6930  	if (err)
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  6931  		goto free;
296f96fcfc160e Rusty Russell         2007-10-22  6932  
3014a0d54820d2 Heng Qi               2023-10-08  6933  	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL)) {
3014a0d54820d2 Heng Qi               2023-10-08  6934  		vi->intr_coal_rx.max_usecs = 0;
3014a0d54820d2 Heng Qi               2023-10-08  6935  		vi->intr_coal_tx.max_usecs = 0;
3014a0d54820d2 Heng Qi               2023-10-08  6936  		vi->intr_coal_rx.max_packets = 0;
3014a0d54820d2 Heng Qi               2023-10-08  6937  
3014a0d54820d2 Heng Qi               2023-10-08  6938  		/* Keep the default values of the coalescing parameters
3014a0d54820d2 Heng Qi               2023-10-08  6939  		 * aligned with the default napi_tx state.
3014a0d54820d2 Heng Qi               2023-10-08  6940  		 */
3014a0d54820d2 Heng Qi               2023-10-08  6941  		if (vi->sq[0].napi.weight)
3014a0d54820d2 Heng Qi               2023-10-08  6942  			vi->intr_coal_tx.max_packets = 1;
3014a0d54820d2 Heng Qi               2023-10-08  6943  		else
3014a0d54820d2 Heng Qi               2023-10-08  6944  			vi->intr_coal_tx.max_packets = 0;
3014a0d54820d2 Heng Qi               2023-10-08  6945  	}
3014a0d54820d2 Heng Qi               2023-10-08  6946  
3014a0d54820d2 Heng Qi               2023-10-08  6947  	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_VQ_NOTF_COAL)) {
3014a0d54820d2 Heng Qi               2023-10-08  6948  		/* The reason is the same as VIRTIO_NET_F_NOTF_COAL. */
3014a0d54820d2 Heng Qi               2023-10-08  6949  		for (i = 0; i < vi->max_queue_pairs; i++)
3014a0d54820d2 Heng Qi               2023-10-08  6950  			if (vi->sq[i].napi.weight)
3014a0d54820d2 Heng Qi               2023-10-08  6951  				vi->sq[i].intr_coal.max_packets = 1;
dcb67f6a9ead65 Heng Qi               2024-06-21  6952  
dcb67f6a9ead65 Heng Qi               2024-06-21  6953  		err = virtnet_init_irq_moder(vi);
dcb67f6a9ead65 Heng Qi               2024-06-21  6954  		if (err)
dcb67f6a9ead65 Heng Qi               2024-06-21  6955  			goto free;
3014a0d54820d2 Heng Qi               2023-10-08  6956  	}
3014a0d54820d2 Heng Qi               2023-10-08  6957  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
