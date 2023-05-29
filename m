Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7F7C
	for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685398485; x=1716934485;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fp9h4vQpBcSYdw06jJu0hFqJGBN0OlZfNXBMk2I6RPA=;
  b=lu23ZImkqOnYOMr33nzm6/zbxm4aCqHxrOb4fKky5AzQ+VbtT/1pQGGU
   9qYFejT79Nc/nvIIqCJCe3BT2kFq4+IwUjjpRpwavkWxY+oV9auZl47hG
   p+Ucbg7N7OBCovsnQd6/LHLU0SuX+ifQz0TH4l8MHZb2ruMj4GKeHybjy
   QJqtGK2lifjKRlDTVPEDtduPDmNhoXzpM+tX6NVf38Bk5cNplIiMoFz7l
   HtgH+/997lllj4Tr+kXJaAHYKUY1wEs6KxV3X/7jP6sbuMUd/K0+e8AHf
   EykESm8sAi36ayPdUZRGCgP/1kGvZSfYTVgmtV3SDuHVBYObJMqLvR/T+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357149090"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357149090"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706189010"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706189010"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 15:14:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3l8U-000L9K-2u;
	Mon, 29 May 2023 22:14:42 +0000
Date: Tue, 30 May 2023 06:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 10/30] net: dsa: mt7530: call port 6 setup from
 mt7530_mac_config()
Message-ID: <202305300519.j98oYEvo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230522121532.86610-11-arinc.unal@arinc9.com>
References: <20230522121532.86610-11-arinc.unal@arinc9.com>
TO: arinc9.unal@gmail.com
TO: Sean Wang <sean.wang@mediatek.com>
TO: Landen Chao <Landen.Chao@mediatek.com>
TO: DENG Qingfang <dqfext@gmail.com>
TO: Daniel Golle <daniel@makrotopia.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Russell King <linux@armlinux.org.uk>
CC: "Arınç ÜNAL" <arinc.unal@arinc9.com>
CC: Richard van Schagen <richard@routerhints.com>
CC: Frank Wunderlich <frank-w@public-files.de>
CC: Bartel Eerdekens <bartel.eerdekens@constell8.be>
CC: erkin.bozoglu@xeront.com
CC: mithat.guner@xeront.com
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/net-dsa-mt7530-add-missing-p5_interface-to-mt7530_priv-description/20230522-222600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230522121532.86610-11-arinc.unal%40arinc9.com
patch subject: [PATCH net-next 10/30] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20230528 (https://download.01.org/0day-ci/archive/20230530/202305300519.j98oYEvo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305300519.j98oYEvo-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/mt7530.c:455 mt7530_setup_port6() error: uninitialized symbol 'ncpo1'.

Old smatch warnings:
drivers/net/dsa/mt7530.c:888 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
drivers/net/dsa/mt7530.c:888 mt7530_set_ageing_time() error: uninitialized symbol 'age_unit'.
drivers/net/dsa/mt7530.c:2313 mt7530_setup() error: uninitialized symbol 'interface'.

vim +/ncpo1 +455 drivers/net/dsa/mt7530.c

c8b8a3c601f2cfa Vladimir Oltean 2023-03-07  401  
fdcc8ccd823740c Arınç ÜNAL      2023-03-20  402  /* Setup port 6 interface mode and TRGMII TX circuit */
b8f126a8d54318b Sean Wang       2017-04-07  403  static int
10afe5fa1644d9a Arınç ÜNAL      2023-05-22  404  mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
b8f126a8d54318b Sean Wang       2017-04-07  405  {
b8f126a8d54318b Sean Wang       2017-04-07  406  	struct mt7530_priv *priv = ds->priv;
fdcc8ccd823740c Arınç ÜNAL      2023-03-20  407  	u32 ncpo1, ssc_delta, trgint, xtal;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  408  
2a9cfd93ccafaf9 Arınç ÜNAL      2023-05-22  409  	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  410  
7ef6f6f8d237fa6 René van Dorst  2019-06-20  411  	if (xtal == HWTRAP_XTAL_20MHZ) {
7ef6f6f8d237fa6 René van Dorst  2019-06-20  412  		dev_err(priv->dev,
7ef6f6f8d237fa6 René van Dorst  2019-06-20  413  			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
7ef6f6f8d237fa6 René van Dorst  2019-06-20  414  			__func__);
7ef6f6f8d237fa6 René van Dorst  2019-06-20  415  		return -EINVAL;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  416  	}
b8f126a8d54318b Sean Wang       2017-04-07  417  
88bdef8be9f649c Landen Chao     2020-09-11  418  	switch (interface) {
b8f126a8d54318b Sean Wang       2017-04-07  419  	case PHY_INTERFACE_MODE_RGMII:
b8f126a8d54318b Sean Wang       2017-04-07  420  		trgint = 0;
b8f126a8d54318b Sean Wang       2017-04-07  421  		break;
b8f126a8d54318b Sean Wang       2017-04-07  422  	case PHY_INTERFACE_MODE_TRGMII:
b8f126a8d54318b Sean Wang       2017-04-07  423  		trgint = 1;
407b508bdd70b68 Arınç ÜNAL      2023-03-20  424  		if (xtal == HWTRAP_XTAL_25MHZ)
407b508bdd70b68 Arınç ÜNAL      2023-03-20  425  			ssc_delta = 0x57;
407b508bdd70b68 Arınç ÜNAL      2023-03-20  426  		else
407b508bdd70b68 Arınç ÜNAL      2023-03-20  427  			ssc_delta = 0x87;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  428  		if (priv->id == ID_MT7621) {
37c218d8021e36e Arınç ÜNAL      2023-05-03  429  			/* PLL frequency: 125MHz: 1.0GBit */
7ef6f6f8d237fa6 René van Dorst  2019-06-20  430  			if (xtal == HWTRAP_XTAL_40MHZ)
37c218d8021e36e Arınç ÜNAL      2023-05-03  431  				ncpo1 = 0x0640;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  432  			if (xtal == HWTRAP_XTAL_25MHZ)
7ef6f6f8d237fa6 René van Dorst  2019-06-20  433  				ncpo1 = 0x0a00;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  434  		} else { /* PLL frequency: 250MHz: 2.0Gbit */
7ef6f6f8d237fa6 René van Dorst  2019-06-20  435  			if (xtal == HWTRAP_XTAL_40MHZ)
7ef6f6f8d237fa6 René van Dorst  2019-06-20  436  				ncpo1 = 0x0c80;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  437  			if (xtal == HWTRAP_XTAL_25MHZ)
b8f126a8d54318b Sean Wang       2017-04-07  438  				ncpo1 = 0x1400;
7ef6f6f8d237fa6 René van Dorst  2019-06-20  439  		}
b8f126a8d54318b Sean Wang       2017-04-07  440  		break;
b8f126a8d54318b Sean Wang       2017-04-07  441  	default:
88bdef8be9f649c Landen Chao     2020-09-11  442  		dev_err(priv->dev, "xMII interface %d not supported\n",
88bdef8be9f649c Landen Chao     2020-09-11  443  			interface);
b8f126a8d54318b Sean Wang       2017-04-07  444  		return -EINVAL;
b8f126a8d54318b Sean Wang       2017-04-07  445  	}
b8f126a8d54318b Sean Wang       2017-04-07  446  
b8f126a8d54318b Sean Wang       2017-04-07  447  	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
b8f126a8d54318b Sean Wang       2017-04-07  448  		   P6_INTF_MODE(trgint));
b8f126a8d54318b Sean Wang       2017-04-07  449  
0b086d76e7b0117 Arınç ÜNAL      2023-03-10  450  	if (trgint) {
8f058a6ef99f0b8 Arınç ÜNAL      2023-03-20  451  		/* Disable the MT7530 TRGMII clocks */
8f058a6ef99f0b8 Arınç ÜNAL      2023-03-20  452  		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
b8f126a8d54318b Sean Wang       2017-04-07  453  
b8f126a8d54318b Sean Wang       2017-04-07  454  		/* Setup the MT7530 TRGMII Tx Clock */
b8f126a8d54318b Sean Wang       2017-04-07 @455  		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
b8f126a8d54318b Sean Wang       2017-04-07  456  		core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
b8f126a8d54318b Sean Wang       2017-04-07  457  		core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
b8f126a8d54318b Sean Wang       2017-04-07  458  		core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
b8f126a8d54318b Sean Wang       2017-04-07  459  		core_write(priv, CORE_PLL_GROUP4,
b8f126a8d54318b Sean Wang       2017-04-07  460  			   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
b8f126a8d54318b Sean Wang       2017-04-07  461  			   RG_SYSPLL_BIAS_LPF_EN);
b8f126a8d54318b Sean Wang       2017-04-07  462  		core_write(priv, CORE_PLL_GROUP2,
b8f126a8d54318b Sean Wang       2017-04-07  463  			   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
b8f126a8d54318b Sean Wang       2017-04-07  464  			   RG_SYSPLL_POSDIV(1));
b8f126a8d54318b Sean Wang       2017-04-07  465  		core_write(priv, CORE_PLL_GROUP7,
b8f126a8d54318b Sean Wang       2017-04-07  466  			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
b8f126a8d54318b Sean Wang       2017-04-07  467  			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
4732315ca9fe9f9 Ilya Lipnitskiy 2021-03-26  468  
8f058a6ef99f0b8 Arınç ÜNAL      2023-03-20  469  		/* Enable the MT7530 TRGMII clocks */
8f058a6ef99f0b8 Arınç ÜNAL      2023-03-20  470  		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
0b086d76e7b0117 Arınç ÜNAL      2023-03-10  471  	}
0b086d76e7b0117 Arınç ÜNAL      2023-03-10  472  
b8f126a8d54318b Sean Wang       2017-04-07  473  	return 0;
b8f126a8d54318b Sean Wang       2017-04-07  474  }
b8f126a8d54318b Sean Wang       2017-04-07  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
