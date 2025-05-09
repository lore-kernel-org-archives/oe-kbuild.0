Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44923BCF4
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815867; cv=none; b=LdDQyIBLtWUO2+/T5sAfaYd+bR6nZPCkFLN3ZXKfjTu1PhjTBW55QPLpS6bGobO2r9vCVRdOzQ6WdJabexbrKOi7Ky1AykQ1wt7ElpFp0BDeL02z2JNxU24FbNoSd8YF4mV7CMXUNOXr8/gtFcr3z//8IiK7VU39parrEjozVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815867; c=relaxed/simple;
	bh=uOIx2qVCo3/FFeEurVU14Q/iajDAu52Oy4XM83JXRiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CN2/lrfUuVyZ7rq/J7Mqn+cyJ/l3al4SJkEg//MaqCLpXKR8V1K92rr71ftcU1EAdYpi5W6Z2Nk+eKuJYb03kvY/GUQzoMIVCL5ywwPgfonDKhtVb8of9LwX7xELit74r/XXU5/5qMqWDlroJZW0d95kisr8mdX8xM9qNDb+jaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxfyJyFs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxfyJyFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746815866; x=1778351866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uOIx2qVCo3/FFeEurVU14Q/iajDAu52Oy4XM83JXRiM=;
  b=NxfyJyFsV9EexMZdGaOCx+QiBkvG4Ws1DYBayr0/V2yl5g1xKjMr0kD9
   fF0FP3OfM9svFt4nT7YWgWYGZJ7CzUnDHB3Nb2fRTyptrGFU6LT6TdAk7
   41YnX/ua2VTlxHqzgd73Je/U6MhDaLDwEziUQpGNptRHA19cVtKWFIkGE
   uPUTrayjVAfuCd0jOEu6gfWQHF+o/GAnR7W57x/9M/iZGIagEaw1Sqclm
   K3UpXDBOX2RpzYwOZGQv2uzRbmNKxVvSv/XGc/OOP1r9bxZt/eUNiA5Fs
   Hc/k2GMJRYGIPNDXr/ZrMgOWl+8KSoqVK1id2GGH/K8BFrFBroSUOMFVU
   Q==;
X-CSE-ConnectionGUID: JN0wb1NlTqSLT82WYiRgFQ==
X-CSE-MsgGUID: PMvpwhKrTXWP72lVc7J14w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51313493"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="51313493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 11:37:45 -0700
X-CSE-ConnectionGUID: kC8Fm2K7RuKcF1TWAbAiNg==
X-CSE-MsgGUID: AzWs9MkGS7OG6XzpvllmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="136398211"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 11:37:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDSbN-000CMh-0e;
	Fri, 09 May 2025 18:37:41 +0000
Date: Sat, 10 May 2025 02:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8728/10031] drivers/net/usb/lan78xx.c:2732
 lan78xx_phy_init() warn: missing unwind goto?
Message-ID: <202505100248.ozuSU0hP-lkp@intel.com>
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
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Thangaraj Samynathan <thangaraj.s@microchip.com>

Hi Oleksij,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 8ba1f33c55d213ee0da1b972b481407cfddeda4a [8728/10031] net: usb: lan78xx: move LED DT configuration to helper
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250508 (https://download.01.org/0day-ci/archive/20250510/202505100248.ozuSU0hP-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505100248.ozuSU0hP-lkp@intel.com/

New smatch warnings:
drivers/net/usb/lan78xx.c:2732 lan78xx_phy_init() warn: missing unwind goto?

Old smatch warnings:
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2529 lan78xx_register_fixed_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2560 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:3025 lan78xx_init_ltm() warn: missing unwind goto?

vim +2732 drivers/net/usb/lan78xx.c

8ba1f33c55d213 Oleksij Rempel            2025-05-05  2694  
89b36fb5e53244 Raghuram Chary J          2018-04-28  2695  static int lan78xx_phy_init(struct lan78xx_net *dev)
89b36fb5e53244 Raghuram Chary J          2018-04-28  2696  {
3c1bcc8614db10 Andrew Lunn               2018-11-10  2697  	__ETHTOOL_DECLARE_LINK_MODE_MASK(fc) = { 0, };
89b36fb5e53244 Raghuram Chary J          2018-04-28  2698  	int ret;
89b36fb5e53244 Raghuram Chary J          2018-04-28  2699  	u32 mii_adv;
89b36fb5e53244 Raghuram Chary J          2018-04-28  2700  	struct phy_device *phydev;
89b36fb5e53244 Raghuram Chary J          2018-04-28  2701  
d39f339d260373 Oleksij Rempel            2025-05-05  2702  	phydev = lan78xx_get_phy(dev);
d39f339d260373 Oleksij Rempel            2025-05-05  2703  	if (IS_ERR(phydev))
232aa459aa40a6 Oleksij Rempel            2025-05-05  2704  		return PTR_ERR(phydev);
89b36fb5e53244 Raghuram Chary J          2018-04-28  2705  
d39f339d260373 Oleksij Rempel            2025-05-05  2706  	ret = lan78xx_mac_prepare_for_phy(dev);
d39f339d260373 Oleksij Rempel            2025-05-05  2707  	if (ret < 0)
d39f339d260373 Oleksij Rempel            2025-05-05  2708  		goto free_phy;
02dc1f3d613d5a Woojung Huh               2016-12-07  2709  
cc89c323a30e73 Woojung Huh               2016-11-01  2710  	/* if phyirq is not set, use polling mode in phylib */
cc89c323a30e73 Woojung Huh               2016-11-01  2711  	if (dev->domain_data.phyirq > 0)
cc89c323a30e73 Woojung Huh               2016-11-01  2712  		phydev->irq = dev->domain_data.phyirq;
cc89c323a30e73 Woojung Huh               2016-11-01  2713  	else
817b653160db98 Sven Schuchmann           2021-11-27  2714  		phydev->irq = PHY_POLL;
cc89c323a30e73 Woojung Huh               2016-11-01  2715  	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
e4953910aee0c1 Woojung.Huh@microchip.com 2016-01-27  2716  
f6e3ef3e4d3546 Woojung Huh               2016-11-17  2717  	/* set to AUTOMDIX */
f6e3ef3e4d3546 Woojung Huh               2016-11-17  2718  	phydev->mdix = ETH_TP_MDI_AUTO;
f6e3ef3e4d3546 Woojung Huh               2016-11-17  2719  
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2720  	ret = phy_connect_direct(dev->net, phydev,
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2721  				 lan78xx_link_status_change,
02dc1f3d613d5a Woojung Huh               2016-12-07  2722  				 dev->interface);
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2723  	if (ret) {
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2724  		netdev_err(dev->net, "can't attach PHY to %s\n",
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2725  			   dev->mdiobus->id);
89b36fb5e53244 Raghuram Chary J          2018-04-28  2726  		if (dev->chipid == ID_REV_CHIP_ID_7801_) {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2727  			if (phy_is_pseudo_fixed_link(phydev)) {
89b36fb5e53244 Raghuram Chary J          2018-04-28  2728  				fixed_phy_unregister(phydev);
ae7370e61c5d8f Oleksij Rempel            2024-11-16  2729  				phy_device_free(phydev);
89b36fb5e53244 Raghuram Chary J          2018-04-28  2730  			}
89b36fb5e53244 Raghuram Chary J          2018-04-28  2731  		}
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16 @2732  		return -EIO;
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2733  	}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2734  
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2735  	/* MAC doesn't support 1000T Half */
41124fa64d4b29 Andrew Lunn               2018-09-12  2736  	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
e270b2dbd83caf Woojung.Huh@microchip.com 2016-02-25  2737  
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2738  	/* support both flow controls */
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2739  	dev->fc_request_control = (FLOW_CTRL_RX | FLOW_CTRL_TX);
3c1bcc8614db10 Andrew Lunn               2018-11-10  2740  	linkmode_clear_bit(ETHTOOL_LINK_MODE_Pause_BIT,
3c1bcc8614db10 Andrew Lunn               2018-11-10  2741  			   phydev->advertising);
3c1bcc8614db10 Andrew Lunn               2018-11-10  2742  	linkmode_clear_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
3c1bcc8614db10 Andrew Lunn               2018-11-10  2743  			   phydev->advertising);
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2744  	mii_adv = (u32)mii_advertise_flowctrl(dev->fc_request_control);
3c1bcc8614db10 Andrew Lunn               2018-11-10  2745  	mii_adv_to_linkmode_adv_t(fc, mii_adv);
3c1bcc8614db10 Andrew Lunn               2018-11-10  2746  	linkmode_or(phydev->advertising, fc, phydev->advertising);
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2747  
a00bbd15a5af98 Andrew Lunn               2024-04-06  2748  	phy_support_eee(phydev);
a00bbd15a5af98 Andrew Lunn               2024-04-06  2749  
8ba1f33c55d213 Oleksij Rempel            2025-05-05  2750  	ret = lan78xx_configure_leds_from_dt(dev, phydev);
8ba1f33c55d213 Oleksij Rempel            2025-05-05  2751  	if (ret)
8ba1f33c55d213 Oleksij Rempel            2025-05-05  2752  		goto free_phy;
1827b0678863bc Phil Elwell               2018-04-19  2753  
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2754  	genphy_config_aneg(phydev);
ce85e13ad6ef47 Woojung.Huh@microchip.com 2015-09-16  2755  
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2756  	dev->fc_autoneg = phydev->autoneg;
349e0c5e223774 Woojung.Huh@microchip.com 2016-02-25  2757  
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2758  	return 0;
d39f339d260373 Oleksij Rempel            2025-05-05  2759  
d39f339d260373 Oleksij Rempel            2025-05-05  2760  free_phy:
d39f339d260373 Oleksij Rempel            2025-05-05  2761  	if (phy_is_pseudo_fixed_link(phydev)) {
d39f339d260373 Oleksij Rempel            2025-05-05  2762  		fixed_phy_unregister(phydev);
d39f339d260373 Oleksij Rempel            2025-05-05  2763  		phy_device_free(phydev);
d39f339d260373 Oleksij Rempel            2025-05-05  2764  	}
d39f339d260373 Oleksij Rempel            2025-05-05  2765  
d39f339d260373 Oleksij Rempel            2025-05-05  2766  	return ret;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2767  }
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2768  

:::::: The code at line 2732 was first introduced by commit
:::::: ce85e13ad6ef47ddcd34684889dc38a9901868ef lan78xx: Update to use phylib instead of mii_if_info.

:::::: TO: Woojung.Huh@microchip.com <Woojung.Huh@microchip.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
