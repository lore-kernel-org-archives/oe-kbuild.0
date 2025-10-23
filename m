Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20321A267
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190142; cv=none; b=PGtubljWQkFV6rqHIvtAxWXJFITqjAQ5bUh51xRCEO8nyx1B205Bi9CS1wenoH4n4lycFjA+4wiLGTub79u/B6ZztSiIX9om0+vCyokbgdcWZwShNFf3wXOLci62Wz4BsRmouPuQXI7F4uF2mQELG+Rfw+ZVZSXPVWp2726ZCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190142; c=relaxed/simple;
	bh=8ZIM5xZ6NRIrnMP/jmqDhzF6g4ilCLTy/vlOokWOBXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqydFSE7T5wfp1S4e3SLzZoyifMK6PvmSupKST4f49kSMT+0Aqqtg5jbuUoLUItDKF/aOgHpLrA+42W/K4GxZHwqvh2aeX3GVxTiBn3AmT/SGklbrkrNdkfMFpR1XTDYfnKL3PkUlFR5XFCqoParet1lB8QeqdPvYni7HlRie1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMcuzi0U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMcuzi0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761190140; x=1792726140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZIM5xZ6NRIrnMP/jmqDhzF6g4ilCLTy/vlOokWOBXo=;
  b=fMcuzi0UEklkNYMKcTI8gn9l5taaudqAHZDzW5ndjP6Hqr6NSconojaD
   kzcwnu8Vfkmd1p/egcPdEnTNY81QnhBUCs9SpydzFRTGrH4brDUWLBkq1
   +a+U7dUCmn2iw7koqhuazPsk1xwyr8qWemRevJZjqLTQeuSIAewCaJPmv
   L1ba0f7bmO39rpbO/1Uuz1B58+PJQAzI/NjjoXTD54Bf16OlBrR+MONE8
   QypI9tV4JmXd75xfh/aR4Ji16bZ7GTczrUZ3GVUKWnKIVyLao0F8S5Zv7
   2H/IFTf3gEg8Didik2P4oWBuUMH9PO2VQfCcoALRsR7lpignVqwt6x0rv
   w==;
X-CSE-ConnectionGUID: FVvE9mN1QRmTLZdcDrNTNw==
X-CSE-MsgGUID: 9QZD24NJQPSpncJgBygWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63053663"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63053663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 20:28:59 -0700
X-CSE-ConnectionGUID: TQuNII/kQuSHalQiIquz4w==
X-CSE-MsgGUID: KC6+7dDuTROOErfrLwMqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183261661"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 20:28:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBm0R-000CyL-1a;
	Thu, 23 Oct 2025 03:28:52 +0000
Date: Thu, 23 Oct 2025 11:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
Message-ID: <202510231344.gEaqswZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/airoha/airoha_eth.c:2901:24: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251021193315.2192359-3-ansuelsmth@gmail.com>
References: <20251021193315.2192359-3-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Russell King <linux@armlinux.org.uk>
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-airoha-use-device_set_node-helper-to-setup-GDM-node/20251022-033534
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251021193315.2192359-3-ansuelsmth%40gmail.com
patch subject: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: um-randconfig-r111-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231344.gEaqswZl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231344.gEaqswZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510231344.gEaqswZl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/airoha/airoha_eth.c:2901:24: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/ethernet/airoha/airoha_eth.c:2900:39: sparse: signed value source

vim +2901 drivers/net/ethernet/airoha/airoha_eth.c

379c35266ba60ae Christian Marangi 2025-10-21  2892  
379c35266ba60ae Christian Marangi 2025-10-21  2893  static int airoha_setup_phylink(struct net_device *netdev)
379c35266ba60ae Christian Marangi 2025-10-21  2894  {
379c35266ba60ae Christian Marangi 2025-10-21  2895  	struct airoha_gdm_port *port = netdev_priv(netdev);
379c35266ba60ae Christian Marangi 2025-10-21  2896  	struct device *dev = &netdev->dev;
379c35266ba60ae Christian Marangi 2025-10-21  2897  	phy_interface_t phy_mode;
379c35266ba60ae Christian Marangi 2025-10-21  2898  	struct phylink *phylink;
379c35266ba60ae Christian Marangi 2025-10-21  2899  
379c35266ba60ae Christian Marangi 2025-10-21  2900  	phy_mode = device_get_phy_mode(dev);
379c35266ba60ae Christian Marangi 2025-10-21 @2901  	if (phy_mode < 0) {
379c35266ba60ae Christian Marangi 2025-10-21  2902  		dev_err(dev, "incorrect phy-mode\n");
379c35266ba60ae Christian Marangi 2025-10-21  2903  		return phy_mode;
379c35266ba60ae Christian Marangi 2025-10-21  2904  	}
379c35266ba60ae Christian Marangi 2025-10-21  2905  
379c35266ba60ae Christian Marangi 2025-10-21  2906  	port->phylink_config.dev = dev;
379c35266ba60ae Christian Marangi 2025-10-21  2907  	port->phylink_config.type = PHYLINK_NETDEV;
379c35266ba60ae Christian Marangi 2025-10-21  2908  	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
379c35266ba60ae Christian Marangi 2025-10-21  2909  						MAC_10000FD;
379c35266ba60ae Christian Marangi 2025-10-21  2910  
379c35266ba60ae Christian Marangi 2025-10-21  2911  	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
379c35266ba60ae Christian Marangi 2025-10-21  2912  		  port->phylink_config.supported_interfaces);
379c35266ba60ae Christian Marangi 2025-10-21  2913  
379c35266ba60ae Christian Marangi 2025-10-21  2914  	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
379c35266ba60ae Christian Marangi 2025-10-21  2915  				 phy_mode, &airoha_phylink_ops);
379c35266ba60ae Christian Marangi 2025-10-21  2916  	if (IS_ERR(phylink))
379c35266ba60ae Christian Marangi 2025-10-21  2917  		return PTR_ERR(phylink);
379c35266ba60ae Christian Marangi 2025-10-21  2918  
379c35266ba60ae Christian Marangi 2025-10-21  2919  	port->phylink = phylink;
379c35266ba60ae Christian Marangi 2025-10-21  2920  
379c35266ba60ae Christian Marangi 2025-10-21  2921  	return 0;
379c35266ba60ae Christian Marangi 2025-10-21  2922  }
379c35266ba60ae Christian Marangi 2025-10-21  2923  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
