Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53A15278E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785257; cv=none; b=JcA4I5QiRQNsED2uv4r0xDpIX8INPJY0SpYM6Zg8p9eo2KIecFdUp/zWpKu2C3n/MEWNmQKWxLWxIpjPWwvj68e6rCl5iO1BMLCxSM1uXazafSGls3tAwt1mqh4RXuWTNjzs5r7vwbJmvemQoab4lvadQLEIuULNWnRD55sxAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785257; c=relaxed/simple;
	bh=9Yhd5cLtfxBx+jW/WC39F/yt4oIpSv1rPWs66UTjCJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkrI9GwhWxB91+GDD+fASLITg65tGlAdFxezlBr5GE/00GNZgEkmiju9ZQtjnBtv+PyV3USdN3F6iNroc47HQDvV03EDlTKqFP2VACpadUy+LYzrRFe8Twbzz2ha3zYSLk9UQyMQXjHk/SL68utQ89ePIW92nP52eOguIW7oAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPSKlTDy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPSKlTDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749785254; x=1781321254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Yhd5cLtfxBx+jW/WC39F/yt4oIpSv1rPWs66UTjCJ8=;
  b=mPSKlTDyIemFHKEiO62/zzKkb0msIQiVKBMaYX6vA9JhYC13J5Fr3rd6
   2tWHZxJ5j5dn8AzDXl28AMp/h42Pu/eXtZ9Gfd4E+Z5W9v/9GmO4GjRw5
   nvOXsyVMXJLmk28xo9YG8Rs0sBXiqBCz447YcFaxKoq9yq/rxMloyHVu7
   RJ1/RBHCMyzwTX5NsGpOrG0qJoOsJ4rX39+xtCgOcA2WcvZemybrWV5bY
   RsTqZ0YW6Y4R81cBBVtmnFqoor2mieC5tn7OdCtbRNQitx2+mt4jmIFSF
   00NrucS4bAlwTFj7EEAR9e7gnHmYUqtiV5I51m6OEL9hydZFKzjBdnpGU
   Q==;
X-CSE-ConnectionGUID: yGH/vNzxRkSHRHazDkhb/A==
X-CSE-MsgGUID: BGF7NSNoRMGcEGL1j2SukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52087039"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="52087039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 20:27:34 -0700
X-CSE-ConnectionGUID: 3V2lGuEzRJqziJP8AAeq9A==
X-CSE-MsgGUID: wbZnq5qGQM6XFgvKpE3n0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152610841"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 20:27:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPv4k-000CBq-0O;
	Fri, 13 Jun 2025 03:27:30 +0000
Date: Fri, 13 Jun 2025 11:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 4/9] net: ethtool: add dedicated callbacks for
 getting and setting rxfh fields
Message-ID: <202506131104.4D5TmGvi-lkp@intel.com>
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
In-Reply-To: <20250611145949.2674086-5-kuba@kernel.org>
References: <20250611145949.2674086-5-kuba@kernel.org>
TO: Jakub Kicinski <kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-ethtool-copy-the-rxfh-flow-handling/20250611-231716
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250611145949.2674086-5-kuba%40kernel.org
patch subject: [PATCH net-next 4/9] net: ethtool: add dedicated callbacks for getting and setting rxfh fields
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131104.4D5TmGvi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506131104.4D5TmGvi-lkp@intel.com/

smatch warnings:
net/ethtool/ioctl.c:1592 ethtool_set_rxfh() error: we previously assumed 'ops->get_rxnfc' could be null (see line 1530)

vim +1592 net/ethtool/ioctl.c

28c8757a792bbbc net/ethtool/ioctl.c Jakub Kicinski  2024-07-11  1512  
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1513  static noinline_for_stack int ethtool_set_rxfh(struct net_device *dev,
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1514  					       void __user *useraddr)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1515  {
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1516  	u32 rss_cfg_offset = offsetof(struct ethtool_rxfh, rss_config[0]);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1517  	const struct ethtool_ops *ops = dev->ethtool_ops;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1518  	u32 dev_indir_size = 0, dev_key_size = 0, i;
7195f0ef7f5b8c6 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1519  	u32 user_indir_len = 0, indir_bytes = 0;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1520  	struct ethtool_rxfh_param rxfh_dev = {};
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1521  	struct ethtool_rxfh_context *ctx = NULL;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1522  	struct netlink_ext_ack *extack = NULL;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1523  	struct ethtool_rxnfc rx_rings;
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1524  	struct ethtool_rxfh rxfh;
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1525  	bool locked = false; /* dev->ethtool->rss_lock taken */
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1526  	bool create = false;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1527  	u8 *rss_config;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1528  	int ret;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1529  
65107e14ebb8971 net/ethtool/ioctl.c Jakub Kicinski  2025-06-11 @1530  	if ((!ops->get_rxnfc && !ops->get_rxfh_fields) || !ops->set_rxfh)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1531  		return -EOPNOTSUPP;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1532  
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1533  	if (ops->get_rxfh_indir_size)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1534  		dev_indir_size = ops->get_rxfh_indir_size(dev);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1535  	if (ops->get_rxfh_key_size)
d340c862e760815 net/core/ethtool.c  Dan Carpenter   2015-02-20  1536  		dev_key_size = ops->get_rxfh_key_size(dev);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1537  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1538  	if (copy_from_user(&rxfh, useraddr, sizeof(rxfh)))
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1539  		return -EFAULT;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1540  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1541  	/* Check that reserved fields are 0 for now */
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1542  	if (rxfh.rsvd8[0] || rxfh.rsvd8[1] || rxfh.rsvd32)
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1543  		return -EINVAL;
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1544  	/* Most drivers don't handle rss_context, check it's 0 as well */
ce056504e2e53b2 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1545  	if (rxfh.rss_context && !(ops->cap_rss_ctx_supported ||
ce056504e2e53b2 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1546  				  ops->create_rxfh_context))
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1547  		return -EOPNOTSUPP;
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1548  	/* Check input data transformation capabilities */
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1549  	if (rxfh.input_xfrm && rxfh.input_xfrm != RXH_XFRM_SYM_XOR &&
ecdff893384cf16 net/ethtool/ioctl.c Gal Pressman    2025-02-24  1550  	    rxfh.input_xfrm != RXH_XFRM_SYM_OR_XOR &&
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1551  	    rxfh.input_xfrm != RXH_XFRM_NO_CHANGE)
948f97f9d8d2aa3 net/ethtool/ioctl.c Ahmed Zaki      2024-01-04  1552  		return -EINVAL;
503757c809281a2 net/ethtool/ioctl.c Saeed Mahameed  2024-07-10  1553  	if (rxfh.input_xfrm != RXH_XFRM_NO_CHANGE &&
ecdff893384cf16 net/ethtool/ioctl.c Gal Pressman    2025-02-24  1554  	    rxfh.input_xfrm & ~ops->supported_input_xfrm)
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1555  		return -EOPNOTSUPP;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1556  	create = rxfh.rss_context == ETH_RXFH_CONTEXT_ALLOC;
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1557  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1558  	if ((rxfh.indir_size &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1559  	     rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1560  	     rxfh.indir_size != dev_indir_size) ||
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1561  	    (rxfh.key_size && rxfh.key_size != dev_key_size))
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1562  		return -EINVAL;
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1563  
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1564  	/* Must request at least one change: indir size, hash key, function
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1565  	 * or input transformation.
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1566  	 * There's no need for any of it in case of context creation.
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1567  	 */
4d7c3c1aba3ca12 net/ethtool/ioctl.c Gal Pressman    2024-08-07  1568  	if (!create &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1569  	    (rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE &&
0dd415d155050f5 net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1570  	     rxfh.key_size == 0 && rxfh.hfunc == ETH_RSS_HASH_NO_CHANGE &&
0dd415d155050f5 net/ethtool/ioctl.c Ahmed Zaki      2023-12-21  1571  	     rxfh.input_xfrm == RXH_XFRM_NO_CHANGE))
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1572  		return -EINVAL;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1573  
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1574  	ret = ethtool_check_flow_types(dev, rxfh.input_xfrm);
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1575  	if (ret)
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1576  		return ret;
1b2900db0119c02 net/ethtool/ioctl.c Gal Pressman    2025-05-08  1577  
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1578  	indir_bytes = dev_indir_size * sizeof(rxfh_dev.indir[0]);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1579  
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1580  	/* Check settings which may be global rather than per RSS-context */
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1581  	if (rxfh.rss_context && !ops->rxfh_per_ctx_key)
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1582  		if (rxfh.key_size ||
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1583  		    (rxfh.hfunc && rxfh.hfunc != ETH_RSS_HASH_NO_CHANGE) ||
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1584  		    (rxfh.input_xfrm && rxfh.input_xfrm != RXH_XFRM_NO_CHANGE))
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1585  			return -EOPNOTSUPP;
ec6e57beaf8bc64 net/ethtool/ioctl.c Jakub Kicinski  2024-08-09  1586  
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1587  	rss_config = kzalloc(indir_bytes + dev_key_size, GFP_USER);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1588  	if (!rss_config)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1589  		return -ENOMEM;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1590  
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1591  	rx_rings.cmd = ETHTOOL_GRXRINGS;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21 @1592  	ret = ops->get_rxnfc(dev, &rx_rings, NULL);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1593  	if (ret)
7850f63f1620512 net/core/ethtool.c  Ben Hutchings   2011-12-15  1594  		goto out;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1595  
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1596  	/* rxfh.indir_size == 0 means reset the indir table to default (master
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1597  	 * context) or delete the context (other RSS contexts).
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1598  	 * rxfh.indir_size == ETH_RXFH_INDIR_NO_CHANGE means leave it unchanged.
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1599  	 */
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1600  	if (rxfh.indir_size &&
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1601  	    rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE) {
7195f0ef7f5b8c6 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1602  		user_indir_len = indir_bytes;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1603  		rxfh_dev.indir = (u32 *)rss_config;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1604  		rxfh_dev.indir_size = dev_indir_size;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1605  		ret = ethtool_copy_validate_indir(rxfh_dev.indir,
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1606  						  useraddr + rss_cfg_offset,
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1607  						  &rx_rings,
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1608  						  rxfh.indir_size);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1609  		if (ret)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1610  			goto out;
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1611  	} else if (rxfh.indir_size == 0) {
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1612  		if (rxfh.rss_context == 0) {
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1613  			u32 *indir;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1614  
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1615  			rxfh_dev.indir = (u32 *)rss_config;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1616  			rxfh_dev.indir_size = dev_indir_size;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1617  			indir = rxfh_dev.indir;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1618  			for (i = 0; i < dev_indir_size; i++)
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1619  				indir[i] = ethtool_rxfh_indir_default(i, rx_rings.data);
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1620  		} else {
dcd8dbf9e734eb3 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1621  			rxfh_dev.rss_delete = true;
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1622  		}
7850f63f1620512 net/core/ethtool.c  Ben Hutchings   2011-12-15  1623  	}
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1624  
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1625  	if (rxfh.key_size) {
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1626  		rxfh_dev.key_size = dev_key_size;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1627  		rxfh_dev.key = rss_config + indir_bytes;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1628  		if (copy_from_user(rxfh_dev.key,
7195f0ef7f5b8c6 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1629  				   useraddr + rss_cfg_offset + user_indir_len,
f062a3844845d26 net/core/ethtool.c  Ben Hutchings   2014-05-15  1630  				   rxfh.key_size)) {
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1631  			ret = -EFAULT;
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1632  			goto out;
7850f63f1620512 net/core/ethtool.c  Ben Hutchings   2011-12-15  1633  		}
278bc4296bd64ff net/core/ethtool.c  Ben Hutchings   2011-12-15  1634  	}
7850f63f1620512 net/core/ethtool.c  Ben Hutchings   2011-12-15  1635  
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1636  	if (rxfh.rss_context) {
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1637  		mutex_lock(&dev->ethtool->rss_lock);
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1638  		locked = true;
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1639  	}
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1640  
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1641  	if (rxfh.rss_context && rxfh_dev.rss_delete) {
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1642  		ret = ethtool_check_rss_ctx_busy(dev, rxfh.rss_context);
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1643  		if (ret)
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1644  			goto out;
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1645  	}
42dc431f5d0ea9e net/ethtool/ioctl.c Daniel Zahka    2024-10-11  1646  
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1647  	if (create) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1648  		if (rxfh_dev.rss_delete) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1649  			ret = -EINVAL;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1650  			goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1651  		}
28c8757a792bbbc net/ethtool/ioctl.c Jakub Kicinski  2024-07-11  1652  		ctx = ethtool_rxfh_ctx_alloc(ops, dev_indir_size, dev_key_size);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1653  		if (!ctx) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1654  			ret = -ENOMEM;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1655  			goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1656  		}
28c8757a792bbbc net/ethtool/ioctl.c Jakub Kicinski  2024-07-11  1657  
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1658  		if (ops->create_rxfh_context) {
b54de55990b0467 net/ethtool/ioctl.c Edward Cree     2024-08-07  1659  			u32 limit = ops->rxfh_max_num_contexts ?: U32_MAX;
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1660  			u32 ctx_id;
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1661  
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1662  			/* driver uses new API, core allocates ID */
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1663  			ret = xa_alloc(&dev->ethtool->rss_ctx, &ctx_id, ctx,
b54de55990b0467 net/ethtool/ioctl.c Edward Cree     2024-08-07  1664  				       XA_LIMIT(1, limit - 1),
b54de55990b0467 net/ethtool/ioctl.c Edward Cree     2024-08-07  1665  				       GFP_KERNEL_ACCOUNT);
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1666  			if (ret < 0) {
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1667  				kfree(ctx);
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1668  				goto out;
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1669  			}
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1670  			WARN_ON(!ctx_id); /* can't happen */
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1671  			rxfh.rss_context = ctx_id;
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1672  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1673  	} else if (rxfh.rss_context) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1674  		ctx = xa_load(&dev->ethtool->rss_ctx, rxfh.rss_context);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1675  		if (!ctx) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1676  			ret = -ENOENT;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1677  			goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1678  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1679  	}
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1680  	rxfh_dev.hfunc = rxfh.hfunc;
dcd8dbf9e734eb3 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1681  	rxfh_dev.rss_context = rxfh.rss_context;
13e59344fb9d3c9 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1682  	rxfh_dev.input_xfrm = rxfh.input_xfrm;
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1683  
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1684  	if (rxfh.rss_context && ops->create_rxfh_context) {
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1685  		if (create) {
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1686  			ret = ops->create_rxfh_context(dev, ctx, &rxfh_dev,
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1687  						       extack);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1688  			/* Make sure driver populates defaults */
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1689  			WARN_ON_ONCE(!ret && !rxfh_dev.key &&
5c2ab978f9c9038 net/ethtool/ioctl.c Daniel Zahka    2024-10-03  1690  				     ops->rxfh_per_ctx_key &&
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1691  				     !memchr_inv(ethtool_rxfh_context_key(ctx),
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1692  						 0, ctx->key_size));
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1693  		} else if (rxfh_dev.rss_delete) {
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1694  			ret = ops->remove_rxfh_context(dev, ctx,
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1695  						       rxfh.rss_context,
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1696  						       extack);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1697  		} else {
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1698  			ret = ops->modify_rxfh_context(dev, ctx, &rxfh_dev,
30a32cdf6b13035 net/ethtool/ioctl.c Edward Cree     2024-06-27  1699  						       extack);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1700  		}
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1701  	} else {
fb6e30a72539ce2 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1702  		ret = ops->set_rxfh(dev, &rxfh_dev, extack);
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1703  	}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1704  	if (ret) {
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1705  		if (create) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1706  			/* failed to create, free our new tracking entry */
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1707  			if (ops->create_rxfh_context)
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1708  				xa_erase(&dev->ethtool->rss_ctx, rxfh.rss_context);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1709  			kfree(ctx);
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1710  		}
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1711  		goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1712  	}
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1713  
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1714  	if (copy_to_user(useraddr + offsetof(struct ethtool_rxfh, rss_context),
dcd8dbf9e734eb3 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1715  			 &rxfh_dev.rss_context, sizeof(rxfh_dev.rss_context)))
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1716  		ret = -EFAULT;
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1717  
dcd8dbf9e734eb3 net/ethtool/ioctl.c Ahmed Zaki      2023-12-12  1718  	if (!rxfh_dev.rss_context) {
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1719  		/* indicate whether rxfh was set to default */
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1720  		if (rxfh.indir_size == 0)
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1721  			dev->priv_flags &= ~IFF_RXFH_CONFIGURED;
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1722  		else if (rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE)
d4ab4286276fcd6 net/core/ethtool.c  Keller, Jacob E 2016-02-08  1723  			dev->priv_flags |= IFF_RXFH_CONFIGURED;
84a1d9c4820080b net/core/ethtool.c  Edward Cree     2018-03-08  1724  	}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1725  	/* Update rss_ctx tracking */
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1726  	if (create && !ops->create_rxfh_context) {
847a8ab186767be net/ethtool/ioctl.c Edward Cree     2024-06-27  1727  		/* driver uses old API, it chose context ID */
1a16cdf77e0d7de net/ethtool/ioctl.c Jakub Kicinski  2024-07-02  1728  		if (WARN_ON(xa_load(&dev->ethtool->rss_ctx, rxfh_dev.rss_context))) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1729  			/* context ID reused, our tracking is screwed */
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1730  			kfree(ctx);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1731  			goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1732  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1733  		/* Allocate the exact ID the driver gave us */
1a16cdf77e0d7de net/ethtool/ioctl.c Jakub Kicinski  2024-07-02  1734  		if (xa_is_err(xa_store(&dev->ethtool->rss_ctx, rxfh_dev.rss_context,
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1735  				       ctx, GFP_KERNEL))) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1736  			kfree(ctx);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1737  			goto out;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1738  		}
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1739  
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1740  		/* Fetch the defaults for the old API, in the new API drivers
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1741  		 * should write defaults into ctx themselves.
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1742  		 */
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1743  		rxfh_dev.indir = (u32 *)rss_config;
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1744  		rxfh_dev.indir_size = dev_indir_size;
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1745  
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1746  		rxfh_dev.key = rss_config + indir_bytes;
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1747  		rxfh_dev.key_size = dev_key_size;
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1748  
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1749  		ret = ops->get_rxfh(dev, &rxfh_dev);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1750  		if (WARN_ON(ret)) {
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1751  			xa_erase(&dev->ethtool->rss_ctx, rxfh.rss_context);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1752  			kfree(ctx);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1753  			goto out;
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1754  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1755  	}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1756  	if (rxfh_dev.rss_delete) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1757  		WARN_ON(xa_erase(&dev->ethtool->rss_ctx, rxfh.rss_context) != ctx);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1758  		kfree(ctx);
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1759  	} else if (ctx) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1760  		if (rxfh_dev.indir) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1761  			for (i = 0; i < dev_indir_size; i++)
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1762  				ethtool_rxfh_context_indir(ctx)[i] = rxfh_dev.indir[i];
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1763  			ctx->indir_configured =
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1764  				rxfh.indir_size &&
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1765  				rxfh.indir_size != ETH_RXFH_INDIR_NO_CHANGE;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1766  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1767  		if (rxfh_dev.key) {
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1768  			memcpy(ethtool_rxfh_context_key(ctx), rxfh_dev.key,
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1769  			       dev_key_size);
dc9755370e1c596 net/ethtool/ioctl.c Jakub Kicinski  2024-07-25  1770  			ctx->key_configured = !!rxfh.key_size;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1771  		}
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1772  		if (rxfh_dev.hfunc != ETH_RSS_HASH_NO_CHANGE)
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1773  			ctx->hfunc = rxfh_dev.hfunc;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1774  		if (rxfh_dev.input_xfrm != RXH_XFRM_NO_CHANGE)
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1775  			ctx->input_xfrm = rxfh_dev.input_xfrm;
eac9122f0c41b83 net/ethtool/ioctl.c Edward Cree     2024-06-27  1776  	}
a5b6ee291e39e28 net/core/ethtool.c  Ben Hutchings   2010-06-30  1777  
a5b6ee291e39e28 net/core/ethtool.c  Ben Hutchings   2010-06-30  1778  out:
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1779  	if (locked)
87925151191b64d net/ethtool/ioctl.c Edward Cree     2024-06-27  1780  		mutex_unlock(&dev->ethtool->rss_lock);
3de0b592394d17b net/core/ethtool.c  Venkata Duvvuru 2014-04-21  1781  	kfree(rss_config);
a5b6ee291e39e28 net/core/ethtool.c  Ben Hutchings   2010-06-30  1782  	return ret;
a5b6ee291e39e28 net/core/ethtool.c  Ben Hutchings   2010-06-30  1783  }
a5b6ee291e39e28 net/core/ethtool.c  Ben Hutchings   2010-06-30  1784  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
