Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9A35F8AA
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891675; cv=none; b=EQMhoQccStN6iq8MGjSYMW05B+EtgDZFtQF0k1ryy5fLRZlff31g/ljWDQPRsICTE7nQVMP3ekfjsfi8bxf0xu4bki8elnuvx9EYq7BNZrQfTYYmbXnk4vgqC2yVTs/npm7HD7M4SHnVJpQHo4Mkbq8mEVCtnh73GXuPGHDJt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891675; c=relaxed/simple;
	bh=M0bxbfD0As+YmNac9CIegaV8dvu/bSOewPFUnSggMLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1J1X/uKPxci1VoCkyPjwlf51wx1NdGLhfgWp6Tpww5zxHZGrNp36lQl/wk6lCZ+SoUNjuJHI4S2eMkYiddZsfxFc4ntq7jIxIw2l2OjoTeDNSCJOYTKNvx8XHxyZVl9/TKFnv7MQhU6j9QudEi7zBHWAtJyAvsgXs3k9/n/Uyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iur8Q/vZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iur8Q/vZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-430f57cd471so1407331f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765891671; x=1766496471; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6y36B4YguvPAVAnYYeQeC5X+WoPU9GzZLwjJ+mAyZZY=;
        b=iur8Q/vZBs2TEsQK9K4BqBTvuPnwqGSpLqjAGaflojGRnb3RnB5nrG+D6+PgAazvky
         i+oDoP5JoT8rXNqv6wL2AN46OdUVPxzplqrbwyTpS2ehzERNNZO1EGRKu8F3EBUx5wRD
         sYSSBRQfPI/tZWjL65J2FKZ50dtwWmVmgcJaArwrJ7hxRLVqxa0JOunBE1udhDExOUYH
         DtCr+WKVeY//BhWuUauVe+Mq3f1C506B0B0gtoxArP8+sejOFrYNGOs3SXDC0FrlP3OG
         afuGGBgkbzfXB5jVRwjktdVjUOTYrBr965UkIv1WUGNOmY6STaaOnZiAKI8JpUyn/e85
         M/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891671; x=1766496471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6y36B4YguvPAVAnYYeQeC5X+WoPU9GzZLwjJ+mAyZZY=;
        b=BSSxYeZX/FKFx0LixK5MLQgUOhpyxmkaENQfYU7S9uT5wDPYxebvFsSXwzQ0uI1wUd
         BtUeooEO2Wu+RrwJzdo3C8hHQBMKzUeuDRW42/WwLCTkf5ZJiPgURzNq+M+THR5UMw6x
         ZRijnFGIr/D/ESoUotykomOqR7fMQGRy3VKSa+TwWuwt3As2XTshY4tULGrp5F8vU1JQ
         OGNVWWoXwB4akiXmCcda0akylEm6ZovLXCChrtMkyxcIx25y+jKDlQw4n0ZxFGPY3DF2
         8R6gHH8gSVh7sw0LP+8kw1cR6M6WhKtHL+muN2x0ahXYnjZ4tOesYt80u44yT5z3KY3a
         j7Dg==
X-Gm-Message-State: AOJu0YxOLe0/N+6EOpz2YVG2C8XGPNs5RndrN3ks8WTsigCetd4TS2Bj
	foklF/PTccXxGGk/TUdW9mlandMUcSupl0tq//Wxs5XcokVKPEy2lefByZQyb5jfVmcwOCiO0zN
	Iauup
X-Gm-Gg: AY/fxX4Q6RKH1Vc/Dk2Jy1aoXU1IWi1VSpeIjY/fJx1P/JQ4zovZia41oUh5qJ/+tkr
	OQ9asWFZP3syJl2yV4+UsgaoUxIhq/wMgzKmJ+1Z6ynofpaCSDiI/U4LsPFzTvuQPOxvUAwQcRr
	NdG55q+GfJxPVP/8Z/5H9dsI0JdIA50iRU2MgkVSxRxzRmmB8HkMG2sNV5HT5sDOsYbz2UEQMWG
	cZhmH3gPldC/MOKCDFoGCRjhIMsF6x5AxLDGuw5rZNMJ1g9MllnaaJ2UZTM32FQQTNx16DBoitR
	da9VVfD9YlWkVrCuOmHTI4eSN62CV9jaQ0R0q9B3Y0k2xrmx/mY0++rU1u0MXNcyOKiZDoSe4rH
	EiFsfm9ka+BENWV0+J+Kp6kGD/aUQgESqzvOl3bvRBrlywzaW90Jb7GTinmoWNzJhFd/OxGXNKu
	MySAR+DLcszSJLIw62
X-Google-Smtp-Source: AGHT+IHl8ZNaJnmMRRn5pzpbDfTgSbSMIsp6fByudl0y25hQmBiOomGR1Gi5zOJEkB6jfAdInAaBeg==
X-Received: by 2002:a05:6000:40df:b0:430:f6c0:6c47 with SMTP id ffacd0b85a97d-430f6c06d99mr8396227f8f.21.1765891670633;
        Tue, 16 Dec 2025 05:27:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm21012482f8f.38.2025.12.16.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:27:50 -0800 (PST)
Date: Tue, 16 Dec 2025 16:27:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Divya Koppera <divya.koppera@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/phy/microchip_t1.c:1299 lan887x_phy_init() warn:
 'priv->clock' can also be NULL
Message-ID: <202512160211.FZ4wuVcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251216132746.eYTKEqcKONBQgSpQiltAdGCe4OdYE3oMMo5W27TiU1Q@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 8541fc12edcdef36a02885672f22ca8391bd2443 net: phy: microchip_t1: Enable pin out specific to lan887x phy for PEROUT signal
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160211.FZ4wuVcH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512160211.FZ4wuVcH-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_t1.c:1299 lan887x_phy_init() warn: 'priv->clock' can also be NULL

vim +1299 drivers/net/phy/microchip_t1.c

0941c832823498 Divya Koppera 2024-08-21  1280  static int lan887x_phy_init(struct phy_device *phydev)
0941c832823498 Divya Koppera 2024-08-21  1281  {
9fc3d6fe802923 Divya Koppera 2024-12-19  1282  	struct lan887x_priv *priv = phydev->priv;
0941c832823498 Divya Koppera 2024-08-21  1283  	int ret;
0941c832823498 Divya Koppera 2024-08-21  1284  
9fc3d6fe802923 Divya Koppera 2024-12-19  1285  	if (!priv->init_done && phy_interrupt_is_valid(phydev)) {
9fc3d6fe802923 Divya Koppera 2024-12-19  1286  		priv->clock = mchp_rds_ptp_probe(phydev, MDIO_MMD_VEND1,
9fc3d6fe802923 Divya Koppera 2024-12-19  1287  						 MCHP_RDS_PTP_LTC_BASE_ADDR,
9fc3d6fe802923 Divya Koppera 2024-12-19  1288  						 MCHP_RDS_PTP_PORT_BASE_ADDR);
9fc3d6fe802923 Divya Koppera 2024-12-19  1289  		if (IS_ERR(priv->clock))
9fc3d6fe802923 Divya Koppera 2024-12-19  1290  			return PTR_ERR(priv->clock);

The KConfig does this:

	select MICROCHIP_PHY_RDS_PTP if NETWORK_PHY_TIMESTAMPING

Since this config doesn't have NETWORK_PHY_TIMESTAMPING then
priv->clock is NULL

9fc3d6fe802923 Divya Koppera 2024-12-19  1291  
8541fc12edcdef Divya Koppera 2025-01-15  1292  		/* Enable pin mux for EVT */
8541fc12edcdef Divya Koppera 2025-01-15  1293  		phy_modify_mmd(phydev, MDIO_MMD_VEND1,
8541fc12edcdef Divya Koppera 2025-01-15  1294  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1,
8541fc12edcdef Divya Koppera 2025-01-15  1295  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1_EVT_EN,
8541fc12edcdef Divya Koppera 2025-01-15  1296  			       LAN887X_MX_CHIP_TOP_REG_CONTROL1_EVT_EN);
8541fc12edcdef Divya Koppera 2025-01-15  1297  
8541fc12edcdef Divya Koppera 2025-01-15  1298  		/* Initialize pin numbers specific to PEROUT */
8541fc12edcdef Divya Koppera 2025-01-15 @1299  		priv->clock->event_pin = 3;
                                                        ^^^^^^^^^^^
Potentially resulting in a NULL dereference.

8541fc12edcdef Divya Koppera 2025-01-15  1300  
9fc3d6fe802923 Divya Koppera 2024-12-19  1301  		priv->init_done = true;
9fc3d6fe802923 Divya Koppera 2024-12-19  1302  	}
9fc3d6fe802923 Divya Koppera 2024-12-19  1303  
0941c832823498 Divya Koppera 2024-08-21  1304  	/* Clear loopback */
0941c832823498 Divya Koppera 2024-08-21  1305  	ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1,
0941c832823498 Divya Koppera 2024-08-21  1306  				 LAN887X_MIS_CFG_REG2,
0941c832823498 Divya Koppera 2024-08-21  1307  				 LAN887X_MIS_CFG_REG2_FE_LPBK_EN);
0941c832823498 Divya Koppera 2024-08-21  1308  	if (ret < 0)
0941c832823498 Divya Koppera 2024-08-21  1309  		return ret;
0941c832823498 Divya Koppera 2024-08-21  1310  
0941c832823498 Divya Koppera 2024-08-21  1311  	/* Configure default behavior of led to link and activity for any
0941c832823498 Divya Koppera 2024-08-21  1312  	 * speed
0941c832823498 Divya Koppera 2024-08-21  1313  	 */
0941c832823498 Divya Koppera 2024-08-21  1314  	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1,
0941c832823498 Divya Koppera 2024-08-21  1315  			     LAN887X_COMMON_LED3_LED2,
0941c832823498 Divya Koppera 2024-08-21  1316  			     LAN887X_COMMON_LED2_MODE_SEL_MASK,
0941c832823498 Divya Koppera 2024-08-21  1317  			     LAN887X_LED_LINK_ACT_ANY_SPEED);
0941c832823498 Divya Koppera 2024-08-21  1318  	if (ret < 0)
0941c832823498 Divya Koppera 2024-08-21  1319  		return ret;
0941c832823498 Divya Koppera 2024-08-21  1320  
0941c832823498 Divya Koppera 2024-08-21  1321  	/* PHY interface setup */
0941c832823498 Divya Koppera 2024-08-21  1322  	return lan887x_config_phy_interface(phydev);
0941c832823498 Divya Koppera 2024-08-21  1323  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

