Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41059BA39
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 06:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707112964; cv=none; b=sazyzViC4sawnj9w2KBC+efPFsO+h0JS9eZJJ8CNEIi3GKSisdm2z+jQsHeDipyCVnwIjbASolPlrdjWEceGy/J/HZhXx+7eVjVZVuEJTBoJa1xMi9fF1mSnkt/32SlUfX/gVZVjdR6IWy2IsK+j6klXPqGb5vCI3pQ1BdYOSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707112964; c=relaxed/simple;
	bh=u50aePyTMVslHQLzITmJuiuiC1ED0dOxSNecS8vn2lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkR/sJUvmLv01Mn9xTztS6uMTy66oPgTnuv/71VU+07ZTykjeiCrgEJTMvPcevU+3S5cCiR7EB75ER6G4oOCLEdgsYJMH/KF7ia3yDosNiY1wqPUBNvApTVMAx0cRRteUZ2QwA8NqFtrry21V3h6tJL6TIhxpiPrnG52sBxJOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZIgRqCV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZIgRqCV"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a363961b96aso504612866b.3
        for <oe-kbuild@lists.linux.dev>; Sun, 04 Feb 2024 22:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707112960; x=1707717760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O6c4RbNAzKl2D6PJxpSt/YZnEK4rkLiPUDqpsCBXKY=;
        b=yZIgRqCV3ZDaHSTutu7KZMTK9ctcKDzyRsQ7ISkF4NWF6Vzp9n5PHlBJbGB0wy4Tq1
         pnE0qdv2anVYqJYdI1GfBfLugahI8tMYBGkBopfiGEI9Y8mVfe4Xv79yVbGdXcFJicGR
         ZT/Sak9q9GWT+ylCR6ZwStFofkPn5NdKfkUm+2a60uuE4rQzJjiDlxW7tGbq+mdVFdXS
         3E9X3F86Kl6D0h9z/UvC3q33EEVIkjG6MyvITe+DAhKl5EPvxbyDhimVI3/nClY0dL14
         hP9JuLFxEfCkLVB35trh4IUsdR+yMlkGgJvJfxT2IKQtwGGUXvYMtw0nu8LEoC6J2T0v
         8xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707112960; x=1707717760;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O6c4RbNAzKl2D6PJxpSt/YZnEK4rkLiPUDqpsCBXKY=;
        b=RWknMUeWCdMaDNgvi+/T+2SYC0BNUIPVFUuapVle27ezoC/yO2wTuTLRuoTKVHH4Vr
         OdAWIRFYgIrSD2d9vZxSzNiiqWy4hpviq/Fe27ipCaOYlpzzIhzotFSZhQyxklpVyBn0
         BgQIKz5UcXbw8mw8IWDErMsHVnQKUZylpIholnvH56urC+h2d9MYat7FhD+3nVYSAs+d
         L7ceey3jCsiFKbrpMrMg606rS3l1gerSnZRy8G7zC+D8Oc16lsLj4poBnKjSEwO85mTf
         JRM53rq/TVHCR4FCU/m2i9AgploN8Tj+bKXlTMGUPFHQaIDcRVk0W0xBk3DFdLOL6qmA
         lCJw==
X-Gm-Message-State: AOJu0YwBSI6wXRiwyt5zT24aCR0PBxwwNEqKflr1Igc85fBczSQB7V1Y
	gdRURRkcnS6tzUf++YauucxplBsiukV9rFX7j2Nz+rU9LmBqFTm0UcjrNPEvlY6AyTHWwkWHsYr
	3
X-Google-Smtp-Source: AGHT+IGjGKK1LE0zg0BFOTorFfbmj/E/YU9z8kygavoTaSilE6tBhVCyh8+F+KeClEqb2UKJMWlAtg==
X-Received: by 2002:a17:907:b9c4:b0:a37:e5fd:94ee with SMTP id xa4-20020a170907b9c400b00a37e5fd94eemr116470ejc.72.1707112960018;
        Sun, 04 Feb 2024 22:02:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVRkACueswKhgq0eTksjOjicxJptZglx7HNSFDwPvDYZT34BgKe+WcR8GB5ygLP/DhbvRX3ZBolVFcdiQtG83Px1HTQm0S0VLx+DimxJGf2D4P8O4xpbJWiNB3TfG1KqhZIOlDynjPcRp2yEDC3qqCNPeWGrCxpkJm0HIY=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j20-20020a170906475400b00a353ca3d907sm3894839ejs.217.2024.02.04.22.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:02:39 -0800 (PST)
Date: Mon, 5 Feb 2024 09:02:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 21/51] drivers/net/phy/phy_device.c:1836
 phy_detach() error: we previously assumed 'dev' could be null (see line
 1815)
Message-ID: <63e0ce4c-5707-4663-87a7-3dff0cfeb44d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   0ea9759612aba09cc99b50301b281417f70e847c
commit: 10a25be4b77c699179ad1d36f7c67491c812c34e [21/51] ODROID-COMMON: phy/realtek: add Wake-on-Lan to Realtek PHY
config: i386-randconfig-141-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040224.6ErXx7IE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402040224.6ErXx7IE-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_device.c:1836 phy_detach() error: we previously assumed 'dev' could be null (see line 1815)
drivers/net/phy/phy_device.c:1848 phy_detach() warn: variable dereferenced before check 'dev' (see line 1836)

vim +/dev +1836 drivers/net/phy/phy_device.c

e13934563db047 Andy Fleming       2005-08-24  1795  void phy_detach(struct phy_device *phydev)
e13934563db047 Andy Fleming       2005-08-24  1796  {
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1797  	struct net_device *dev = phydev->attached_dev;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1798  	struct module *ndev_owner = NULL;
3e3aaf64941698 Russell King       2015-09-24  1799  	struct mii_bus *bus;
b3565f278a9bab Ezequiel Garcia    2014-07-23  1800  
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1801  	if (phydev->devlink)
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1802  		device_link_del(phydev->devlink);
bc66fa87d4fda9 Xiaolei Wang       2022-11-30  1803  
a3995460491d45 Florian Fainelli   2017-05-27  1804  	if (phydev->sysfs_links) {
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1805  		if (dev)
                                                                    ^^^
Check for NULL

5568363f0cb358 Florian Fainelli   2017-05-25  1806  			sysfs_remove_link(&dev->dev.kobj, "phydev");
5568363f0cb358 Florian Fainelli   2017-05-25  1807  		sysfs_remove_link(&phydev->mdio.dev.kobj, "attached_dev");
a3995460491d45 Florian Fainelli   2017-05-27  1808  	}
c920f745f45d46 Ioana Ciornei      2019-05-28  1809  
c920f745f45d46 Ioana Ciornei      2019-05-28  1810  	if (!phydev->attached_dev)
c920f745f45d46 Ioana Ciornei      2019-05-28  1811  		sysfs_remove_file(&phydev->mdio.dev.kobj,
c920f745f45d46 Ioana Ciornei      2019-05-28  1812  				  &dev_attr_phy_standalone.attr);
c920f745f45d46 Ioana Ciornei      2019-05-28  1813  
93f41e67dc8ff0 Heiner Kallweit    2018-09-24  1814  	phy_suspend(phydev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1815  	if (dev) {
                                                            ^^^
Checked here again

c1f19b51d1d87f Richard Cochran    2010-07-17  1816  		phydev->attached_dev->phydev = NULL;
e13934563db047 Andy Fleming       2005-08-24  1817  		phydev->attached_dev = NULL;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1818  	}
9525ae83959b60 Russell King       2017-07-25  1819  	phydev->phylink = NULL;
e13934563db047 Andy Fleming       2005-08-24  1820  
d98ce1f083cca8 Daniel Golle       2023-12-12  1821  	if (!phydev->is_on_sfp_module)
0075bd692dca03 Geert Uytterhoeven 2016-11-28  1822  		phy_led_triggers_unregister(phydev);
0075bd692dca03 Geert Uytterhoeven 2016-11-28  1823  
c2b727df7caa33 Florian Fainelli   2020-09-16  1824  	if (phydev->mdio.dev.driver)
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1825  		module_put(phydev->mdio.dev.driver->owner);
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1826  
e13934563db047 Andy Fleming       2005-08-24  1827  	/* If the device had no specific driver before (i.e. - it
e13934563db047 Andy Fleming       2005-08-24  1828  	 * was using the generic driver), we unbind the device
e13934563db047 Andy Fleming       2005-08-24  1829  	 * from the generic driver so that there's a chance a
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1830  	 * real driver could be loaded
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1831  	 */
5db5ea995fc2fa Florian Fainelli   2019-01-15  1832  	if (phy_driver_is_genphy(phydev) ||
5db5ea995fc2fa Florian Fainelli   2019-01-15  1833  	    phy_driver_is_genphy_10g(phydev))
e5a03bfd873c29 Andrew Lunn        2016-01-06  1834  		device_release_driver(&phydev->mdio.dev);
3e3aaf64941698 Russell King       2015-09-24  1835  
10a25be4b77c69 Dongjin Kim        2021-11-17 @1836  	if (!dev->wol_enabled) {
                                                             ^^^^^
Dereferenced without checking.

cbda1b16687580 Marek Behún        2022-01-19  1837  		/* Assert the reset signal */
cbda1b16687580 Marek Behún        2022-01-19  1838  		phy_device_reset(phydev, 1);
10a25be4b77c69 Dongjin Kim        2021-11-17  1839  	}
cbda1b16687580 Marek Behún        2022-01-19  1840  
7322967bc1bd97 Russell King       2015-09-24  1841  	/*
7322967bc1bd97 Russell King       2015-09-24  1842  	 * The phydev might go away on the put_device() below, so avoid
7322967bc1bd97 Russell King       2015-09-24  1843  	 * a use-after-free bug by reading the underlying bus first.
7322967bc1bd97 Russell King       2015-09-24  1844  	 */
e5a03bfd873c29 Andrew Lunn        2016-01-06  1845  	bus = phydev->mdio.bus;
3e3aaf64941698 Russell King       2015-09-24  1846  
e5a03bfd873c29 Andrew Lunn        2016-01-06  1847  	put_device(&phydev->mdio.dev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1848  	if (dev)
                                                            ^^^
Checked here

2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1849  		ndev_owner = dev->dev.parent->driver->owner;
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1850  	if (ndev_owner != bus->owner)
3e3aaf64941698 Russell King       2015-09-24  1851  		module_put(bus->owner);
e13934563db047 Andy Fleming       2005-08-24  1852  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

