Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EA3158C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0tMHx2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699384416; x=1730920416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2rsUXLEZOVQLEx2c360Ov+0WuLJXXs6fR6KBvm0oKs=;
  b=I0tMHx2tr88xDsYH0Em3E8yyFMgEaieW/42PoSOZUlwIAZ8SouyUOIjk
   Mu527gaPwOPgENIzB23SH4v04xZ0sOkyOL45PKC2JgNlnFU3X0YdnLPBc
   1g49y3Vk1mHdwH9HdccHT3reG4BA1wndAfsfeYi+pDrMJs/uJf2qpeCh6
   qBbHlvJuVdGHWQS9YhAqVzbos7/xESioSI4fDnimyjWJMPRUyqcqYIoPz
   xGuv3XanMaH/1kBl5+MPBxEUbImOrKMSvgzKfZWp90iRTqS0dGJLUI87+
   BhrWmDfaAAVnOuIcDP2QfK6jltkWXLVLHkC5MfantWUldLCLqgYhmuqAE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393495280"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="393495280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 11:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="4098960"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2023 11:13:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0RVz-0007L0-1D;
	Tue, 07 Nov 2023 19:13:31 +0000
Date: Wed, 8 Nov 2023 03:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:155
 sja1105_init_mii_settings() warn: is 'table->entries' large enough for
 'struct sja1105_xmii_params_entry'? 1
Message-ID: <202311080202.UHNZYC20-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vladimir Oltean <olteanv@gmail.com>
CC: Georg Waibel <georg.waibel@sensor-technik.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 8aa9ebccae87621d997707e4f25e53fddd7e30e4 net: dsa: Introduce driver for NXP SJA1105 5-port L2 switch
date:   4 years, 6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 years, 6 months ago
config: i386-randconfig-141-20231030 (https://download.01.org/0day-ci/archive/20231108/202311080202.UHNZYC20-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080202.UHNZYC20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311080202.UHNZYC20-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:155 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:158 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:164 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:633 sja1105_adjust_port_config() warn: unsigned 'speed' is never less than zero.
drivers/net/dsa/sja1105/sja1105_main.c:633 sja1105_adjust_port_config() warn: error code type promoted to positive: 'speed'

vim +155 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae87621 Vladimir Oltean 2019-05-02  125  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  126  static int sja1105_init_mii_settings(struct sja1105_private *priv,
8aa9ebccae87621 Vladimir Oltean 2019-05-02  127  				     struct sja1105_dt_port *ports)
8aa9ebccae87621 Vladimir Oltean 2019-05-02  128  {
8aa9ebccae87621 Vladimir Oltean 2019-05-02  129  	struct device *dev = &priv->spidev->dev;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  130  	struct sja1105_xmii_params_entry *mii;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  131  	struct sja1105_table *table;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  132  	int i;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  133  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  134  	table = &priv->static_config.tables[BLK_IDX_XMII_PARAMS];
8aa9ebccae87621 Vladimir Oltean 2019-05-02  135  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  136  	/* Discard previous xMII Mode Parameters Table */
8aa9ebccae87621 Vladimir Oltean 2019-05-02  137  	if (table->entry_count) {
8aa9ebccae87621 Vladimir Oltean 2019-05-02  138  		kfree(table->entries);
8aa9ebccae87621 Vladimir Oltean 2019-05-02  139  		table->entry_count = 0;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  140  	}
8aa9ebccae87621 Vladimir Oltean 2019-05-02  141  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  142  	table->entries = kcalloc(SJA1105_MAX_XMII_PARAMS_COUNT,
8aa9ebccae87621 Vladimir Oltean 2019-05-02  143  				 table->ops->unpacked_entry_size, GFP_KERNEL);
8aa9ebccae87621 Vladimir Oltean 2019-05-02  144  	if (!table->entries)
8aa9ebccae87621 Vladimir Oltean 2019-05-02  145  		return -ENOMEM;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  146  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  147  	/* Override table based on phylib DT bindings */
8aa9ebccae87621 Vladimir Oltean 2019-05-02  148  	table->entry_count = SJA1105_MAX_XMII_PARAMS_COUNT;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  149  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  150  	mii = table->entries;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  151  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  152  	for (i = 0; i < SJA1105_NUM_PORTS; i++) {
8aa9ebccae87621 Vladimir Oltean 2019-05-02  153  		switch (ports[i].phy_mode) {
8aa9ebccae87621 Vladimir Oltean 2019-05-02  154  		case PHY_INTERFACE_MODE_MII:
8aa9ebccae87621 Vladimir Oltean 2019-05-02 @155  			mii->xmii_mode[i] = XMII_MODE_MII;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  156  			break;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  157  		case PHY_INTERFACE_MODE_RMII:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  158  			mii->xmii_mode[i] = XMII_MODE_RMII;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  159  			break;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  160  		case PHY_INTERFACE_MODE_RGMII:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  161  		case PHY_INTERFACE_MODE_RGMII_ID:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  162  		case PHY_INTERFACE_MODE_RGMII_RXID:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  163  		case PHY_INTERFACE_MODE_RGMII_TXID:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  164  			mii->xmii_mode[i] = XMII_MODE_RGMII;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  165  			break;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  166  		default:
8aa9ebccae87621 Vladimir Oltean 2019-05-02  167  			dev_err(dev, "Unsupported PHY mode %s!\n",
8aa9ebccae87621 Vladimir Oltean 2019-05-02  168  				phy_modes(ports[i].phy_mode));
8aa9ebccae87621 Vladimir Oltean 2019-05-02  169  		}
8aa9ebccae87621 Vladimir Oltean 2019-05-02  170  
8aa9ebccae87621 Vladimir Oltean 2019-05-02  171  		mii->phy_mac[i] = ports[i].role;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  172  	}
8aa9ebccae87621 Vladimir Oltean 2019-05-02  173  	return 0;
8aa9ebccae87621 Vladimir Oltean 2019-05-02  174  }
8aa9ebccae87621 Vladimir Oltean 2019-05-02  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
