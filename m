Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F1345CAA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827338; cv=none; b=mnGRrz5aT28HVkNtVAx8G0E289D2N0Ilwsj2NXT6Vki7gsbMO7o+Havnd5V2mhEOYud8mpsu7DTd9Ptlu8YcC5tnk0roCO7OU0uMaZcjpYzKZvNN0H/vAz/6WbKTK2dVG7X3+es/sFa+xuP3jPbaSgXJLz/pyR3vxiW5S37izuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827338; c=relaxed/simple;
	bh=tf7Iexrh2tQeWcIcoWL+PnVnoNawsdnfwZHIMKn0C9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sS8f9Jy/hF2GEVW2gocDQP6NZlxKnaTqUZw3rjdvQmpGlIJIU93YLdeQOfTIKa4f1J6raEQQvyoGTg57Oas4HHeX7unjPnEV/8Ur0ZKhldkbd65esgiTYtTBQqXd+Acwu2Lz9msT+arJH/V1vOgarTSLvNA8jOgiCCDijNTax6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7cGqq4j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7cGqq4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765827336; x=1797363336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tf7Iexrh2tQeWcIcoWL+PnVnoNawsdnfwZHIMKn0C9E=;
  b=e7cGqq4jFwyvXD24tOqfJu/89rLgkBfFGxl0oqdBndoZfvzgapM1ZgV2
   p08HKlOVUBO2rRr/ue/zTE3FEsQTaTpcXLc7qutaxXCSRTigfGiWAMz3A
   dkzhAtTsHv6Skk52WcvKLd2VsyqSSqqQkHCw8F8JfWEODAV27ZG8agHXA
   IOizEDMmadkvtxAhAwG/fhctxm9JLDS7Ti3dbLXYSdd10WORfaE0gDd4u
   NtTLyeqlhB240lwVfpy9GKZGp/2OMQ9T/xxNsgVALznj3pIIMt71PpNin
   +46w12GkX+6phNN7RknSKTJ7F6XTLY7LKELKoozzKGOnS/0akRBauFHvs
   A==;
X-CSE-ConnectionGUID: Lqk/Ncy9TPi/Ka5BUxeJug==
X-CSE-MsgGUID: V9rU/KPLTRegOdXYhW6a/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67493141"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67493141"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:35:36 -0800
X-CSE-ConnectionGUID: zOd/Qck5S9mCO50qImy12g==
X-CSE-MsgGUID: /KCoYLlXTxm8bbfkssC8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197082472"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 11:35:34 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVELz-000000000fh-3fqR;
	Mon, 15 Dec 2025 19:35:31 +0000
Date: Tue, 16 Dec 2025 03:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/usb/lan78xx.c:2839 lan78xx_init_ltm() warn: missing
 unwind goto?
Message-ID: <202512160351.CcLAnC0X-lkp@intel.com>
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
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 77586156b517c1d38a22c0a8662fe9401ab0f580 net: usb: lan78xx: Add error handling to lan78xx_init_ltm
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160351.CcLAnC0X-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160351.CcLAnC0X-lkp@intel.com/

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
