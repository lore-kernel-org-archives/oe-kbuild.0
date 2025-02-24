Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873EE1CBE8C
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740424933; cv=none; b=A0QH41q/Gy4f0w7aLW8bGRbu4pS48oRlEmqvC2E7NcA13hPcCivvD/Nu9j4GutDcjLjhMLa5zRt01o0fAlQXzPyETgFTXyIIjT94d/CexD7eIz2cUW5ecp6HCLvR4Y6Ny7QDcQ0KxxApxyFuMOqzvGHHy/fCMSQSXLZJcmLDZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740424933; c=relaxed/simple;
	bh=WBaZJl2yXWkWhHpxmkphAVlGdb1ySGQz55R1Icg5WKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5sWxAWSMr/btOKmxjYG9W8Mp3sLkAAaK74muR2vFIlamIFZ3x2ogz6CMJN6a/yV4Tw6fpdXk7370VRgup/bcFRWxRVyfapoT8HPQS5eRVD+5FXjrxCij6XCpOSwCLQ5i4OrBWd2ovOTDYy//A/fZCRvAr1aDl/Jynu37xRrAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJRU1iXJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJRU1iXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740424931; x=1771960931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBaZJl2yXWkWhHpxmkphAVlGdb1ySGQz55R1Icg5WKI=;
  b=BJRU1iXJOpVH7WId9FzonCLXFcNCo6ln3tr9T+lfx0ftfW7EGTzlc3EY
   9TJmYUk0wSXhFWixGfZVRaBbnLVmCx0aRFyyTankW1+nAiWmKbIiqcxS7
   BzTG24MKv3+lTs5eGGk3Unhq1OcsOpM9fMQxAp9ZfHtGl5QK4RbJLL16n
   +O4Cxl13rZ9vlf+P6qRobryu3Ah3IscycXALv1QUrgvQiqeqeiaX85KaG
   E2a6s+QR4NSdNRjXa1PY5JiDkT+gjuoH5mPfLYO/YYAe1SCNyc5rBzeW1
   9ACCiPq2hIOL/U9y193Gy4l7rKcMP5RusVsm5fsMJCBBw7tL0z1BrCoky
   A==;
X-CSE-ConnectionGUID: nmhBQB98Tkm1O2SeTRmpfw==
X-CSE-MsgGUID: sN+mFMixQ/WDasocc4lyww==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41461094"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="41461094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 11:22:09 -0800
X-CSE-ConnectionGUID: toEaFSFwQreG1MkqLS9CjA==
X-CSE-MsgGUID: /4SW6L5uSbGlBbmidSyWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="115950057"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 11:22:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tme1m-0009GH-0z;
	Mon, 24 Feb 2025 19:22:06 +0000
Date: Tue, 25 Feb 2025 03:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-fsl-dspi.c:1023:21-23: WARNING opportunity for max()
Message-ID: <202502250325.26EBSnVm-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: 52e78777b6bfd4bc47448791a99d5f97c82ff81c spi: fsl-dspi: use common proptery 'spi-cs-setup(hold)-delay-ns'
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r052-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250325.26EBSnVm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502250325.26EBSnVm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-fsl-dspi.c:1023:21-23: WARNING opportunity for max()
   drivers/spi/spi-fsl-dspi.c:1030:22-24: WARNING opportunity for max()

vim +1023 drivers/spi/spi-fsl-dspi.c

349ad66c0ab0b3 Chao Fu                             2013-08-16   996  
9298bc727385cd Chao Fu                             2015-01-27   997  static int dspi_setup(struct spi_device *spi)
349ad66c0ab0b3 Chao Fu                             2013-08-16   998  {
3a11ea664be6ff Vladimir Oltean                     2019-08-18   999  	struct fsl_dspi *dspi = spi_controller_get_devdata(spi->controller);
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1000  	u32 period_ns = DIV_ROUND_UP(NSEC_PER_SEC, spi->max_speed_hz);
95bf15f386417f Aaron Brice                         2015-04-03  1001  	unsigned char br = 0, pbr = 0, pcssck = 0, cssck = 0;
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1002  	u32 quarter_period_ns = DIV_ROUND_UP(period_ns, 4);
d6bdfa6c203d16 Vladimir Oltean                     2019-08-18  1003  	u32 cs_sck_delay = 0, sck_cs_delay = 0;
d6bdfa6c203d16 Vladimir Oltean                     2019-08-18  1004  	struct fsl_dspi_platform_data *pdata;
dadcf4abd60ba6 Esben Haabendal                     2018-06-20  1005  	unsigned char pasc = 0, asc = 0;
d6bdfa6c203d16 Vladimir Oltean                     2019-08-18  1006  	struct chip_data *chip;
95bf15f386417f Aaron Brice                         2015-04-03  1007  	unsigned long clkrate;
84b60f2bce1f04 Radu Pirea (NXP OSS                 2022-11-11  1008) 	bool cs = true;
52e78777b6bfd4 Frank Li                            2024-06-24  1009  	int val;
349ad66c0ab0b3 Chao Fu                             2013-08-16  1010  
349ad66c0ab0b3 Chao Fu                             2013-08-16  1011  	/* Only alloc on first setup */
349ad66c0ab0b3 Chao Fu                             2013-08-16  1012  	chip = spi_get_ctldata(spi);
349ad66c0ab0b3 Chao Fu                             2013-08-16  1013  	if (chip == NULL) {
973fbce69ed8e7 Bhuvanchandra DV                    2015-01-27  1014  		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
349ad66c0ab0b3 Chao Fu                             2013-08-16  1015  		if (!chip)
349ad66c0ab0b3 Chao Fu                             2013-08-16  1016  			return -ENOMEM;
349ad66c0ab0b3 Chao Fu                             2013-08-16  1017  	}
349ad66c0ab0b3 Chao Fu                             2013-08-16  1018  
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1019  	pdata = dev_get_platdata(&dspi->pdev->dev);
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1020  
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1021  	if (!pdata) {
52e78777b6bfd4 Frank Li                            2024-06-24  1022  		val = spi_delay_to_ns(&spi->cs_setup, NULL);
52e78777b6bfd4 Frank Li                            2024-06-24 @1023  		cs_sck_delay = val >= 0 ? val : 0;
52e78777b6bfd4 Frank Li                            2024-06-24  1024  		if (!cs_sck_delay)
52e78777b6bfd4 Frank Li                            2024-06-24  1025  			of_property_read_u32(spi->dev.of_node,
52e78777b6bfd4 Frank Li                            2024-06-24  1026  					     "fsl,spi-cs-sck-delay",
95bf15f386417f Aaron Brice                         2015-04-03  1027  					     &cs_sck_delay);
95bf15f386417f Aaron Brice                         2015-04-03  1028  
52e78777b6bfd4 Frank Li                            2024-06-24  1029  		val = spi_delay_to_ns(&spi->cs_hold, NULL);
52e78777b6bfd4 Frank Li                            2024-06-24  1030  		sck_cs_delay =  val >= 0 ? val : 0;
52e78777b6bfd4 Frank Li                            2024-06-24  1031  		if (!sck_cs_delay)
52e78777b6bfd4 Frank Li                            2024-06-24  1032  			of_property_read_u32(spi->dev.of_node,
52e78777b6bfd4 Frank Li                            2024-06-24  1033  					     "fsl,spi-sck-cs-delay",
95bf15f386417f Aaron Brice                         2015-04-03  1034  					     &sck_cs_delay);
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1035  	} else {
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1036  		cs_sck_delay = pdata->cs_sck_delay;
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1037  		sck_cs_delay = pdata->sck_cs_delay;
ec7ed7708e009e Angelo Dureghello                   2017-10-28  1038  	}
95bf15f386417f Aaron Brice                         2015-04-03  1039  
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1040  	/* Since tCSC and tASC apply to continuous transfers too, avoid SCK
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1041  	 * glitches of half a cycle by never allowing tCSC + tASC to go below
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1042  	 * half a SCK period.
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1043  	 */
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1044  	if (cs_sck_delay < quarter_period_ns)
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1045  		cs_sck_delay = quarter_period_ns;
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1046  	if (sck_cs_delay < quarter_period_ns)
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1047  		sck_cs_delay = quarter_period_ns;
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1048  
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1049  	dev_dbg(&spi->dev,
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1050  		"DSPI controller timing params: CS-to-SCK delay %u ns, SCK-to-CS delay %u ns\n",
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1051  		cs_sck_delay, sck_cs_delay);
c5c31fb71f16ba Vladimir Oltean                     2023-05-30  1052  
95bf15f386417f Aaron Brice                         2015-04-03  1053  	clkrate = clk_get_rate(dspi->clk);
95bf15f386417f Aaron Brice                         2015-04-03  1054  	hz_to_spi_baud(&pbr, &br, spi->max_speed_hz, clkrate);
95bf15f386417f Aaron Brice                         2015-04-03  1055  
95bf15f386417f Aaron Brice                         2015-04-03  1056  	/* Set PCS to SCK delay scale values */
95bf15f386417f Aaron Brice                         2015-04-03  1057  	ns_delay_scale(&pcssck, &cssck, cs_sck_delay, clkrate);
95bf15f386417f Aaron Brice                         2015-04-03  1058  
95bf15f386417f Aaron Brice                         2015-04-03  1059  	/* Set After SCK delay scale values */
95bf15f386417f Aaron Brice                         2015-04-03  1060  	ns_delay_scale(&pasc, &asc, sck_cs_delay, clkrate);
349ad66c0ab0b3 Chao Fu                             2013-08-16  1061  
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1062  	chip->ctar_val = 0;
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1063  	if (spi->mode & SPI_CPOL)
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1064  		chip->ctar_val |= SPI_CTAR_CPOL;
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1065  	if (spi->mode & SPI_CPHA)
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1066  		chip->ctar_val |= SPI_CTAR_CPHA;
5ce3cc56747189 Lukasz Majewski                     2019-02-05  1067  
6230d6cad1a70d Yang Yingliang                      2023-08-07  1068  	if (!spi_controller_is_target(dspi->ctlr)) {
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1069  		chip->ctar_val |= SPI_CTAR_PCSSCK(pcssck) |
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1070  				  SPI_CTAR_CSSCK(cssck) |
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1071  				  SPI_CTAR_PASC(pasc) |
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1072  				  SPI_CTAR_ASC(asc) |
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1073  				  SPI_CTAR_PBR(pbr) |
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1074  				  SPI_CTAR_BR(br);
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1075  
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1076  		if (spi->mode & SPI_LSB_FIRST)
06d5dd29976fb4 Vladimir Oltean                     2019-08-18  1077  			chip->ctar_val |= SPI_CTAR_LSBFE;
5ce3cc56747189 Lukasz Majewski                     2019-02-05  1078  	}
349ad66c0ab0b3 Chao Fu                             2013-08-16  1079  
9e264f3f85a56c Amit Kumar Mahapatra via Alsa-devel 2023-03-10  1080  	gpiod_direction_output(spi_get_csgpiod(spi, 0), false);
84b60f2bce1f04 Radu Pirea (NXP OSS                 2022-11-11  1081) 	dspi_deassert_cs(spi, &cs);
84b60f2bce1f04 Radu Pirea (NXP OSS                 2022-11-11  1082) 
349ad66c0ab0b3 Chao Fu                             2013-08-16  1083  	spi_set_ctldata(spi, chip);
349ad66c0ab0b3 Chao Fu                             2013-08-16  1084  
349ad66c0ab0b3 Chao Fu                             2013-08-16  1085  	return 0;
349ad66c0ab0b3 Chao Fu                             2013-08-16  1086  }
349ad66c0ab0b3 Chao Fu                             2013-08-16  1087  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
