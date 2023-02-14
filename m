Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE71C5CB
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676398660; x=1707934660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/d0dFfCvCFNipA2SPkRQOubQYdJIoyB8PCH6PhhJTSw=;
  b=AGCWpMBDDxy3CjJYGH3xFrw6DFAujNVRrFinRaDO6TtfgHoh1FQ93bfx
   KC1zalh7BofSYbE5ryvP1sn/uMrDbRM1wxWebY+3036iq0N7Vg+sMkcVi
   SCZ05hz/WnItT9qRHQaJD44SLbeLtkU3xsNXzQ2D+a6RXHMxcV25x8D4H
   otVFNUS/kgm5EkF/KIthPxXf8eNEGx/o+E983KkiySgqTGGjkt/zR1sxH
   VIrM/u5Tl7aHv0IlKOYjVHXvj+5STlHV3F0139v5qy+53UfnyM3G2sR89
   tIewdTR+91qFS1eZstcDrEG+TfnVAD/tH21zkKDMy0or7gYHa/ROkN17R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319258883"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="319258883"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 10:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="737961715"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="737961715"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2023 10:17:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRzri-0008i5-1v;
	Tue, 14 Feb 2023 18:17:18 +0000
Date: Wed, 15 Feb 2023 02:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12087/12724] drivers/net/phy/phy-c45.c:712
 genphy_c45_write_eee_adv() error: uninitialized symbol 'changed'.
Message-ID: <202302150232.q6idsV8s-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 022c3f87f88e2d68e90be7687d981c9cb893a3b1 [12087/12724] net: phy: add genphy_c45_ethtool_get/set_eee() support
:::::: branch date: 15 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302150232.q6idsV8s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302150232.q6idsV8s-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy-c45.c:712 genphy_c45_write_eee_adv() error: uninitialized symbol 'changed'.

vim +/changed +712 drivers/net/phy/phy-c45.c

ea4efe25ec937a Russell King   2017-12-29  663  
022c3f87f88e2d Oleksij Rempel 2023-02-11  664  /**
022c3f87f88e2d Oleksij Rempel 2023-02-11  665   * genphy_c45_write_eee_adv - write advertised EEE link modes
022c3f87f88e2d Oleksij Rempel 2023-02-11  666   * @phydev: target phy_device struct
022c3f87f88e2d Oleksij Rempel 2023-02-11  667   * @adv: the linkmode advertisement settings
022c3f87f88e2d Oleksij Rempel 2023-02-11  668   */
022c3f87f88e2d Oleksij Rempel 2023-02-11  669  int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv)
022c3f87f88e2d Oleksij Rempel 2023-02-11  670  {
022c3f87f88e2d Oleksij Rempel 2023-02-11  671  	int val, changed;
022c3f87f88e2d Oleksij Rempel 2023-02-11  672  
022c3f87f88e2d Oleksij Rempel 2023-02-11  673  	if (linkmode_intersects(phydev->supported, PHY_EEE_CAP1_FEATURES)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  674  		val = linkmode_to_mii_eee_cap1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  675  
022c3f87f88e2d Oleksij Rempel 2023-02-11  676  		/* In eee_broken_modes are stored MDIO_AN_EEE_ADV specific raw
022c3f87f88e2d Oleksij Rempel 2023-02-11  677  		 * register values.
022c3f87f88e2d Oleksij Rempel 2023-02-11  678  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  679  		val &= ~phydev->eee_broken_modes;
022c3f87f88e2d Oleksij Rempel 2023-02-11  680  
022c3f87f88e2d Oleksij Rempel 2023-02-11  681  		/* IEEE 802.3-2018 45.2.7.13 EEE advertisement 1
022c3f87f88e2d Oleksij Rempel 2023-02-11  682  		 * (Register 7.60)
022c3f87f88e2d Oleksij Rempel 2023-02-11  683  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  684  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  685  					     MDIO_AN_EEE_ADV,
022c3f87f88e2d Oleksij Rempel 2023-02-11  686  					     MDIO_EEE_100TX | MDIO_EEE_1000T |
022c3f87f88e2d Oleksij Rempel 2023-02-11  687  					     MDIO_EEE_10GT | MDIO_EEE_1000KX |
022c3f87f88e2d Oleksij Rempel 2023-02-11  688  					     MDIO_EEE_10GKX4 | MDIO_EEE_10GKR,
022c3f87f88e2d Oleksij Rempel 2023-02-11  689  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  690  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  691  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  692  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  693  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  694  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  695  
022c3f87f88e2d Oleksij Rempel 2023-02-11  696  	if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT1L_Full_BIT,
022c3f87f88e2d Oleksij Rempel 2023-02-11  697  			      phydev->supported_eee)) {
022c3f87f88e2d Oleksij Rempel 2023-02-11  698  		val = linkmode_adv_to_mii_10base_t1_t(adv);
022c3f87f88e2d Oleksij Rempel 2023-02-11  699  		/* IEEE 802.3cg-2019 45.2.7.25 10BASE-T1 AN control register
022c3f87f88e2d Oleksij Rempel 2023-02-11  700  		 * (Register 7.526)
022c3f87f88e2d Oleksij Rempel 2023-02-11  701  		 */
022c3f87f88e2d Oleksij Rempel 2023-02-11  702  		val = phy_modify_mmd_changed(phydev, MDIO_MMD_AN,
022c3f87f88e2d Oleksij Rempel 2023-02-11  703  					     MDIO_AN_10BT1_AN_CTRL,
022c3f87f88e2d Oleksij Rempel 2023-02-11  704  					     MDIO_AN_10BT1_AN_CTRL_ADV_EEE_T1L,
022c3f87f88e2d Oleksij Rempel 2023-02-11  705  					     val);
022c3f87f88e2d Oleksij Rempel 2023-02-11  706  		if (val < 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  707  			return val;
022c3f87f88e2d Oleksij Rempel 2023-02-11  708  		if (val > 0)
022c3f87f88e2d Oleksij Rempel 2023-02-11  709  			changed = 1;
022c3f87f88e2d Oleksij Rempel 2023-02-11  710  	}
022c3f87f88e2d Oleksij Rempel 2023-02-11  711  
022c3f87f88e2d Oleksij Rempel 2023-02-11 @712  	return changed;
022c3f87f88e2d Oleksij Rempel 2023-02-11  713  }
022c3f87f88e2d Oleksij Rempel 2023-02-11  714  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
