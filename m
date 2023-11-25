Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734E20F8
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEUQKVj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700893271; x=1732429271;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Iqjm+4UFO5ToQbmcrzphroLEuNfyOb3ckmfQhHhXQyU=;
  b=IEUQKVj//emJQ0qFACDmJ5BbWbPpm+xjIB4dplTeCJroy71AmpUxG2+5
   TyyWwEwVoEVjilTFqWKGsdG5qTqnNQ5Pj+Xvy4KEkEzI263H+FVz11lCz
   c9uhjW8CzQXV92Tw77gj16qDxEhn1ylqsfnKbbkjM0YC5zJCTYCYnXOgY
   6+Do1eiTZwyTbY1hqj9xgJjERw+tiNyOd8/0AohMPtinNN4tvM6++3Boi
   MSMdrFDcr2+0egRCq5bUsLCwAE+kev/eM4EjYV64rAPpLwekVpgv/DRXe
   D5d+Hu9HHNZWnllsgQ65fnn8vy2gehdxCh8Im9FrW8Sdl48/sTZAoMUaz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382900928"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="382900928"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="717542737"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="717542737"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2023 22:21:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6m2N-0003h3-16;
	Sat, 25 Nov 2023 06:21:07 +0000
Date: Sat, 25 Nov 2023 14:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next 2/2] net: dsa: realtek: load switch variants on demand
Message-ID: <202311251132.QKdGl71R-lkp@intel.com>
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
In-Reply-To: <20231117235140.1178-3-luizluca@gmail.com>
References: <20231117235140.1178-3-luizluca@gmail.com>
TO: Luiz Angelo Daros de Luca <luizluca@gmail.com>
TO: netdev@vger.kernel.org
CC: linus.walleij@linaro.org
CC: alsi@bang-olufsen.dk
CC: andrew@lunn.ch
CC: f.fainelli@gmail.com
CC: olteanv@gmail.com
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: arinc.unal@arinc9.com
CC: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Angelo-Daros-de-Luca/net-dsa-realtek-create-realtek-common/20231118-075444
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231117235140.1178-3-luizluca%40gmail.com
patch subject: [net-next 2/2] net: dsa: realtek: load switch variants on demand
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231125/202311251132.QKdGl71R-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251132.QKdGl71R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311251132.QKdGl71R-lkp@intel.com/

smatch warnings:
drivers/net/dsa/realtek/realtek-smi.c:418 realtek_smi_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +418 drivers/net/dsa/realtek/realtek-smi.c

d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  397  
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  398  static int realtek_smi_probe(struct platform_device *pdev)
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  399  {
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  400  	struct device *dev = &pdev->dev;
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  401  	struct realtek_priv *priv;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  402  	int ret;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  403  
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  404  	priv = realtek_common_probe(dev, realtek_smi_regmap_config,
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  405  				    realtek_smi_nolock_regmap_config);
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  406  	if (IS_ERR(priv))
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  407  		return PTR_ERR(priv);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  408  
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  409  	/* Fetch MDIO pins */
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  410  	priv->mdc = devm_gpiod_get_optional(dev, "mdc", GPIOD_OUT_LOW);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  411  	if (IS_ERR(priv->mdc)) {
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  412  		ret = PTR_ERR(priv->mdc);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  413  		goto err_variant_put;
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  414  	}
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  415  
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  416  	priv->mdio = devm_gpiod_get_optional(dev, "mdio", GPIOD_OUT_LOW);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  417  	if (IS_ERR(priv->mdio)) {
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17 @418  		ret = PTR_ERR(priv->mdc);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  419  		goto err_variant_put;
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  420  	}
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  421  
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  422  	priv->setup_interface = realtek_smi_setup_mdio;
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  423  	priv->write_reg_noack = realtek_smi_write_reg_noack;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  424  
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  425  	ret = priv->ops->detect(priv);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  426  	if (ret) {
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  427  		dev_err(dev, "unable to detect switch\n");
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  428  		goto err_variant_put;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  429  	}
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  430  
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  431  	priv->ds->ops = priv->variant->ds_ops_smi;
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  432  	priv->ds->num_ports = priv->num_ports;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  433  
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  434  	ret = dsa_register_switch(priv->ds);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  435  	if (ret) {
b014861d96a69f drivers/net/dsa/realtek-smi-core.c         Alvin Šipraga             2021-11-29  436  		dev_err_probe(dev, ret, "unable to register switch\n");
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  437  		goto err_variant_put;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  438  	}
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  439  
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  440  	return 0;
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  441  
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  442  err_variant_put:
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  443  	realtek_variant_put(priv->variant);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  444  
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  445  	return ret;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  446  }
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
