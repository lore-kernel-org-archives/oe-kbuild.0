Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39088C15
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Mar 2024 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711081096; cv=none; b=DJJy+9J7absmdWV22xozCfIUkChsWk8SDnhwLpZXvYQQHce9pedm408/nx2nbW0HGS0/GcLUS5jmkJZZj3iGlOd6ikmPrx8YfJNteW2v9kxBdF7P+MCmP/ipLxZhDlF/KZRA7H5wVxPrqTG8s/YWq8eqN3UeSoeiimeT9+ZdD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711081096; c=relaxed/simple;
	bh=/CyLzRSs2R8wjdFZikMzx2NBcgNAqm+CYIXqoFUyC5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLmuA9wq3ugUxFG7I4R0/TzDxHTQ/Ntxcm6I/PieMaol+qpa7wN7G1ha8jUSNMTaAzQ/rFYVIBp16ha4uXeaXETNtSzdDOr2Jltpkq07+TUNXpohHNyUs/nbDThWsjZiY9bSJ8o6OLafqYFKsWMO1wSjPag4YHqiHxc0j9l8VNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO2gzoP0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO2gzoP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711081095; x=1742617095;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/CyLzRSs2R8wjdFZikMzx2NBcgNAqm+CYIXqoFUyC5c=;
  b=HO2gzoP0nBHsL2HT0WHASs0Xz6cKvk3k4AMOpBoNfhpxTWT03TqiLXoo
   jN8ioOnbjNqROlF7mmeWksdVf0NAfFqhwAdOJOTgmPTZPmoN1bBPB/6vA
   LCzweRbszSKkWt4qOTdWZf1DIF7N3w9kDWMmKvJgxipN4Zxw5h1iMajVE
   IPwF5MZEZE9r60jDW4lXZ4xjceWQsRqjYMmCoG6GxYToyNrDRz1MzAqKm
   U8y1ESeDff4/4spLNOaLQxun0fbph5m0/OQ74KfYs7gVtx84EL70vWcne
   RU1ifupH5+15z5SGxqzW+aWbxOPhzseUUBk7dYA1G0UEvq5Eej74KoN/V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28586828"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="28586828"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 21:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="14755816"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 21:18:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnWM5-000K1r-1T;
	Fri, 22 Mar 2024 04:18:09 +0000
Date: Fri, 22 Mar 2024 12:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] virtio-net: reduce the CPU consumption of dim worker
Message-ID: <202403221133.J66oueZh-lkp@intel.com>
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
In-Reply-To: <1711021557-58116-3-git-send-email-hengqi@linux.alibaba.com>
References: <1711021557-58116-3-git-send-email-hengqi@linux.alibaba.com>
TO: Heng Qi <hengqi@linux.alibaba.com>
TO: netdev@vger.kernel.org
TO: virtualization@lists.linux.dev
TO: Jason Wang <jasowang@redhat.com>
TO: "Michael S. Tsirkin" <mst@redhat.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S. Miller" <davem@davemloft.net>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Hi Heng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20240321]
[cannot apply to v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heng-Qi/virtio-net-fix-possible-dim-status-unrecoverable/20240321-194759
base:   linus/master
patch link:    https://lore.kernel.org/r/1711021557-58116-3-git-send-email-hengqi%40linux.alibaba.com
patch subject: [PATCH 2/2] virtio-net: reduce the CPU consumption of dim worker
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20240322 (https://download.01.org/0day-ci/archive/20240322/202403221133.J66oueZh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403221133.J66oueZh-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:5031 virtnet_probe() warn: missing error code 'err'

Old smatch warnings:
drivers/net/virtio_net.c:1438 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net.c:1520 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net.c:3943 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4371 virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:4375 virtnet_config_changed_work() error: uninitialized symbol 'v'.

vim +/err +5031 drivers/net/virtio_net.c

d8cd72f1622753 Heng Qi               2024-03-21  4831  
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4832  static int virtnet_probe(struct virtio_device *vdev)
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4833  {
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  4834  	int i, err = -ENOMEM;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4835  	struct net_device *dev;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4836  	struct virtnet_info *vi;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4837  	u16 max_queue_pairs;
4959aebba8c069 Gavin Li              2022-09-14  4838  	int mtu = 0;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4839  
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4840  	/* Find if host supports multiqueue/rss virtio_net device */
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4841  	max_queue_pairs = 1;
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4842  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MQ) || virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4843  		max_queue_pairs =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4844  		     virtio_cread16(vdev, offsetof(struct virtio_net_config, max_virtqueue_pairs));
986a4f4d452dec Jason Wang            2012-12-07  4845  
986a4f4d452dec Jason Wang            2012-12-07  4846  	/* We need at least 2 queue's */
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4847  	if (max_queue_pairs < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
986a4f4d452dec Jason Wang            2012-12-07  4848  	    max_queue_pairs > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
986a4f4d452dec Jason Wang            2012-12-07  4849  	    !virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
986a4f4d452dec Jason Wang            2012-12-07  4850  		max_queue_pairs = 1;
296f96fcfc160e Rusty Russell         2007-10-22  4851  
296f96fcfc160e Rusty Russell         2007-10-22  4852  	/* Allocate ourselves a network device with room for our info */
986a4f4d452dec Jason Wang            2012-12-07  4853  	dev = alloc_etherdev_mq(sizeof(struct virtnet_info), max_queue_pairs);
296f96fcfc160e Rusty Russell         2007-10-22  4854  	if (!dev)
296f96fcfc160e Rusty Russell         2007-10-22  4855  		return -ENOMEM;
296f96fcfc160e Rusty Russell         2007-10-22  4856  
296f96fcfc160e Rusty Russell         2007-10-22  4857  	/* Set up network device as normal. */
ab5bd583b92896 Xuan Zhuo             2021-02-18  4858  	dev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE |
ab5bd583b92896 Xuan Zhuo             2021-02-18  4859  			   IFF_TX_SKB_NO_LINEAR;
76288b4e573e06 Stephen Hemminger     2009-01-06  4860  	dev->netdev_ops = &virtnet_netdev;
296f96fcfc160e Rusty Russell         2007-10-22  4861  	dev->features = NETIF_F_HIGHDMA;
3fa2a1df909482 stephen hemminger     2011-06-15  4862  
7ad24ea4bf620a Wilfried Klaebe       2014-05-11  4863  	dev->ethtool_ops = &virtnet_ethtool_ops;
296f96fcfc160e Rusty Russell         2007-10-22  4864  	SET_NETDEV_DEV(dev, &vdev->dev);
296f96fcfc160e Rusty Russell         2007-10-22  4865  
296f96fcfc160e Rusty Russell         2007-10-22  4866  	/* Do we support "hardware" checksums? */
98e778c9aa4f4f Michał Mirosław       2011-03-31  4867  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CSUM)) {
296f96fcfc160e Rusty Russell         2007-10-22  4868  		/* This opens up the world of extra features. */
48900cb6af4282 Jason Wang            2015-08-05  4869  		dev->hw_features |= NETIF_F_HW_CSUM | NETIF_F_SG;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4870  		if (csum)
48900cb6af4282 Jason Wang            2015-08-05  4871  			dev->features |= NETIF_F_HW_CSUM | NETIF_F_SG;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4872  
98e778c9aa4f4f Michał Mirosław       2011-03-31  4873  		if (virtio_has_feature(vdev, VIRTIO_NET_F_GSO)) {
e078de03788353 David S. Miller       2017-07-03  4874  			dev->hw_features |= NETIF_F_TSO
34a48579e4fb38 Rusty Russell         2008-02-04  4875  				| NETIF_F_TSO_ECN | NETIF_F_TSO6;
34a48579e4fb38 Rusty Russell         2008-02-04  4876  		}
5539ae9613587e Rusty Russell         2008-05-02  4877  		/* Individual feature bits: what can host handle? */
98e778c9aa4f4f Michał Mirosław       2011-03-31  4878  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO4))
98e778c9aa4f4f Michał Mirosław       2011-03-31  4879  			dev->hw_features |= NETIF_F_TSO;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4880  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_TSO6))
98e778c9aa4f4f Michał Mirosław       2011-03-31  4881  			dev->hw_features |= NETIF_F_TSO6;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4882  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_ECN))
98e778c9aa4f4f Michał Mirosław       2011-03-31  4883  			dev->hw_features |= NETIF_F_TSO_ECN;
418044e1de3063 Andrew Melnychenko    2022-12-07  4884  		if (virtio_has_feature(vdev, VIRTIO_NET_F_HOST_USO))
418044e1de3063 Andrew Melnychenko    2022-12-07  4885  			dev->hw_features |= NETIF_F_GSO_UDP_L4;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4886  
41f2f1273caee2 Jason Wang            2014-12-24  4887  		dev->features |= NETIF_F_GSO_ROBUST;
41f2f1273caee2 Jason Wang            2014-12-24  4888  
98e778c9aa4f4f Michał Mirosław       2011-03-31  4889  		if (gso)
e078de03788353 David S. Miller       2017-07-03  4890  			dev->features |= dev->hw_features & NETIF_F_ALL_TSO;
98e778c9aa4f4f Michał Mirosław       2011-03-31  4891  		/* (!csum && gso) case will be fixed by register_netdev() */
296f96fcfc160e Rusty Russell         2007-10-22  4892  	}
4f49129be6fa9b Thomas Huth           2013-08-27  4893  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_CSUM))
4f49129be6fa9b Thomas Huth           2013-08-27  4894  		dev->features |= NETIF_F_RXCSUM;
a02e8964eaf927 Willem de Bruijn      2018-12-20  4895  	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
a02e8964eaf927 Willem de Bruijn      2018-12-20  4896  	    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
dbcf24d1538844 Jason Wang            2021-08-17  4897  		dev->features |= NETIF_F_GRO_HW;
cf8691cbc28659 Michael S. Tsirkin    2020-10-21  4898  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
dbcf24d1538844 Jason Wang            2021-08-17  4899  		dev->hw_features |= NETIF_F_GRO_HW;
296f96fcfc160e Rusty Russell         2007-10-22  4900  
4fda830263c52a Jason Wang            2013-04-10  4901  	dev->vlan_features = dev->features;
66c0e13ad236c7 Marek Majtyka         2023-02-01  4902  	dev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT;
4fda830263c52a Jason Wang            2013-04-10  4903  
d0c2c9973ecd26 Jarod Wilson          2016-10-20  4904  	/* MTU range: 68 - 65535 */
d0c2c9973ecd26 Jarod Wilson          2016-10-20  4905  	dev->min_mtu = MIN_MTU;
d0c2c9973ecd26 Jarod Wilson          2016-10-20  4906  	dev->max_mtu = MAX_MTU;
d0c2c9973ecd26 Jarod Wilson          2016-10-20  4907  
296f96fcfc160e Rusty Russell         2007-10-22  4908  	/* Configuration may specify what MAC to use.  Otherwise random. */
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4909  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MAC)) {
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4910  		u8 addr[ETH_ALEN];
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4911  
855e0c5288177b Rusty Russell         2013-10-14  4912  		virtio_cread_bytes(vdev,
a586d4f6016f71 Rusty Russell         2008-02-04  4913  				   offsetof(struct virtio_net_config, mac),
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4914  				   addr, ETH_ALEN);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4915  		eth_hw_addr_set(dev, addr);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4916  	} else {
f2cedb63df1434 Danny Kukawka         2012-02-15  4917  		eth_hw_addr_random(dev);
9f62d221a4b0aa Laurent Vivier        2023-01-27  4918  		dev_info(&vdev->dev, "Assigned random MAC address %pM\n",
9f62d221a4b0aa Laurent Vivier        2023-01-27  4919  			 dev->dev_addr);
f2edaa4ad5d513 Jakub Kicinski        2021-10-27  4920  	}
296f96fcfc160e Rusty Russell         2007-10-22  4921  
296f96fcfc160e Rusty Russell         2007-10-22  4922  	/* Set up our device-specific information */
296f96fcfc160e Rusty Russell         2007-10-22  4923  	vi = netdev_priv(dev);
296f96fcfc160e Rusty Russell         2007-10-22  4924  	vi->dev = dev;
296f96fcfc160e Rusty Russell         2007-10-22  4925  	vi->vdev = vdev;
d9d5dcc88ca5c7 Christian Borntraeger 2008-02-18  4926  	vdev->priv = vi;
827da44c61419f John Stultz           2013-10-07  4927  
586d17c5a01bf1 Jason Wang            2012-04-11  4928  	INIT_WORK(&vi->config_work, virtnet_config_changed_work);
b9f7425239a099 Jason Wang            2023-07-20  4929  	INIT_WORK(&vi->rx_mode_work, virtnet_rx_mode_work);
5a159128faff15 Jason Wang            2022-07-25  4930  	spin_lock_init(&vi->refill_lock);
296f96fcfc160e Rusty Russell         2007-10-22  4931  
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  4932  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF)) {
3f2c31d90327f2 Mark McLoughlin       2008-11-16  4933  		vi->mergeable_rx_bufs = true;
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  4934  		dev->xdp_features |= NETDEV_XDP_ACT_RX_SG;
30bbf891f1b8fd Lorenzo Bianconi      2023-02-07  4935  	}
3f2c31d90327f2 Mark McLoughlin       2008-11-16  4936  
91f41f01d2195d Andrew Melnychenko    2022-03-28  4937  	if (virtio_has_feature(vdev, VIRTIO_NET_F_HASH_REPORT))
91f41f01d2195d Andrew Melnychenko    2022-03-28  4938  		vi->has_rss_hash_report = true;
91f41f01d2195d Andrew Melnychenko    2022-03-28  4939  
91f41f01d2195d Andrew Melnychenko    2022-03-28  4940  	if (virtio_has_feature(vdev, VIRTIO_NET_F_RSS))
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4941  		vi->has_rss = true;
91f41f01d2195d Andrew Melnychenko    2022-03-28  4942  
91f41f01d2195d Andrew Melnychenko    2022-03-28  4943  	if (vi->has_rss || vi->has_rss_hash_report) {
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4944  		vi->rss_indir_table_size =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4945  			virtio_cread16(vdev, offsetof(struct virtio_net_config,
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4946  				rss_max_indirection_table_length));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4947  		vi->rss_key_size =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4948  			virtio_cread8(vdev, offsetof(struct virtio_net_config, rss_max_key_size));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4949  
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4950  		vi->rss_hash_types_supported =
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4951  		    virtio_cread32(vdev, offsetof(struct virtio_net_config, supported_hash_types));
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4952  		vi->rss_hash_types_supported &=
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4953  				~(VIRTIO_NET_RSS_HASH_TYPE_IP_EX |
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4954  				  VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4955  				  VIRTIO_NET_RSS_HASH_TYPE_UDP_EX);
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4956  
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4957  		dev->hw_features |= NETIF_F_RXHASH;
c7114b1249fa3b Andrew Melnychenko    2022-03-28  4958  	}
91f41f01d2195d Andrew Melnychenko    2022-03-28  4959  
91f41f01d2195d Andrew Melnychenko    2022-03-28  4960  	if (vi->has_rss_hash_report)
91f41f01d2195d Andrew Melnychenko    2022-03-28  4961  		vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
91f41f01d2195d Andrew Melnychenko    2022-03-28  4962  	else if (virtio_has_feature(vdev, VIRTIO_NET_F_MRG_RXBUF) ||
d04302b334bde9 Michael S. Tsirkin    2014-10-24  4963  		 virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
012873d057a449 Michael S. Tsirkin    2014-10-24  4964  		vi->hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
012873d057a449 Michael S. Tsirkin    2014-10-24  4965  	else
012873d057a449 Michael S. Tsirkin    2014-10-24  4966  		vi->hdr_len = sizeof(struct virtio_net_hdr);
012873d057a449 Michael S. Tsirkin    2014-10-24  4967  
75993300d008f4 Michael S. Tsirkin    2015-07-15  4968  	if (virtio_has_feature(vdev, VIRTIO_F_ANY_LAYOUT) ||
75993300d008f4 Michael S. Tsirkin    2015-07-15  4969  	    virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
e7428e95a06fb5 Michael S. Tsirkin    2013-07-25  4970  		vi->any_header_sg = true;
e7428e95a06fb5 Michael S. Tsirkin    2013-07-25  4971  
986a4f4d452dec Jason Wang            2012-12-07  4972  	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
986a4f4d452dec Jason Wang            2012-12-07  4973  		vi->has_cvq = true;
986a4f4d452dec Jason Wang            2012-12-07  4974  
14de9d114a82a5 Aaron Conole          2016-06-03  4975  	if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
14de9d114a82a5 Aaron Conole          2016-06-03  4976  		mtu = virtio_cread16(vdev,
14de9d114a82a5 Aaron Conole          2016-06-03  4977  				     offsetof(struct virtio_net_config,
14de9d114a82a5 Aaron Conole          2016-06-03  4978  					      mtu));
93a205ee98a488 Aaron Conole          2016-10-25  4979  		if (mtu < dev->min_mtu) {
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4980  			/* Should never trigger: MTU was previously validated
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4981  			 * in virtnet_validate.
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4982  			 */
7934b481ab1a36 Yuval Shaia           2019-04-03  4983  			dev_err(&vdev->dev,
7934b481ab1a36 Yuval Shaia           2019-04-03  4984  				"device MTU appears to have changed it is now %d < %d",
7934b481ab1a36 Yuval Shaia           2019-04-03  4985  				mtu, dev->min_mtu);
411ea23a76526e Dan Carpenter         2020-12-04  4986  			err = -EINVAL;
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  4987  			goto free;
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4988  		}
fe36cbe0671e86 Michael S. Tsirkin    2017-03-29  4989  
d0c2c9973ecd26 Jarod Wilson          2016-10-20  4990  		dev->mtu = mtu;
93a205ee98a488 Aaron Conole          2016-10-25  4991  		dev->max_mtu = mtu;
14de9d114a82a5 Aaron Conole          2016-06-03  4992  	}
14de9d114a82a5 Aaron Conole          2016-06-03  4993  
4959aebba8c069 Gavin Li              2022-09-14  4994  	virtnet_set_big_packets(vi, mtu);
4959aebba8c069 Gavin Li              2022-09-14  4995  
012873d057a449 Michael S. Tsirkin    2014-10-24  4996  	if (vi->any_header_sg)
012873d057a449 Michael S. Tsirkin    2014-10-24  4997  		dev->needed_headroom = vi->hdr_len;
6ebbc1a6383fe7 Zhangjie \(HZ\        2014-04-29  4998) 
44900010290125 Jason Wang            2016-11-25  4999  	/* Enable multiqueue by default */
44900010290125 Jason Wang            2016-11-25  5000  	if (num_online_cpus() >= max_queue_pairs)
44900010290125 Jason Wang            2016-11-25  5001  		vi->curr_queue_pairs = max_queue_pairs;
44900010290125 Jason Wang            2016-11-25  5002  	else
44900010290125 Jason Wang            2016-11-25  5003  		vi->curr_queue_pairs = num_online_cpus();
986a4f4d452dec Jason Wang            2012-12-07  5004  	vi->max_queue_pairs = max_queue_pairs;
986a4f4d452dec Jason Wang            2012-12-07  5005  
986a4f4d452dec Jason Wang            2012-12-07  5006  	/* Allocate/initialize the rx/tx queues, and invoke find_vqs */
3f9c10b0d478a3 Amit Shah             2011-12-22  5007  	err = init_vqs(vi);
d2a7ddda9ffb1c Michael S. Tsirkin    2009-06-12  5008  	if (err)
d7dfc5cf56b0e3 Toshiaki Makita       2018-01-17  5009  		goto free;
296f96fcfc160e Rusty Russell         2007-10-22  5010  
3014a0d54820d2 Heng Qi               2023-10-08  5011  	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_NOTF_COAL)) {
3014a0d54820d2 Heng Qi               2023-10-08  5012  		vi->intr_coal_rx.max_usecs = 0;
3014a0d54820d2 Heng Qi               2023-10-08  5013  		vi->intr_coal_tx.max_usecs = 0;
3014a0d54820d2 Heng Qi               2023-10-08  5014  		vi->intr_coal_rx.max_packets = 0;
3014a0d54820d2 Heng Qi               2023-10-08  5015  
3014a0d54820d2 Heng Qi               2023-10-08  5016  		/* Keep the default values of the coalescing parameters
3014a0d54820d2 Heng Qi               2023-10-08  5017  		 * aligned with the default napi_tx state.
3014a0d54820d2 Heng Qi               2023-10-08  5018  		 */
3014a0d54820d2 Heng Qi               2023-10-08  5019  		if (vi->sq[0].napi.weight)
3014a0d54820d2 Heng Qi               2023-10-08  5020  			vi->intr_coal_tx.max_packets = 1;
3014a0d54820d2 Heng Qi               2023-10-08  5021  		else
3014a0d54820d2 Heng Qi               2023-10-08  5022  			vi->intr_coal_tx.max_packets = 0;
3014a0d54820d2 Heng Qi               2023-10-08  5023  	}
3014a0d54820d2 Heng Qi               2023-10-08  5024  
d8cd72f1622753 Heng Qi               2024-03-21  5025  	INIT_LIST_HEAD(&vi->coal_list);
3014a0d54820d2 Heng Qi               2023-10-08  5026  	if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_VQ_NOTF_COAL)) {
d8cd72f1622753 Heng Qi               2024-03-21  5027  		vi->cvq_cmd_nums = 0;
d8cd72f1622753 Heng Qi               2024-03-21  5028  		vi->dim_loop_index = 0;
d8cd72f1622753 Heng Qi               2024-03-21  5029  
d8cd72f1622753 Heng Qi               2024-03-21  5030  		if (virtnet_init_coal_list(vi))
d8cd72f1622753 Heng Qi               2024-03-21 @5031  			goto free;
d8cd72f1622753 Heng Qi               2024-03-21  5032  
3014a0d54820d2 Heng Qi               2023-10-08  5033  		/* The reason is the same as VIRTIO_NET_F_NOTF_COAL. */
d8cd72f1622753 Heng Qi               2024-03-21  5034  		for (i = 0; i < vi->max_queue_pairs; i++) {
d8cd72f1622753 Heng Qi               2024-03-21  5035  			vi->rq[i].packets_in_napi = 0;
3014a0d54820d2 Heng Qi               2023-10-08  5036  			if (vi->sq[i].napi.weight)
3014a0d54820d2 Heng Qi               2023-10-08  5037  				vi->sq[i].intr_coal.max_packets = 1;
3014a0d54820d2 Heng Qi               2023-10-08  5038  		}
d8cd72f1622753 Heng Qi               2024-03-21  5039  	}
3014a0d54820d2 Heng Qi               2023-10-08  5040  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
