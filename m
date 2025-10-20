Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8823126DA
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968138; cv=none; b=n+/GEi7M7fgY+937zDfOyn272BiFoNF9GCnf4wVCgqGAdwURO1zJK8uly02i7fqQhVl+zPW4PoMtuAQ/woqndoBCi7wyTR1LCF78m5ezF3BAUCy5rldNcow1GwiY1UkrKKZRiKChn0VCJK9UJcipzTKVtSKQRLeFCLTRwHgUBDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968138; c=relaxed/simple;
	bh=R3L4qW/YkDHlv0VyWaP33qH1lwes6OtN9YzkExwMtuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcLPHPKykyd0459pEPUPlBo/b0EitkDA8XgGEuJcQMEaA8FmNxxS0Rij63neIYDQhzHyZuh4slADSqELOB8zJlpTyPgimTacu6M+lRSY96RVHiF0Ni0OtYYasIFnJTJLeD2LKHz2JvJyutFDWLRUJRJgbKF+gE+s3nPR/W4Unhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUwzRART; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUwzRART"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760968137; x=1792504137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3L4qW/YkDHlv0VyWaP33qH1lwes6OtN9YzkExwMtuQ=;
  b=JUwzRART/IXefRlH8XWurUnxDscD2k0r/IhTOPLHfOAtHWxj21af7QUT
   gG+0phelVTFvim58K/UvbOG85m3tu6XJ6F6lP2X+Dxa2OgPiFsjp/2+4c
   1Jgz3MWYVeGe/GCLiSidmSek5W9WA7+1HTstECJS6JFYloZevnqfpGRP9
   8Hh6WcAFaf5bgzL36jMK1jMjvOiW9ctd5FmWPtNqNToAGbwI/VXC5WpOX
   3UMGc31L9hD4E0E80rYHs1vcAmHVdlzFfVZYzGDzO2nEeVic1ROmqZHQC
   aEjc0IyTTRtmfCRPE6nAl51q/3Jp0BDOSbrIsjUr4aMm3m8BpxA/rAicp
   A==;
X-CSE-ConnectionGUID: raA7pVqPS/OKONEhVPNLeQ==
X-CSE-MsgGUID: 7jtCi8gjQU+mjm6dKp3L9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65696229"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="65696229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 06:48:56 -0700
X-CSE-ConnectionGUID: P4rt0d1sRtCEAhFJLjfMiQ==
X-CSE-MsgGUID: xiFGc59cR7aHbYnQ6uIFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183741470"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2025 06:48:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAqFp-0009sH-0x;
	Mon, 20 Oct 2025 13:48:53 +0000
Date: Mon, 20 Oct 2025 21:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/bridge/tda998x_drv.c:1715:25: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202510202105.G5KVmw9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/tda998x_drv.c:1715:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   211ddde0823f1442e4ad052a2f30f050145ccada
commit: 325ba852d148434c5bcb06d513af1933a7f77b70 drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-r113-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202105.G5KVmw9R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202105.G5KVmw9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510202105.G5KVmw9R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1717:50: sparse:     got unsigned int const [usertype] *
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1718:52: sparse:     got unsigned int const [usertype] *
>> drivers/gpu/drm/bridge/tda998x_drv.c:1715:25: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/gpu/drm/bridge/tda998x_drv.c:1747:16: sparse: signed value source

vim +1715 drivers/gpu/drm/bridge/tda998x_drv.c

e7792ce2da5ded8 drivers/gpu/drm/i2c/tda998x_drv.c Rob Clark        2013-01-08  1694  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1695  static int tda998x_get_audio_ports(struct tda998x_priv *priv,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1696  				   struct device_node *np)
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1697  {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1698  	const u32 *port_data;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1699  	u32 size;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1700  	int i;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1701  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1702  	port_data = of_get_property(np, "audio-ports", &size);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1703  	if (!port_data)
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1704  		return 0;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1705  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1706  	size /= sizeof(u32);
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1707  	if (size > 2 * ARRAY_SIZE(priv->audio_port_enable) || size % 2 != 0) {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1708  		dev_err(&priv->hdmi->dev,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1709  			"Bad number of elements in audio-ports dt-property\n");
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1710  		return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1711  	}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1712  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1713  	size /= 2;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1714  
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09 @1715  	for (i = 0; i < size; i++) {
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1716  		unsigned int route;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1717  		u8 afmt = be32_to_cpup(&port_data[2*i]);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1718  		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1719  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1720  		switch (afmt) {
b7c5169ab9ddc34 drivers/gpu/drm/i2c/tda998x_drv.c Dmitry Baryshkov 2025-01-13  1721  		case TDA998x_I2S:
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1722  			route = AUDIO_ROUTE_I2S;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1723  			break;
b7c5169ab9ddc34 drivers/gpu/drm/i2c/tda998x_drv.c Dmitry Baryshkov 2025-01-13  1724  		case TDA998x_SPDIF:
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1725  			route = AUDIO_ROUTE_SPDIF;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1726  			break;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1727  		default:
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1728  			dev_err(&priv->hdmi->dev,
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1729  				"Bad audio format %u\n", afmt);
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1730  			return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1731  		}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1732  
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1733  		if (!ena_ap) {
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1734  			dev_err(&priv->hdmi->dev, "invalid zero port config\n");
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1735  			continue;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1736  		}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1737  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1738  		if (priv->audio_port_enable[route]) {
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1739  			dev_err(&priv->hdmi->dev,
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1740  				"%s format already configured\n",
125a4f9394c769b drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1741  				route == AUDIO_ROUTE_SPDIF ? "SPDIF" : "I2S");
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1742  			return -EINVAL;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1743  		}
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1744  
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1745  		priv->audio_port_enable[route] = ena_ap;
7168916072b5493 drivers/gpu/drm/i2c/tda998x_drv.c Russell King     2019-03-01  1746  	}
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09 @1747  	return 0;
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1748  }
7e567624dc5a442 drivers/gpu/drm/i2c/tda998x_drv.c Jyri Sarha       2016-08-09  1749  

:::::: The code at line 1715 was first introduced by commit
:::::: 7e567624dc5a44276d9df253f5ca829d911b4e93 drm/i2c: tda998x: Register ASoC hdmi-codec and add audio DT binding

:::::: TO: Jyri Sarha <jsarha@ti.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
