Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731A64E;
	Thu, 13 Apr 2023 04:50:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q6so1455004wrc.3;
        Wed, 12 Apr 2023 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681361456; x=1683953456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WKEWSKNUtiiCaXd3+mhowjS89l8095uJH5oZErVhY8E=;
        b=IWJwgUAEnGx2ZHioOrffLC6dUljakioEjO8SSwe3dXj1Ti59WbQrEF8Q7QCdSrFSas
         +/OtL2VunVu7KDdQ31ig1cW5ABBRVDyrvuj/SOiQwV7VwofmYqdQjJCeQPpq63pn532i
         DHu4K0B5wHdEOMWZozJrkeJ7oLkRETkabHz6DZsE+0Z8OJPzTmQuK6IGq9z3MAHbVgo/
         qbhssayZhRmLBo2odUB0WkP3iyDv+WtA5ufKPIA913NgvvuimsqcRAvqz5HIc4UPyhD2
         mg/KirGcX16sW33BwyDgU5YC1hrgJoYVipvblbwKuVwaELyB/yJwxHHq+N505N4VRfgA
         OPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681361456; x=1683953456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKEWSKNUtiiCaXd3+mhowjS89l8095uJH5oZErVhY8E=;
        b=Y/nLqqR0FbhuYOyE2BfY4n3qXKCjf02c/PXeu8C4FvcS+ZQ+PChn6bdH9MmKFKrKRH
         cay5b/EJje53HBh1tJMV75/bN4hvLSJSyCSarTe1PbEBU51vbsM+2pWdq3jdUi329qxp
         Rbjm8oUbF/PRH+r9uIECdCWmucmKpxvHP6VSLs+bTxKvsRL8tQDu398L8+j1zrjnN74e
         AxecFjRDZmSgKwXl4mOumLLWusgNChTtNYGsbzq0AzRGRIrzM5FBysHz505IEVDMMFTR
         jq0LoGvReYAtvbwZFi59PI/x4gs5djHa6e48y2/WEVXh2PnjfRb+xgwtZ1HEbtH2TyzH
         HdPw==
X-Gm-Message-State: AAQBX9c/kLEVAos1Q68uY4LqY9XV0quFQxffyDbNU5ie9nkgyC6HEoTJ
	wTJJvd1UviAgeOSFZc6mxh/OLA14Fqw=
X-Google-Smtp-Source: AKy350Y2FLnAckQBuUOIifu5q5Ufp2qykQUatbuYPARc+tig42kjKkZWCChFZ0TaHEceCIR1mpmhkQ==
X-Received: by 2002:a5d:5003:0:b0:2e2:4d65:e8c7 with SMTP id e3-20020a5d5003000000b002e24d65e8c7mr433278wrt.35.1681361456171;
        Wed, 12 Apr 2023 21:50:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4c48000000b002f587f6c9b2sm370812wrt.107.2023.04.12.21.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:50:55 -0700 (PDT)
Date: Thu, 13 Apr 2023 07:50:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, arinc9.unal@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 net-next 07/14] net: dsa: mt7530: call port 6
 setup from mt7530_mac_config()
Message-ID: <bf9e03d7-00aa-489b-bc82-aa57ad37e92d@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407134626.47928-8-arinc.unal@arinc9.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/arinc9-unal-gmail-com/net-dsa-mt7530-fix-phylink-for-port-5-and-fix-port-5-modes/20230407-224714
patch link:    https://lore.kernel.org/r/20230407134626.47928-8-arinc.unal%40arinc9.com
patch subject: [RFC PATCH v2 net-next 07/14] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
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

These paths are where trgint is true, but there aren't any else paths.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

