Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139251C84A6
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Sep 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759223739; cv=none; b=OyqlHax0ev26kokRjbZd5LwrWa2DW84rK2rnV6JoOwBs57FjD1zqSNNpbi/ZgDZuRSGEkgNMsu/59vDLJhrN7p3dFAtiZcIZWuuQT22RoZBFkCdOJHqaoJq+e0EInh8owd8RT8QNXq1WV76Gs5Adn0oMIyMAmEDTjNHGFPcKLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759223739; c=relaxed/simple;
	bh=ioZ1m26JTr6zK4Xj6yp8hUjVVa03Mvg1kGY8LhYqIx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEAr6mXsseuB5RC2rp7Q4QNiDmZ0eUHYOg4ec3hiSoJVtMIcxN44JO2aa0m2xrSqbvRE1+Ex2q2Ym8UY+UeV1mAFfK3Uoi4hMMn953QpXo3lCq+gUzQ+3Zk4lFPVny54cJC1P6EuD81LMEJbV+mFr+oh7xE3BCGZyvwFqH6Ex30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVe1/K3i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVe1/K3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759223737; x=1790759737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioZ1m26JTr6zK4Xj6yp8hUjVVa03Mvg1kGY8LhYqIx0=;
  b=iVe1/K3iXhh1bWBpwfibMzSAPgndKpA4QbUAKQPqkN8qKyAWQiDc3oVn
   suUQKgEBAt+uD0RXwV4NAmd8bjsvSgXxqXbHBc/mdya0EnT8VCAm54wBk
   CmcXDiv0cC6akUMq0BlbeR1F3Gmf6EapCNbogWQTYqvN7s0p+dvBm46gb
   E+SLIP8ij32jDGu1Qs2dmaqyO1j83OMu9wrFXipR4wEmk0Pfwerct4lU7
   qcr1Ds34mJl04y74tXkHQLjTDPpbXFKE3n97nzLuapIdOPTp4fiCGTaW9
   0A/S3UqwD5+db5dEItmhaz6+6b4kIhzaPNh4PYLJDeHojPFZUXw/+zHwK
   Q==;
X-CSE-ConnectionGUID: lFHGYaccQ0KWWgul9agNSQ==
X-CSE-MsgGUID: 4DPbmbHfSVmbEzJZ9fo5Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65296917"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65296917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 02:15:36 -0700
X-CSE-ConnectionGUID: ufmygORvTjykOyEAk4pP4Q==
X-CSE-MsgGUID: 3BJP+SJyQPeFgRoINaLXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178880016"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2025 02:15:34 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3WSK-00015r-1D;
	Tue, 30 Sep 2025 09:15:32 +0000
Date: Tue, 30 Sep 2025 17:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v12 5/5] net: dsa: yt921x: Add support for
 Motorcomm YT921x
Message-ID: <202509301603.BIs6F2mT-lkp@intel.com>
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
In-Reply-To: <20250926135057.2323738-6-mmyangfl@gmail.com>
References: <20250926135057.2323738-6-mmyangfl@gmail.com>
TO: David Yang <mmyangfl@gmail.com>
TO: netdev@vger.kernel.org
CC: David Yang <mmyangfl@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Simon Horman <horms@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/dt-bindings-ethernet-phy-add-reverse-SGMII-phy-interface-type/20250926-215726
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250926135057.2323738-6-mmyangfl%40gmail.com
patch subject: [PATCH net-next v12 5/5] net: dsa: yt921x: Add support for Motorcomm YT921x
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-r072-20250929 (https://download.01.org/0day-ci/archive/20250930/202509301603.BIs6F2mT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509301603.BIs6F2mT-lkp@intel.com/

smatch warnings:
drivers/net/dsa/yt921x.c:1627 yt921x_vlan_filtering() error: uninitialized symbol 'pvid'.
drivers/net/dsa/yt921x.c:1783 yt921x_dsa_port_vlan_del() error: uninitialized symbol 'pvid'.
drivers/net/dsa/yt921x.c:1825 yt921x_dsa_port_vlan_add() error: uninitialized symbol 'pvid'.

vim +/pvid +1627 drivers/net/dsa/yt921x.c

6d78f992777096 David Yang 2025-09-26  1610  
6d78f992777096 David Yang 2025-09-26  1611  static int
6d78f992777096 David Yang 2025-09-26  1612  yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
6d78f992777096 David Yang 2025-09-26  1613  {
6d78f992777096 David Yang 2025-09-26  1614  	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
6d78f992777096 David Yang 2025-09-26  1615  	struct net_device *bdev;
6d78f992777096 David Yang 2025-09-26  1616  	u16 pvid;
6d78f992777096 David Yang 2025-09-26  1617  	u32 mask;
6d78f992777096 David Yang 2025-09-26  1618  	u32 ctrl;
6d78f992777096 David Yang 2025-09-26  1619  	int res;
6d78f992777096 David Yang 2025-09-26  1620  
6d78f992777096 David Yang 2025-09-26  1621  	bdev = dsa_port_bridge_dev_get(dp);
6d78f992777096 David Yang 2025-09-26  1622  
6d78f992777096 David Yang 2025-09-26  1623  	if (!bdev || !vlan_filtering)
6d78f992777096 David Yang 2025-09-26  1624  		pvid = YT921X_VID_UNWARE;
6d78f992777096 David Yang 2025-09-26  1625  	else
6d78f992777096 David Yang 2025-09-26  1626  		br_vlan_get_pvid(bdev, &pvid);
6d78f992777096 David Yang 2025-09-26 @1627  	res = yt921x_port_set_pvid(priv, port, pvid);
6d78f992777096 David Yang 2025-09-26  1628  	if (res)
6d78f992777096 David Yang 2025-09-26  1629  		return res;
6d78f992777096 David Yang 2025-09-26  1630  
6d78f992777096 David Yang 2025-09-26  1631  	mask = YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_TAGGED |
6d78f992777096 David Yang 2025-09-26  1632  	       YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
6d78f992777096 David Yang 2025-09-26  1633  	ctrl = 0;
6d78f992777096 David Yang 2025-09-26  1634  	/* Do not drop tagged frames here; let VLAN_IGR_FILTER do it */
6d78f992777096 David Yang 2025-09-26  1635  	if (vlan_filtering && !pvid)
6d78f992777096 David Yang 2025-09-26  1636  		ctrl |= YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
6d78f992777096 David Yang 2025-09-26  1637  	res = yt921x_reg_update_bits(priv, YT921X_PORTn_VLAN_CTRL1(port),
6d78f992777096 David Yang 2025-09-26  1638  				     mask, ctrl);
6d78f992777096 David Yang 2025-09-26  1639  	if (res)
6d78f992777096 David Yang 2025-09-26  1640  		return res;
6d78f992777096 David Yang 2025-09-26  1641  
6d78f992777096 David Yang 2025-09-26  1642  	res = yt921x_reg_toggle_bits(priv, YT921X_VLAN_IGR_FILTER,
6d78f992777096 David Yang 2025-09-26  1643  				     YT921X_VLAN_IGR_FILTER_PORTn(port),
6d78f992777096 David Yang 2025-09-26  1644  				     vlan_filtering);
6d78f992777096 David Yang 2025-09-26  1645  	if (res)
6d78f992777096 David Yang 2025-09-26  1646  		return res;
6d78f992777096 David Yang 2025-09-26  1647  
6d78f992777096 David Yang 2025-09-26  1648  	/* Turn on / off VLAN awareness */
6d78f992777096 David Yang 2025-09-26  1649  	mask = YT921X_PORT_IGR_TPIDn_CTAG_M;
6d78f992777096 David Yang 2025-09-26  1650  	if (!vlan_filtering)
6d78f992777096 David Yang 2025-09-26  1651  		ctrl = 0;
6d78f992777096 David Yang 2025-09-26  1652  	else
6d78f992777096 David Yang 2025-09-26  1653  		ctrl = YT921X_PORT_IGR_TPIDn_CTAG(0);
6d78f992777096 David Yang 2025-09-26  1654  	res = yt921x_reg_update_bits(priv, YT921X_PORTn_IGR_TPID(port),
6d78f992777096 David Yang 2025-09-26  1655  				     mask, ctrl);
6d78f992777096 David Yang 2025-09-26  1656  	if (res)
6d78f992777096 David Yang 2025-09-26  1657  		return res;
6d78f992777096 David Yang 2025-09-26  1658  
6d78f992777096 David Yang 2025-09-26  1659  	return 0;
6d78f992777096 David Yang 2025-09-26  1660  }
6d78f992777096 David Yang 2025-09-26  1661  
6d78f992777096 David Yang 2025-09-26  1662  static int
6d78f992777096 David Yang 2025-09-26  1663  yt921x_vlan_del(struct yt921x_priv *priv, int port, u16 vid)
6d78f992777096 David Yang 2025-09-26  1664  {
6d78f992777096 David Yang 2025-09-26  1665  	u64 mask64;
6d78f992777096 David Yang 2025-09-26  1666  
6d78f992777096 David Yang 2025-09-26  1667  	mask64 = YT921X_VLAN_CTRL_PORTS(port) |
6d78f992777096 David Yang 2025-09-26  1668  		 YT921X_VLAN_CTRL_UNTAG_PORTn(port);
6d78f992777096 David Yang 2025-09-26  1669  
6d78f992777096 David Yang 2025-09-26  1670  	return yt921x_reg64_clear_bits(priv, YT921X_VLANn_CTRL(vid), mask64);
6d78f992777096 David Yang 2025-09-26  1671  }
6d78f992777096 David Yang 2025-09-26  1672  
6d78f992777096 David Yang 2025-09-26  1673  static int
6d78f992777096 David Yang 2025-09-26  1674  yt921x_vlan_add(struct yt921x_priv *priv, int port, u16 vid, bool untagged)
6d78f992777096 David Yang 2025-09-26  1675  {
6d78f992777096 David Yang 2025-09-26  1676  	u64 mask64;
6d78f992777096 David Yang 2025-09-26  1677  	u64 ctrl64;
6d78f992777096 David Yang 2025-09-26  1678  
6d78f992777096 David Yang 2025-09-26  1679  	mask64 = YT921X_VLAN_CTRL_PORTn(port) |
6d78f992777096 David Yang 2025-09-26  1680  		 YT921X_VLAN_CTRL_PORTS(priv->cpu_ports_mask);
6d78f992777096 David Yang 2025-09-26  1681  	ctrl64 = mask64;
6d78f992777096 David Yang 2025-09-26  1682  
6d78f992777096 David Yang 2025-09-26  1683  	mask64 |= YT921X_VLAN_CTRL_UNTAG_PORTn(port);
6d78f992777096 David Yang 2025-09-26  1684  	if (untagged)
6d78f992777096 David Yang 2025-09-26  1685  		ctrl64 |= YT921X_VLAN_CTRL_UNTAG_PORTn(port);
6d78f992777096 David Yang 2025-09-26  1686  
6d78f992777096 David Yang 2025-09-26  1687  	return yt921x_reg64_update_bits(priv, YT921X_VLANn_CTRL(vid),
6d78f992777096 David Yang 2025-09-26  1688  					mask64, ctrl64);
6d78f992777096 David Yang 2025-09-26  1689  }
6d78f992777096 David Yang 2025-09-26  1690  
6d78f992777096 David Yang 2025-09-26  1691  static int
6d78f992777096 David Yang 2025-09-26  1692  yt921x_pvid_clear(struct yt921x_priv *priv, int port)
6d78f992777096 David Yang 2025-09-26  1693  {
6d78f992777096 David Yang 2025-09-26  1694  	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
6d78f992777096 David Yang 2025-09-26  1695  	bool vlan_filtering;
6d78f992777096 David Yang 2025-09-26  1696  	u32 mask;
6d78f992777096 David Yang 2025-09-26  1697  	int res;
6d78f992777096 David Yang 2025-09-26  1698  
6d78f992777096 David Yang 2025-09-26  1699  	vlan_filtering = dsa_port_is_vlan_filtering(dp);
6d78f992777096 David Yang 2025-09-26  1700  
6d78f992777096 David Yang 2025-09-26  1701  	res = yt921x_port_set_pvid(priv, port,
6d78f992777096 David Yang 2025-09-26  1702  				   vlan_filtering ? 0 : YT921X_VID_UNWARE);
6d78f992777096 David Yang 2025-09-26  1703  	if (res)
6d78f992777096 David Yang 2025-09-26  1704  		return res;
6d78f992777096 David Yang 2025-09-26  1705  
6d78f992777096 David Yang 2025-09-26  1706  	if (vlan_filtering) {
6d78f992777096 David Yang 2025-09-26  1707  		mask = YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
6d78f992777096 David Yang 2025-09-26  1708  		res = yt921x_reg_set_bits(priv, YT921X_PORTn_VLAN_CTRL1(port),
6d78f992777096 David Yang 2025-09-26  1709  					  mask);
6d78f992777096 David Yang 2025-09-26  1710  		if (res)
6d78f992777096 David Yang 2025-09-26  1711  			return res;
6d78f992777096 David Yang 2025-09-26  1712  	}
6d78f992777096 David Yang 2025-09-26  1713  
6d78f992777096 David Yang 2025-09-26  1714  	return 0;
6d78f992777096 David Yang 2025-09-26  1715  }
6d78f992777096 David Yang 2025-09-26  1716  
6d78f992777096 David Yang 2025-09-26  1717  static int
6d78f992777096 David Yang 2025-09-26  1718  yt921x_pvid_set(struct yt921x_priv *priv, int port, u16 vid)
6d78f992777096 David Yang 2025-09-26  1719  {
6d78f992777096 David Yang 2025-09-26  1720  	struct dsa_port *dp = dsa_to_port(&priv->ds, port);
6d78f992777096 David Yang 2025-09-26  1721  	bool vlan_filtering;
6d78f992777096 David Yang 2025-09-26  1722  	u32 mask;
6d78f992777096 David Yang 2025-09-26  1723  	int res;
6d78f992777096 David Yang 2025-09-26  1724  
6d78f992777096 David Yang 2025-09-26  1725  	vlan_filtering = dsa_port_is_vlan_filtering(dp);
6d78f992777096 David Yang 2025-09-26  1726  
6d78f992777096 David Yang 2025-09-26  1727  	if (vlan_filtering) {
6d78f992777096 David Yang 2025-09-26  1728  		res = yt921x_port_set_pvid(priv, port, vid);
6d78f992777096 David Yang 2025-09-26  1729  		if (res)
6d78f992777096 David Yang 2025-09-26  1730  			return res;
6d78f992777096 David Yang 2025-09-26  1731  	}
6d78f992777096 David Yang 2025-09-26  1732  
6d78f992777096 David Yang 2025-09-26  1733  	mask = YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
6d78f992777096 David Yang 2025-09-26  1734  	res = yt921x_reg_clear_bits(priv, YT921X_PORTn_VLAN_CTRL1(port), mask);
6d78f992777096 David Yang 2025-09-26  1735  	if (res)
6d78f992777096 David Yang 2025-09-26  1736  		return res;
6d78f992777096 David Yang 2025-09-26  1737  
6d78f992777096 David Yang 2025-09-26  1738  	return 0;
6d78f992777096 David Yang 2025-09-26  1739  }
6d78f992777096 David Yang 2025-09-26  1740  
6d78f992777096 David Yang 2025-09-26  1741  static int
6d78f992777096 David Yang 2025-09-26  1742  yt921x_dsa_port_vlan_filtering(struct dsa_switch *ds, int port,
6d78f992777096 David Yang 2025-09-26  1743  			       bool vlan_filtering,
6d78f992777096 David Yang 2025-09-26  1744  			       struct netlink_ext_ack *extack)
6d78f992777096 David Yang 2025-09-26  1745  {
6d78f992777096 David Yang 2025-09-26  1746  	struct yt921x_priv *priv = to_yt921x_priv(ds);
6d78f992777096 David Yang 2025-09-26  1747  	int res;
6d78f992777096 David Yang 2025-09-26  1748  
6d78f992777096 David Yang 2025-09-26  1749  	if (dsa_is_cpu_port(ds, port))
6d78f992777096 David Yang 2025-09-26  1750  		return 0;
6d78f992777096 David Yang 2025-09-26  1751  
6d78f992777096 David Yang 2025-09-26  1752  	mutex_lock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1753  	res = yt921x_vlan_filtering(priv, port, vlan_filtering);
6d78f992777096 David Yang 2025-09-26  1754  	mutex_unlock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1755  
6d78f992777096 David Yang 2025-09-26  1756  	return res;
6d78f992777096 David Yang 2025-09-26  1757  }
6d78f992777096 David Yang 2025-09-26  1758  
6d78f992777096 David Yang 2025-09-26  1759  static int
6d78f992777096 David Yang 2025-09-26  1760  yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
6d78f992777096 David Yang 2025-09-26  1761  			 const struct switchdev_obj_port_vlan *vlan)
6d78f992777096 David Yang 2025-09-26  1762  {
6d78f992777096 David Yang 2025-09-26  1763  	struct yt921x_priv *priv = to_yt921x_priv(ds);
6d78f992777096 David Yang 2025-09-26  1764  	u16 vid = vlan->vid;
6d78f992777096 David Yang 2025-09-26  1765  	u16 pvid;
6d78f992777096 David Yang 2025-09-26  1766  	int res;
6d78f992777096 David Yang 2025-09-26  1767  
6d78f992777096 David Yang 2025-09-26  1768  	if (dsa_is_cpu_port(ds, port))
6d78f992777096 David Yang 2025-09-26  1769  		return 0;
6d78f992777096 David Yang 2025-09-26  1770  
6d78f992777096 David Yang 2025-09-26  1771  	mutex_lock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1772  	do {
6d78f992777096 David Yang 2025-09-26  1773  		struct dsa_port *dp = dsa_to_port(ds, port);
6d78f992777096 David Yang 2025-09-26  1774  		struct net_device *bdev;
6d78f992777096 David Yang 2025-09-26  1775  
6d78f992777096 David Yang 2025-09-26  1776  		res = yt921x_vlan_del(priv, port, vid);
6d78f992777096 David Yang 2025-09-26  1777  		if (res)
6d78f992777096 David Yang 2025-09-26  1778  			break;
6d78f992777096 David Yang 2025-09-26  1779  
6d78f992777096 David Yang 2025-09-26  1780  		bdev = dsa_port_bridge_dev_get(dp);
6d78f992777096 David Yang 2025-09-26  1781  		if (bdev) {
6d78f992777096 David Yang 2025-09-26  1782  			br_vlan_get_pvid(bdev, &pvid);
6d78f992777096 David Yang 2025-09-26 @1783  			if (pvid == vid)
6d78f992777096 David Yang 2025-09-26  1784  				res = yt921x_pvid_clear(priv, port);
6d78f992777096 David Yang 2025-09-26  1785  		}
6d78f992777096 David Yang 2025-09-26  1786  	} while (0);
6d78f992777096 David Yang 2025-09-26  1787  	mutex_unlock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1788  
6d78f992777096 David Yang 2025-09-26  1789  	return res;
6d78f992777096 David Yang 2025-09-26  1790  }
6d78f992777096 David Yang 2025-09-26  1791  
6d78f992777096 David Yang 2025-09-26  1792  static int
6d78f992777096 David Yang 2025-09-26  1793  yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
6d78f992777096 David Yang 2025-09-26  1794  			 const struct switchdev_obj_port_vlan *vlan,
6d78f992777096 David Yang 2025-09-26  1795  			 struct netlink_ext_ack *extack)
6d78f992777096 David Yang 2025-09-26  1796  {
6d78f992777096 David Yang 2025-09-26  1797  	struct yt921x_priv *priv = to_yt921x_priv(ds);
6d78f992777096 David Yang 2025-09-26  1798  	u16 vid = vlan->vid;
6d78f992777096 David Yang 2025-09-26  1799  	u16 pvid;
6d78f992777096 David Yang 2025-09-26  1800  	int res;
6d78f992777096 David Yang 2025-09-26  1801  
6d78f992777096 David Yang 2025-09-26  1802  	/* CPU port is supposed to be a member of every VLAN; see
6d78f992777096 David Yang 2025-09-26  1803  	 * yt921x_vlan_add() and yt921x_port_setup()
6d78f992777096 David Yang 2025-09-26  1804  	 */
6d78f992777096 David Yang 2025-09-26  1805  	if (dsa_is_cpu_port(ds, port))
6d78f992777096 David Yang 2025-09-26  1806  		return 0;
6d78f992777096 David Yang 2025-09-26  1807  
6d78f992777096 David Yang 2025-09-26  1808  	mutex_lock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1809  	do {
6d78f992777096 David Yang 2025-09-26  1810  		struct dsa_port *dp = dsa_to_port(ds, port);
6d78f992777096 David Yang 2025-09-26  1811  		struct net_device *bdev;
6d78f992777096 David Yang 2025-09-26  1812  
6d78f992777096 David Yang 2025-09-26  1813  		res = yt921x_vlan_add(priv, port, vid,
6d78f992777096 David Yang 2025-09-26  1814  				      (vlan->flags &
6d78f992777096 David Yang 2025-09-26  1815  				       BRIDGE_VLAN_INFO_UNTAGGED) != 0);
6d78f992777096 David Yang 2025-09-26  1816  		if (res)
6d78f992777096 David Yang 2025-09-26  1817  			break;
6d78f992777096 David Yang 2025-09-26  1818  
6d78f992777096 David Yang 2025-09-26  1819  		bdev = dsa_port_bridge_dev_get(dp);
6d78f992777096 David Yang 2025-09-26  1820  		if (bdev) {
6d78f992777096 David Yang 2025-09-26  1821  			if ((vlan->flags & BRIDGE_VLAN_INFO_PVID) != 0) {
6d78f992777096 David Yang 2025-09-26  1822  				res = yt921x_pvid_set(priv, port, vid);
6d78f992777096 David Yang 2025-09-26  1823  			} else {
6d78f992777096 David Yang 2025-09-26  1824  				br_vlan_get_pvid(bdev, &pvid);
6d78f992777096 David Yang 2025-09-26 @1825  				if (pvid == vid)
6d78f992777096 David Yang 2025-09-26  1826  					res = yt921x_pvid_clear(priv, port);
6d78f992777096 David Yang 2025-09-26  1827  			}
6d78f992777096 David Yang 2025-09-26  1828  		}
6d78f992777096 David Yang 2025-09-26  1829  	} while (0);
6d78f992777096 David Yang 2025-09-26  1830  	mutex_unlock(&priv->reg_lock);
6d78f992777096 David Yang 2025-09-26  1831  
6d78f992777096 David Yang 2025-09-26  1832  	return res;
6d78f992777096 David Yang 2025-09-26  1833  }
6d78f992777096 David Yang 2025-09-26  1834  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
