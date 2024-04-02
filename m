Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68284159912
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712079280; cv=none; b=BQIYQEo05l/Xv+4Q3H4s1P/KBiUqdiBi9A+bDpx+xhk7XGidUrg+yuClk9fee3kt9rreJkCoAeZWW2Z3D//zZYvt9IjFT4F2tMAqVpckQIU+IMdkyWP8zuTTwA1lr3OscUH7eJ7o8ZIFkXCV0ofjSJG2CcyAtuF+kmJAFinK4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712079280; c=relaxed/simple;
	bh=dH14S4/I4CKUXQniTCU3qcQBO/6uDzxeE4UC7iMSQ04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dtywHDBsW+x+cEqU0bZzoCeq/ReO6S1Er4tLf5BfdxXldBMYCBykEZhOle7xYcwiFfcsHRXJS0xMIwlhzdNnejkvknPX+KzNjfmyBhrBTi0TTYBIhkm+GjZNQxTxPt5MDDPBHrcn8BVbgc3PXDRr3cXJ40AGtHfrgy1n3sz4ne4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn8yHTiA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn8yHTiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712079278; x=1743615278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dH14S4/I4CKUXQniTCU3qcQBO/6uDzxeE4UC7iMSQ04=;
  b=Gn8yHTiAcr0C3HkS9qtmLIgFdlMYAgFrm73RtWJEMnFQwdpkg8MrsieP
   2AWohEHrI8wOQ/Q+n0M8+VWOVgU6HWJseOxWfk6+7t/tH/G+9VqnCGz76
   caGxXSWkfBXRq6a2iCixwQcTgj+5tsj5Lb05REKXBJpZz8P1up5V6Ci+c
   HHrmCX3P7xFbWCXtzlMTi7VOa2gmTMfmtz9Fa6qgS3d0g0ZAFA9vBwajZ
   0UCE4lsK8PwNWxwjuy/oXzymeXAjPIyYX0a5jjgqXgYV/C9cTzT3De8zM
   +9T26uimxBvLkP4zAqKyUHNxk7/TUAO9LUtAjVr9N5AxLOMXdGyMeFSZI
   A==;
X-CSE-ConnectionGUID: hR+g6p0ARTyJyrGmJ2pLLg==
X-CSE-MsgGUID: i7RtDNs8R4GfKzpN7o0CsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32665779"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="32665779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 10:34:38 -0700
X-CSE-ConnectionGUID: HKOADOtAQEeTF7AB+mRqEQ==
X-CSE-MsgGUID: FejB4eQ0RVCjZwC9HwLaVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22825554"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2024 10:34:36 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rri1p-0001Lf-2U;
	Tue, 02 Apr 2024 17:34:33 +0000
Date: Wed, 3 Apr 2024 01:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v7 07/16] net: dsa: vsc73xx: Add vlan filtering
Message-ID: <202404030102.Tv5bGJdv-lkp@intel.com>
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
In-Reply-To: <20240325204344.2298241-8-paweldembicki@gmail.com>
References: <20240325204344.2298241-8-paweldembicki@gmail.com>
TO: Pawel Dembicki <paweldembicki@gmail.com>
TO: netdev@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Simon Horman <horms@kernel.org>
CC: Pawel Dembicki <paweldembicki@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: UNGLinuxDriver@microchip.com
CC: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/net-dsa-vsc73xx-use-read_poll_timeout-instead-delay-loop/20240326-053458
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240325204344.2298241-8-paweldembicki%40gmail.com
patch subject: [PATCH net-next v7 07/16] net: dsa: vsc73xx: Add vlan filtering
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-141-20240402 (https://download.01.org/0day-ci/archive/20240403/202404030102.Tv5bGJdv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404030102.Tv5bGJdv-lkp@intel.com/

smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:1455 vsc73xx_port_vlan_add() error: uninitialized symbol 'ret'.

vim +/ret +1455 drivers/net/dsa/vitesse-vsc73xx-core.c

cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1380  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1381  static int vsc73xx_port_vlan_add(struct dsa_switch *ds, int port,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1382  				 const struct switchdev_obj_port_vlan *vlan,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1383  				 struct netlink_ext_ack *extack)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1384  {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1385  	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1386  	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1387  	struct dsa_port *dp = dsa_to_port(ds, port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1388  	enum vsc73xx_port_vlan_conf port_vlan_conf;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1389  	struct vsc73xx_bridge_vlan *vsc73xx_vlan;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1390  	struct vsc73xx_vlan_summary summary;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1391  	struct vsc73xx *vsc = ds->priv;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1392  	bool operate_on_storage;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1393  	int ret;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1394  	u16 vid;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1395  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1396  	/* Be sure to deny alterations to the configuration done by tag_8021q.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1397  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1398  	if (vid_is_dsa_8021q(vlan->vid)) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1399  		NL_SET_ERR_MSG_MOD(extack,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1400  				   "Range 3072-4095 reserved for dsa_8021q operation");
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1401  		return -EBUSY;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1402  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1403  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1404  	/* The processed vlan->vid is excluded from the search because the VLAN
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1405  	 * can be re-added with a different set of flags, so it's easiest to
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1406  	 * ignore its old flags from the VLAN database software copy.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1407  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1408  	vsc73xx_bridge_vlan_summary(vsc, port, &summary, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1409  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1410  	/* VSC73XX allow only three untagged states: none, one or all */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1411  	if ((untagged && summary.num_tagged > 0 && summary.num_untagged > 0) ||
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1412  	    (!untagged && summary.num_untagged > 1)) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1413  		NL_SET_ERR_MSG_MOD(extack,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1414  				   "Port can have only none, one or all untagged vlan");
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1415  		return -EBUSY;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1416  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1417  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1418  	vsc73xx_vlan = vsc73xx_bridge_vlan_find(vsc, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1419  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1420  	if (!vsc73xx_vlan) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1421  		vsc73xx_vlan = kzalloc(sizeof(*vsc73xx_vlan), GFP_KERNEL);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1422  		if (!vsc73xx_vlan)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1423  			return -ENOMEM;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1424  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1425  		vsc73xx_vlan->vid = vlan->vid;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1426  		vsc73xx_vlan->portmask = 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1427  		vsc73xx_vlan->untagged = 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1428  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1429  		INIT_LIST_HEAD(&vsc73xx_vlan->list);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1430  		list_add_tail(&vsc73xx_vlan->list, &vsc->vlans);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1431  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1432  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1433  	vsc73xx_vlan->portmask |= BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1434  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1435  	if (untagged)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1436  		vsc73xx_vlan->untagged |= BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1437  	else
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1438  		vsc73xx_vlan->untagged &= ~BIT(port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1439  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1440  	/* CPU port must be always tagged because port separation is based on
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1441  	 * tag_8021q.
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1442  	 */
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1443  	if (port == CPU_PORT)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1444  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1445  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1446  	operate_on_storage = vsc73xx_tag_8021q_active(dp);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1447  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1448  	if (pvid)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1449  		ret = vsc73xx_vlan_set_pvid(vsc, port, vlan->vid,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1450  					    operate_on_storage, false);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1451  	else if (vsc73xx_port_get_pvid(vsc, port, &vid, false) &&
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1452  		 vid == vlan->vid)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1453  		ret = vsc73xx_vlan_clear_pvid(vsc, port, operate_on_storage,
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1454  					      false);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25 @1455  	if (ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1456  		goto err;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1457  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1458  	if (operate_on_storage)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1459  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1460  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1461  	port_vlan_conf = VSC73XX_VLAN_FILTER;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1462  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1463  	if (summary.num_tagged == 0 && untagged)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1464  		port_vlan_conf = VSC73XX_VLAN_FILTER_UNTAG_ALL;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1465  	vsc73xx_set_vlan_conf(vsc, port, port_vlan_conf);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1466  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1467  	if (port_vlan_conf == VSC73XX_VLAN_FILTER_UNTAG_ALL)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1468  		goto update_vlan_table;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1469  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1470  	if (untagged) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1471  		ret = vsc73xx_vlan_set_untagged_hw(vsc, port, vlan->vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1472  	} else if (summary.num_untagged == 1) {
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1473  		vid = vsc73xx_find_first_vlan_untagged(vsc, port);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1474  		ret = vsc73xx_vlan_set_untagged_hw(vsc, port, vid);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1475  	}
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1476  	if (ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1477  		goto err;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1478  
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1479  update_vlan_table:
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1480  	ret = vsc73xx_update_vlan_table(vsc, port, vlan->vid, true);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1481  	if (!ret)
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1482  		return 0;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1483  err:
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1484  	list_del(&vsc73xx_vlan->list);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1485  	kfree(vsc73xx_vlan);
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1486  	return ret;
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1487  }
cb0eaf3f8563b0 Pawel Dembicki 2024-03-25  1488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
