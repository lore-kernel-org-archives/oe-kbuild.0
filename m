Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F95C5F7
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676406119; x=1707942119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ksCtFjcs9UY01pJVC8Q7jNinmWPVYi9pVWBbm4aq9I=;
  b=B5hyizwrYKpzd953i+lEmenNZLkq5BMCO3dBMdSraHVPlYDxiq3PfB4J
   mPLxJanpUj/2PLfsf+NpcamdyrNfzkVDgN/xseql7KCeVsMWFA4F2zSbl
   vQ8NyXq6ZMR+vOMR0sfW1vMc/sobYgUifcyj1Mv3B/sXiO8cAgF7kEZuN
   D4PeFsPO1X6Tf+yW6cpjz+M3dJKITTxkfX89AZ8YU8MhLAnCFKLyoPH1w
   +E+Rhz1WwXshf2jzwzEP5pNPCJGyE6cn8dIoz1CVaDm7leA8nXv6Lfnjb
   r0YVFwG8aBqNkhNPbtmL21lcrqYq7JZ8nltQAzCgXnLLRcssINg2+pfDS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417481123"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="417481123"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 12:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701756169"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="701756169"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 12:20:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS1mn-0008lx-0L;
	Tue, 14 Feb 2023 20:20:21 +0000
Date: Wed, 15 Feb 2023 04:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12089/12724] drivers/net/phy/phy-c45.c:296
 genphy_c45_an_config_aneg() error: uninitialized symbol 'changed'.
Message-ID: <202302150400.uuWYkjZx-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 5827b168125d16d93fe14284c2c377f32d13fce6 [12089/12724] net: phy: c45: migrate to genphy_c45_write_eee_adv()
:::::: branch date: 17 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150400.uuWYkjZx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302150400.uuWYkjZx-lkp@intel.com/

New smatch warnings:
drivers/net/phy/phy-c45.c:296 genphy_c45_an_config_aneg() error: uninitialized symbol 'changed'.

Old smatch warnings:
drivers/net/phy/phy-c45.c:716 genphy_c45_write_eee_adv() error: uninitialized symbol 'changed'.

vim +/changed +296 drivers/net/phy/phy-c45.c

3da8ffd8545f62 Alexandru Tachici 2022-04-29  247  
9a5dc8af441668 Andrew Lunn       2019-02-17  248  /**
9a5dc8af441668 Andrew Lunn       2019-02-17  249   * genphy_c45_an_config_aneg - configure advertisement registers
9a5dc8af441668 Andrew Lunn       2019-02-17  250   * @phydev: target phy_device struct
9a5dc8af441668 Andrew Lunn       2019-02-17  251   *
9a5dc8af441668 Andrew Lunn       2019-02-17  252   * Configure advertisement registers based on modes set in phydev->advertising
9a5dc8af441668 Andrew Lunn       2019-02-17  253   *
9a5dc8af441668 Andrew Lunn       2019-02-17  254   * Returns negative errno code on failure, 0 if advertisement didn't change,
9a5dc8af441668 Andrew Lunn       2019-02-17  255   * or 1 if advertised modes changed.
9a5dc8af441668 Andrew Lunn       2019-02-17  256   */
9a5dc8af441668 Andrew Lunn       2019-02-17  257  int genphy_c45_an_config_aneg(struct phy_device *phydev)
9a5dc8af441668 Andrew Lunn       2019-02-17  258  {
cc429d529126e5 Heiner Kallweit   2019-02-18  259  	int changed, ret;
9a5dc8af441668 Andrew Lunn       2019-02-17  260  	u32 adv;
9a5dc8af441668 Andrew Lunn       2019-02-17  261  
9a5dc8af441668 Andrew Lunn       2019-02-17  262  	linkmode_and(phydev->advertising, phydev->advertising,
9a5dc8af441668 Andrew Lunn       2019-02-17  263  		     phydev->supported);
9a5dc8af441668 Andrew Lunn       2019-02-17  264  
5827b168125d16 Oleksij Rempel    2023-02-11  265  	ret = genphy_c45_write_eee_adv(phydev, phydev->supported_eee);
5827b168125d16 Oleksij Rempel    2023-02-11  266  	if (ret < 0)
5827b168125d16 Oleksij Rempel    2023-02-11  267  		return ret;
5827b168125d16 Oleksij Rempel    2023-02-11  268  	else if (ret)
5827b168125d16 Oleksij Rempel    2023-02-11  269  		changed = true;
cc429d529126e5 Heiner Kallweit   2019-02-18  270  
3da8ffd8545f62 Alexandru Tachici 2022-04-29  271  	if (genphy_c45_baset1_able(phydev))
3da8ffd8545f62 Alexandru Tachici 2022-04-29  272  		return genphy_c45_baset1_an_config_aneg(phydev);
3da8ffd8545f62 Alexandru Tachici 2022-04-29  273  
9a5dc8af441668 Andrew Lunn       2019-02-17  274  	adv = linkmode_adv_to_mii_adv_t(phydev->advertising);
9a5dc8af441668 Andrew Lunn       2019-02-17  275  
9731ea06298b20 Heiner Kallweit   2019-03-04  276  	ret = phy_modify_mmd_changed(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE,
9a5dc8af441668 Andrew Lunn       2019-02-17  277  				     ADVERTISE_ALL | ADVERTISE_100BASE4 |
9a5dc8af441668 Andrew Lunn       2019-02-17  278  				     ADVERTISE_PAUSE_CAP | ADVERTISE_PAUSE_ASYM,
9a5dc8af441668 Andrew Lunn       2019-02-17  279  				     adv);
9a5dc8af441668 Andrew Lunn       2019-02-17  280  	if (ret < 0)
9a5dc8af441668 Andrew Lunn       2019-02-17  281  		return ret;
9a5dc8af441668 Andrew Lunn       2019-02-17  282  	if (ret > 0)
9a5dc8af441668 Andrew Lunn       2019-02-17  283  		changed = 1;
9a5dc8af441668 Andrew Lunn       2019-02-17  284  
9a5dc8af441668 Andrew Lunn       2019-02-17  285  	adv = linkmode_adv_to_mii_10gbt_adv_t(phydev->advertising);
9a5dc8af441668 Andrew Lunn       2019-02-17  286  
9731ea06298b20 Heiner Kallweit   2019-03-04  287  	ret = phy_modify_mmd_changed(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
9a5dc8af441668 Andrew Lunn       2019-02-17  288  				     MDIO_AN_10GBT_CTRL_ADV10G |
9a5dc8af441668 Andrew Lunn       2019-02-17  289  				     MDIO_AN_10GBT_CTRL_ADV5G |
9731ea06298b20 Heiner Kallweit   2019-03-04  290  				     MDIO_AN_10GBT_CTRL_ADV2_5G, adv);
9a5dc8af441668 Andrew Lunn       2019-02-17  291  	if (ret < 0)
9a5dc8af441668 Andrew Lunn       2019-02-17  292  		return ret;
9a5dc8af441668 Andrew Lunn       2019-02-17  293  	if (ret > 0)
9a5dc8af441668 Andrew Lunn       2019-02-17  294  		changed = 1;
9a5dc8af441668 Andrew Lunn       2019-02-17  295  
9a5dc8af441668 Andrew Lunn       2019-02-17 @296  	return changed;
9a5dc8af441668 Andrew Lunn       2019-02-17  297  }
9a5dc8af441668 Andrew Lunn       2019-02-17  298  EXPORT_SYMBOL_GPL(genphy_c45_an_config_aneg);
9a5dc8af441668 Andrew Lunn       2019-02-17  299  

:::::: The code at line 296 was first introduced by commit
:::::: 9a5dc8af441668a3db7fdcd927cb288be62c0a2e net: phy: add genphy_c45_an_config_aneg

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
