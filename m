Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104A364
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Apr 2023 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681261898; x=1712797898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TM85LzhTwKj3uhYOMAmfb0wukQs9p74VqF6ur0qrqoA=;
  b=gPUGGO36UpshtJ7EA1vIjsdPP31p8hTrGXFJW/220Wai+u7bkxg5+UDx
   vDk5DYkAfPq9+qFlokd/pYD8eTPnOujct6nTX0wvDruVU6pCeQ0K6mm4F
   HCfs9/OFOyvQtRC1gNdg4vWTf1SfY4tGg46o/j+5Kc9WF59dxR0WcJVaY
   2JuPRVx9MS/pfE349mLLLkMI/p8JavmUF51qQV/huo3dx80ZgJNHt9OoA
   /E07PyeVHlcVd2WUMubq1xm202GRlv1n4t+BNOoLTiCKqUkvwn72gDvXm
   iu+OeTl8joLkuS+ljmZo4FVD3Ginuzj/2r6vKpBkNQvE3hodfjUlHarhn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430059101"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="430059101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 18:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753334471"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="753334471"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 18:11:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmP1L-000Wtn-2m;
	Wed, 12 Apr 2023 01:11:35 +0000
Date: Wed, 12 Apr 2023 09:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v2 net-next 07/14] net: dsa: mt7530: call port 6
 setup from mt7530_mac_config()
Message-ID: <202304120805.3RJUxz5z-lkp@intel.com>
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
In-Reply-To: <20230407134626.47928-8-arinc.unal@arinc9.com>
References: <20230407134626.47928-8-arinc.unal@arinc9.com>
TO: arinc9.unal@gmail.com

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/net-dsa-mt7530-fix-phylink-for-port-5-and-fix-port-5-modes/20230407-224714
patch link:    https://lore.kernel.org/r/20230407134626.47928-8-arinc.unal%40arinc9.com
patch subject: [RFC PATCH v2 net-next 07/14] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-m041-20230409 (https://download.01.org/0day-ci/archive/20230412/202304120805.3RJUxz5z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304120805.3RJUxz5z-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/mt7530.c:455 mt7530_setup_port6() error: uninitialized symbol 'ncpo1'.

Old smatch warnings:
drivers/net/dsa/mt7530.c:900 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
drivers/net/dsa/mt7530.c:900 mt7530_set_ageing_time() error: uninitialized symbol 'age_unit'.

vim +/ncpo1 +455 drivers/net/dsa/mt7530.c

c8b8a3c601f2cf Vladimir Oltean 2023-03-07  401  
fdcc8ccd823740 Arınç ÜNAL      2023-03-20  402  /* Setup port 6 interface mode and TRGMII TX circuit */
b8f126a8d54318 Sean Wang       2017-04-07  403  static int
09b2bbe1e53d30 Arınç ÜNAL      2023-04-07  404  mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
b8f126a8d54318 Sean Wang       2017-04-07  405  {
b8f126a8d54318 Sean Wang       2017-04-07  406  	struct mt7530_priv *priv = ds->priv;
fdcc8ccd823740 Arınç ÜNAL      2023-03-20  407  	u32 ncpo1, ssc_delta, trgint, xtal;
7ef6f6f8d237fa René van Dorst  2019-06-20  408  
7ef6f6f8d237fa René van Dorst  2019-06-20  409  	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
7ef6f6f8d237fa René van Dorst  2019-06-20  410  
7ef6f6f8d237fa René van Dorst  2019-06-20  411  	if (xtal == HWTRAP_XTAL_20MHZ) {
7ef6f6f8d237fa René van Dorst  2019-06-20  412  		dev_err(priv->dev,
7ef6f6f8d237fa René van Dorst  2019-06-20  413  			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
7ef6f6f8d237fa René van Dorst  2019-06-20  414  			__func__);
7ef6f6f8d237fa René van Dorst  2019-06-20  415  		return -EINVAL;
7ef6f6f8d237fa René van Dorst  2019-06-20  416  	}
b8f126a8d54318 Sean Wang       2017-04-07  417  
88bdef8be9f649 Landen Chao     2020-09-11  418  	switch (interface) {
b8f126a8d54318 Sean Wang       2017-04-07  419  	case PHY_INTERFACE_MODE_RGMII:
b8f126a8d54318 Sean Wang       2017-04-07  420  		trgint = 0;
b8f126a8d54318 Sean Wang       2017-04-07  421  		break;
b8f126a8d54318 Sean Wang       2017-04-07  422  	case PHY_INTERFACE_MODE_TRGMII:
b8f126a8d54318 Sean Wang       2017-04-07  423  		trgint = 1;
407b508bdd70b6 Arınç ÜNAL      2023-03-20  424  		if (xtal == HWTRAP_XTAL_25MHZ)
407b508bdd70b6 Arınç ÜNAL      2023-03-20  425  			ssc_delta = 0x57;
407b508bdd70b6 Arınç ÜNAL      2023-03-20  426  		else
407b508bdd70b6 Arınç ÜNAL      2023-03-20  427  			ssc_delta = 0x87;
7ef6f6f8d237fa René van Dorst  2019-06-20  428  		if (priv->id == ID_MT7621) {
7ef6f6f8d237fa René van Dorst  2019-06-20  429  			/* PLL frequency: 150MHz: 1.2GBit */
7ef6f6f8d237fa René van Dorst  2019-06-20  430  			if (xtal == HWTRAP_XTAL_40MHZ)
7ef6f6f8d237fa René van Dorst  2019-06-20  431  				ncpo1 = 0x0780;
7ef6f6f8d237fa René van Dorst  2019-06-20  432  			if (xtal == HWTRAP_XTAL_25MHZ)
7ef6f6f8d237fa René van Dorst  2019-06-20  433  				ncpo1 = 0x0a00;
7ef6f6f8d237fa René van Dorst  2019-06-20  434  		} else { /* PLL frequency: 250MHz: 2.0Gbit */
7ef6f6f8d237fa René van Dorst  2019-06-20  435  			if (xtal == HWTRAP_XTAL_40MHZ)
7ef6f6f8d237fa René van Dorst  2019-06-20  436  				ncpo1 = 0x0c80;
7ef6f6f8d237fa René van Dorst  2019-06-20  437  			if (xtal == HWTRAP_XTAL_25MHZ)
b8f126a8d54318 Sean Wang       2017-04-07  438  				ncpo1 = 0x1400;
7ef6f6f8d237fa René van Dorst  2019-06-20  439  		}
b8f126a8d54318 Sean Wang       2017-04-07  440  		break;
b8f126a8d54318 Sean Wang       2017-04-07  441  	default:
88bdef8be9f649 Landen Chao     2020-09-11  442  		dev_err(priv->dev, "xMII interface %d not supported\n",
88bdef8be9f649 Landen Chao     2020-09-11  443  			interface);
b8f126a8d54318 Sean Wang       2017-04-07  444  		return -EINVAL;
b8f126a8d54318 Sean Wang       2017-04-07  445  	}
b8f126a8d54318 Sean Wang       2017-04-07  446  
b8f126a8d54318 Sean Wang       2017-04-07  447  	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
b8f126a8d54318 Sean Wang       2017-04-07  448  		   P6_INTF_MODE(trgint));
b8f126a8d54318 Sean Wang       2017-04-07  449  
0b086d76e7b011 Arınç ÜNAL      2023-03-10  450  	if (trgint) {
8f058a6ef99f0b Arınç ÜNAL      2023-03-20  451  		/* Disable the MT7530 TRGMII clocks */
8f058a6ef99f0b Arınç ÜNAL      2023-03-20  452  		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
b8f126a8d54318 Sean Wang       2017-04-07  453  
b8f126a8d54318 Sean Wang       2017-04-07  454  		/* Setup the MT7530 TRGMII Tx Clock */
b8f126a8d54318 Sean Wang       2017-04-07 @455  		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
b8f126a8d54318 Sean Wang       2017-04-07  456  		core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
b8f126a8d54318 Sean Wang       2017-04-07  457  		core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
b8f126a8d54318 Sean Wang       2017-04-07  458  		core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
b8f126a8d54318 Sean Wang       2017-04-07  459  		core_write(priv, CORE_PLL_GROUP4,
b8f126a8d54318 Sean Wang       2017-04-07  460  			   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
b8f126a8d54318 Sean Wang       2017-04-07  461  			   RG_SYSPLL_BIAS_LPF_EN);
b8f126a8d54318 Sean Wang       2017-04-07  462  		core_write(priv, CORE_PLL_GROUP2,
b8f126a8d54318 Sean Wang       2017-04-07  463  			   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
b8f126a8d54318 Sean Wang       2017-04-07  464  			   RG_SYSPLL_POSDIV(1));
b8f126a8d54318 Sean Wang       2017-04-07  465  		core_write(priv, CORE_PLL_GROUP7,
b8f126a8d54318 Sean Wang       2017-04-07  466  			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
b8f126a8d54318 Sean Wang       2017-04-07  467  			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
4732315ca9fe9f Ilya Lipnitskiy 2021-03-26  468  
8f058a6ef99f0b Arınç ÜNAL      2023-03-20  469  		/* Enable the MT7530 TRGMII clocks */
8f058a6ef99f0b Arınç ÜNAL      2023-03-20  470  		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
0b086d76e7b011 Arınç ÜNAL      2023-03-10  471  	}
0b086d76e7b011 Arınç ÜNAL      2023-03-10  472  
b8f126a8d54318 Sean Wang       2017-04-07  473  	return 0;
b8f126a8d54318 Sean Wang       2017-04-07  474  }
b8f126a8d54318 Sean Wang       2017-04-07  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
