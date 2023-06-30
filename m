Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D885156FA
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jun 2023 14:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688134773; x=1719670773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVCgG/fX7p7ytWhNX1T5UqPE8jWaV+kEf5k03kC3C18=;
  b=aPtAFu9+OWvYjLh3IHR+Jwe9/AleKoLAf6t2aJqm6PpboQ+uhhgk5XVH
   Uu0iK1QwFqYa7Qe0MEBN9MAMuJYhL/KGv9DgFcJ9b4L5VtKiR/K0EoKj/
   LPQp4t1W/RNIUSWb+b7wc4nHGudbZfMnDmvi+7dxuxsbC0iw4RQini+J9
   InbC3dGVJNnHSpx1xGk2MmzY7K6sHYmScdY3Tib9Zp0Qobe7qC5UeOU65
   u10pqUlCZ9a1YTUYCsf55fbW/vt6e2M/mejUWijb2BJk8uNZm/hRqNE+8
   q84KuN12qQaVUHPlgKxXZ3LIvZ7lJ6bwADcmjAscmPeWsjVtcpifzDNDn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="426089548"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="426089548"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="1048249660"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="1048249660"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2023 07:19:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFEy8-000F21-17;
	Fri, 30 Jun 2023 14:19:28 +0000
Date: Fri, 30 Jun 2023 22:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 1/6] net: dsa: vsc73xx: convert to PHYLINK
Message-ID: <202306302257.DWKHSgvF-lkp@intel.com>
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
In-Reply-To: <20230621191302.1405623-1-paweldembicki@gmail.com>
References: <20230621191302.1405623-1-paweldembicki@gmail.com>
TO: Pawel Dembicki <paweldembicki@gmail.com>
TO: netdev@vger.kernel.org
CC: linus.walleij@linaro.org
CC: Pawel Dembicki <paweldembicki@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Dembicki/net-dsa-vsc73xx-add-port_stp_state_set-function/20230622-031529
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230621191302.1405623-1-paweldembicki%40gmail.com
patch subject: [PATCH net-next 1/6] net: dsa: vsc73xx: convert to PHYLINK
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: parisc-randconfig-m041-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302257.DWKHSgvF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302257.DWKHSgvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306302257.DWKHSgvF-lkp@intel.com/

smatch warnings:
drivers/net/dsa/vitesse-vsc73xx-core.c:891 vsc73xx_phylink_mac_link_up() error: uninitialized symbol 'val'.

vim +/val +891 drivers/net/dsa/vitesse-vsc73xx-core.c

05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  860  
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  861  static void vsc73xx_phylink_mac_link_up(struct dsa_switch *ds, int port,
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  862  					unsigned int mode,
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  863  					phy_interface_t interface,
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  864  					struct phy_device *phydev,
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  865  					int speed, int duplex,
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  866  					bool tx_pause, bool rx_pause)
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  867  {
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  868  	struct vsc73xx *vsc = ds->priv;
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  869  	u32 val;
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  870  
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  871  	switch (speed) {
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  872  	case SPEED_1000:
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  873  		/* Set up default for internal port or external RGMII */
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  874  		if (interface == PHY_INTERFACE_MODE_RGMII)
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  875  			val = VSC73XX_MAC_CFG_1000M_F_RGMII;
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  876  		else
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  877  			val = VSC73XX_MAC_CFG_1000M_F_PHY;
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  878  		break;
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  879  	case SPEED_100:
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  880  	case SPEED_10:
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  881  		if (duplex == DUPLEX_FULL)
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  882  			val = VSC73XX_MAC_CFG_100_10M_F_PHY;
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  883  		else
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  884  			val = VSC73XX_MAC_CFG_100_10M_H_PHY;
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21  885  		break;
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  886  	}
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  887  
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  888  	/* Enable port (forwarding) in the receieve mask */
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  889  	vsc73xx_update_bits(vsc, VSC73XX_BLOCK_ANALYZER, 0,
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  890  			    VSC73XX_RECVMASK, BIT(port), BIT(port));
33f498e941bbd8 drivers/net/dsa/vitesse-vsc73xx-core.c Pawel Dembicki 2023-06-21 @891  	vsc73xx_adjust_enable_port(vsc, port, val);
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  892  }
05bd97fc559df4 drivers/net/dsa/vitesse-vsc73xx.c      Linus Walleij  2018-06-30  893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
