Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E4155389
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502395; cv=none; b=lH+7pjT+IeR2mQLlT+rnYFutVV7KgM3+cdnXssv+nwX5z7RsAeqh3aRNdt0257mAUGKhlaNfVN3pzKFBeoP1DyNgsESKuYYynh9X7QnKFt7cwlY7Mam9MAQAGzas9FQeRoCrCTgrBxYvLt/qfxsH7NVrO2vkOo8YMM1a5vcFfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502395; c=relaxed/simple;
	bh=RqRs7wR/oASDvklaotNVNggwb5VagoAguWpZUwop+bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iUlFYN3PkuwK2G5VCBEmieMkVSsYV5y59VdlOSoxvJyaiqnraoG1LV9cSxG69Tj8QY4cv2Zr4+0/A0IhA5b3IsXQ0rMIG2YCO8R+zuor570pkKC/rzo34XIfbFhc7hGrG4oP8Gkzyda+/yArElO23g6FLiVfCmWi5lL0JlJgP/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+AOQGBf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+AOQGBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734502393; x=1766038393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqRs7wR/oASDvklaotNVNggwb5VagoAguWpZUwop+bU=;
  b=e+AOQGBftUj5gpPfmFg1TbeZIlRWG6xqM/M8eSn4L9cEZhxKKbMR/GQQ
   A7AlUmVRpCws/rK99+2zjfxzcpNDQ/hICFcXuuS5Zjveiy4Mpja5ILZjO
   eIweA5Z3zHumbags3luW2uI4ryNtJ6l9EHTRKQWPYepQ+VB7FwDeeH30v
   rxOhr4Difs8ItIrMJtdMibpMh3i0x7qD/nTMQT84ytdr5Xeh0LehzSqMn
   s3/FIsf7afP9EaTsmFk4h2nM0kY3CvgyjF3wXKuYAzTwYcInED97yRSLu
   CRo4eIol8SHArxVR8JWqSMY9vMX5eKGT/v9el12EkbbXeO3/lJbb5/Pot
   A==;
X-CSE-ConnectionGUID: yNLCh3lgS9aAblPEL4e3MQ==
X-CSE-MsgGUID: 5/K3xkx9RDO9rMDr+iM2Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38744029"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38744029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:13:13 -0800
X-CSE-ConnectionGUID: XpSTBBBKTzujGBnw8bv+VA==
X-CSE-MsgGUID: lboan0zgQ3qbbTFuKT0XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97816950"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2024 22:13:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnIz-000G9F-1r;
	Wed, 18 Dec 2024 06:13:09 +0000
Date: Wed, 18 Dec 2024 14:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1467/4476] drivers/net/usb/lan78xx.c:2839
 lan78xx_init_ltm() warn: missing unwind goto?
Message-ID: <202412181421.ZlG5ds9w-lkp@intel.com>
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
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa366f1b6e376c38966faa42da7f0f2e013fdab
commit: 77586156b517c1d38a22c0a8662fe9401ab0f580 [1467/4476] net: usb: lan78xx: Add error handling to lan78xx_init_ltm
:::::: branch date: 2 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-r073-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181421.ZlG5ds9w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412181421.ZlG5ds9w-lkp@intel.com/

smatch warnings:
drivers/net/usb/lan78xx.c:2839 lan78xx_init_ltm() warn: missing unwind goto?

vim +2839 drivers/net/usb/lan78xx.c

55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2809  
77586156b517c1 Oleksij Rempel            2024-12-04  2810  static int lan78xx_init_ltm(struct lan78xx_net *dev)
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2811  {
77586156b517c1 Oleksij Rempel            2024-12-04  2812  	u32 regs[6] = { 0 };
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2813  	int ret;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2814  	u32 buf;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2815  
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2816  	ret = lan78xx_read_reg(dev, USB_CFG1, &buf);
77586156b517c1 Oleksij Rempel            2024-12-04  2817  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2818  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2819  
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2820  	if (buf & USB_CFG1_LTM_ENABLE_) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2821  		u8 temp[2];
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2822  		/* Get values from EEPROM first */
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2823  		if (lan78xx_read_eeprom(dev, 0x3F, 2, temp) == 0) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2824  			if (temp[0] == 24) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2825  				ret = lan78xx_read_raw_eeprom(dev,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2826  							      temp[1] * 2,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2827  							      24,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2828  							      (u8 *)regs);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2829  				if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2830  					return ret;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2831  			}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2832  		} else if (lan78xx_read_otp(dev, 0x3F, 2, temp) == 0) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2833  			if (temp[0] == 24) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2834  				ret = lan78xx_read_raw_otp(dev,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2835  							   temp[1] * 2,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2836  							   24,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2837  							   (u8 *)regs);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2838  				if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04 @2839  					return ret;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2840  			}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2841  		}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2842  	}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2843  
77586156b517c1 Oleksij Rempel            2024-12-04  2844  	ret = lan78xx_write_reg(dev, LTM_BELT_IDLE0, regs[0]);
77586156b517c1 Oleksij Rempel            2024-12-04  2845  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2846  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2847  
77586156b517c1 Oleksij Rempel            2024-12-04  2848  	ret = lan78xx_write_reg(dev, LTM_BELT_IDLE1, regs[1]);
77586156b517c1 Oleksij Rempel            2024-12-04  2849  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2850  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2851  
77586156b517c1 Oleksij Rempel            2024-12-04  2852  	ret = lan78xx_write_reg(dev, LTM_BELT_ACT0, regs[2]);
77586156b517c1 Oleksij Rempel            2024-12-04  2853  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2854  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2855  
77586156b517c1 Oleksij Rempel            2024-12-04  2856  	ret = lan78xx_write_reg(dev, LTM_BELT_ACT1, regs[3]);
77586156b517c1 Oleksij Rempel            2024-12-04  2857  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2858  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2859  
77586156b517c1 Oleksij Rempel            2024-12-04  2860  	ret = lan78xx_write_reg(dev, LTM_INACTIVE0, regs[4]);
77586156b517c1 Oleksij Rempel            2024-12-04  2861  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2862  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2863  
77586156b517c1 Oleksij Rempel            2024-12-04  2864  	ret = lan78xx_write_reg(dev, LTM_INACTIVE1, regs[5]);
77586156b517c1 Oleksij Rempel            2024-12-04  2865  	if (ret < 0)
77586156b517c1 Oleksij Rempel            2024-12-04  2866  		goto init_ltm_failed;
77586156b517c1 Oleksij Rempel            2024-12-04  2867  
77586156b517c1 Oleksij Rempel            2024-12-04  2868  	return 0;
77586156b517c1 Oleksij Rempel            2024-12-04  2869  
77586156b517c1 Oleksij Rempel            2024-12-04  2870  init_ltm_failed:
77586156b517c1 Oleksij Rempel            2024-12-04  2871  	netdev_err(dev->net, "Failed to init LTM with error %pe\n", ERR_PTR(ret));
77586156b517c1 Oleksij Rempel            2024-12-04  2872  	return ret;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2873  }
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  2874  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
