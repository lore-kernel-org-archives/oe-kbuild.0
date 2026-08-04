Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3B34CFDD
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 01:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785805721; cv=none; b=kshnS0mIIhHudrL5G00ZNretHOffFPWgHUvlAdS+N/THHEyFvYsSCD6DZ5FPlc0n1KhCdge0nrtOnUwzS2X3NPWZaKz7uynBhxNz1Az1idJ9Pj5JfTQthkFCdxGi7/D2QW61uRqth+PTkC/m0sRjmImNTZ1ohNQVwbU94gP13i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785805721; c=relaxed/simple;
	bh=HZaE1WLG91YEwthpLIOvQHyVNXPnDYfZzGIQSdgv524=;
	h=Date:From:To:Cc:Subject:Message-ID; b=szI1/meSmd2/C8W/Zis+KsWfBA2Le2n0vOezT+bwAWLz8UOTccbNIJx2DALDNh5qV8NuhT4gtU9jlxsAup/OipVvn3j5O+3oT8c60ubBMJ/PiJtDYZ4aeUJxO70F0tWcwu/xHt9B3fYULAMa+X9/8orKbJLV8vIZCMAAlSm4P5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qui1Qm9t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qui1Qm9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785805719; x=1817341719;
  h=date:from:to:cc:subject:message-id;
  bh=HZaE1WLG91YEwthpLIOvQHyVNXPnDYfZzGIQSdgv524=;
  b=Qui1Qm9tiQL+vTFArTBet+4674x2L43fTYiUUYlLVguZKEgYW9J5fL+F
   4UTSF+3CTcJ7LwnbEeCfHEqdqDyn3lpXJrRRD/GEkXRmmjvMJHC+vAJTB
   ya+1tcJN9rsdr9CWbR4U/uDtnkRd/uvyP95E6wa/dyYoyBATe1npSxsyG
   vM6as8fJNRK2k1fcKJ0qkvQ8oOItMRZQ2qAQ3YW1Z6n9J/FCpH5NXXV4F
   oxCm803ZXhvnov58S/XEAHhkHG5S/ACRxMoOMZSK99P5sNaj+Sv8qxs1z
   EYET8pvZ6SIOhLJUktuHECzWd0oEbOBPlcotCcKRj/0owVhYEigsMVe6S
   A==;
X-CSE-ConnectionGUID: fQ6eiazgSL2whau4NQRw7Q==
X-CSE-MsgGUID: yN+6s3ehQ46d36yqh6D4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="88877770"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="88877770"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 18:08:39 -0700
X-CSE-ConnectionGUID: Y2mEHzz0TbqKMhzS+kyL5Q==
X-CSE-MsgGUID: QM5ffZ7+RX2n0kZcTTov6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="258020312"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2026 18:08:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr3dz-000000008YP-44JU;
	Tue, 04 Aug 2026 01:08:35 +0000
Date: Tue, 04 Aug 2026 09:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9403/12137]
 drivers/net/ethernet/airoha/airoha_eth.c:3470:25: sparse: sparse: division by
 zero
Message-ID: <202608040800.45L57Mym-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/airoha/airoha_eth.c:3470:25: sparse: sparse: division by zero"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
commit: 78a35725e533eef0afe83f6f96cffd69be9eaac7 [9403/12137] net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-r121-20260803 (https://download.01.org/0day-ci/archive/20260804/202608040800.45L57Mym-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040800.45L57Mym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608040800.45L57Mym-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/airoha/airoha_eth.c: note: in included file (through include/linux/if_ether.h, include/linux/ethtool.h, include/linux/phy.h, include/linux/of_net.h):
   include/linux/skbuff.h:2904:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/linux/skbuff.h:2904:28: sparse: signed value source
   include/linux/skbuff.h:2904:28: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/linux/skbuff.h:2904:28: sparse: signed value source
>> drivers/net/ethernet/airoha/airoha_eth.c:3470:25: sparse: sparse: division by zero

vim +3470 drivers/net/ethernet/airoha/airoha_eth.c

09bccf56db36501 Lorenzo Bianconi 2025-04-01  3411  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3412  static int airoha_alloc_gdm_device(struct airoha_eth *eth,
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3413  				   struct airoha_gdm_port *port,
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3414  				   int nbq, struct device_node *np)
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3415  {
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3416  	struct net_device *netdev;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3417  	struct airoha_gdm_dev *dev;
78a35725e533eef Lorenzo Bianconi 2026-07-25  3418  	int err, i;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3419  	u8 index;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3420  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3421  	netdev = devm_alloc_etherdev_mqs(eth->dev, sizeof(*dev),
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3422  					 AIROHA_NUM_NETDEV_TX_RINGS,
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3423  					 AIROHA_NUM_RX_RING);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3424  	if (!netdev) {
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3425  		dev_err(eth->dev, "alloc_etherdev failed\n");
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3426  		return -ENOMEM;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3427  	}
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3428  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3429  	netdev->netdev_ops = &airoha_netdev_ops;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3430  	netdev->ethtool_ops = &airoha_ethtool_ops;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3431  	netdev->max_mtu = AIROHA_MAX_MTU;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3432  	netdev->watchdog_timeo = 5 * HZ;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3433  	netdev->hw_features = NETIF_F_IP_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO6 |
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3434  			      NETIF_F_IPV6_CSUM | NETIF_F_SG | NETIF_F_TSO |
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3435  			      NETIF_F_HW_TC;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3436  	netdev->features |= netdev->hw_features;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3437  	netdev->vlan_features = netdev->hw_features;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3438  	SET_NETDEV_DEV(netdev, eth->dev);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3439  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3440  	/* reserve hw queues for HTB offloading */
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3441  	err = netif_set_real_num_tx_queues(netdev, AIROHA_NUM_TX_RING);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3442  	if (err)
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3443  		return err;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3444  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3445  	err = of_get_ethdev_address(np, netdev);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3446  	if (err) {
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3447  		if (err == -EPROBE_DEFER)
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3448  			return err;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3449  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3450  		eth_hw_addr_random(netdev);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3451  		dev_info(eth->dev, "generated random MAC address %pM\n",
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3452  			 netdev->dev_addr);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3453  	}
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3454  
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3455  	/* Allowed nbq for EN7581 on GDM3 port are 4 and 5 for PCIE0
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3456  	 * and PCIE1 respectively.
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3457  	 */
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3458  	index = nbq;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3459  	if (index && airoha_is_7581(eth) && port->id == AIROHA_GDM3_IDX)
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3460  		index -= 4;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3461  
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3462  	if (index >= ARRAY_SIZE(port->devs) || port->devs[index]) {
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3463  		dev_err(eth->dev, "invalid nbq id: %d\n", nbq);
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3464  		return -EINVAL;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3465  	}
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3466  
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3467  	netdev->dev.of_node = of_node_get(np);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3468  	dev = netdev_priv(netdev);
8f4695fb67b259b Lorenzo Bianconi 2026-06-11  3469  	u64_stats_init(&dev->stats.syncp);
78a35725e533eef Lorenzo Bianconi 2026-07-25 @3470  	for (i = 0; i < ARRAY_SIZE(dev->txq_lock); i++)
78a35725e533eef Lorenzo Bianconi 2026-07-25  3471  		spin_lock_init(&dev->txq_lock[i]);
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3472  	dev->port = port;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3473  	dev->eth = eth;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3474  	dev->nbq = nbq;
a9c2ca61fec7706 Lorenzo Bianconi 2026-06-03  3475  	port->devs[index] = dev;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3476  
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3477  	return 0;
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3478  }
ec6c391bcca748b Lorenzo Bianconi 2026-05-27  3479  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
