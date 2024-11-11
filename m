Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07343848C
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 00:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731285912; cv=none; b=bxHlSSXRFl/X+0LSV0lxepfmGTayg4LA+8AnX2ZgPEeOoUooZqBrkH6dxS/B+OUSIvPP/xqbAHuuMAXU2/zDQnrj07cpk8jpSv6ZdtnbqhXZzaY4NbndNMjDC9AA7GPTjbSq/+8nbFYyGhTfKRZNTo7aOOZTTnwVE5cGa9OFmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731285912; c=relaxed/simple;
	bh=Iv5yyolE50pROkKhmK+YJ3qvsiDsQdiC2xzdw6i5QPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OI6/CFEG1/U5PLbIlac4stC1xLd0Q4o2gkMOLBbhc3tkU+0kPmFrXk5z69g8hQTJs6e1UZljYdjk55p+qHfnEQDUZZTQnr3neEh/QR4jz7LE9IoMFBugi0YcpBL/Rqkwbeejjk6A5BOC/FtN2yd5C8DZ+Bf2uuk43oeR4WtVIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrryFwho; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrryFwho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731285910; x=1762821910;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Iv5yyolE50pROkKhmK+YJ3qvsiDsQdiC2xzdw6i5QPw=;
  b=LrryFwhoG3VS3t7mCQvJKigqd5EM6QkU1Bi07e7szqloXydS8/cB1vXb
   grcqvMI1pMU935hqfsafBEoKsORFeht3LsN9fGnwc+qnGGcBke33TO2Fs
   svbUTtbI/W0Mnm/8hVVHUnC3yHOA9Qe13xsmesruzYWvti9yXs82kqjot
   jw+X45wV+c+7AntXS+EVQRYFT2dm2pAR5fj0m+pCRLh/AbcoFL01tDGDA
   hBefy3gQ0edtS4bGT66wNfHe2bDOSVd4kq1imSgMRzfmcwtJZ4H/GigHM
   jvFqNdCVvBVfuRPSzYTvWnTBShorOP2Mvsse2lHJXFnpp6ihxbw4VVPsn
   g==;
X-CSE-ConnectionGUID: hinjYXrKQB+KFKujI0ic6g==
X-CSE-MsgGUID: W+SSbZHGSye6lMjpHIjm2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="34872629"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="34872629"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 16:45:09 -0800
X-CSE-ConnectionGUID: H0CKDzLhQ7anZswIAF2QkQ==
X-CSE-MsgGUID: UWnmp6IpQZ2Chx2MQBNRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86803438"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Nov 2024 16:45:07 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAIYD-0000Vw-0M;
	Mon, 11 Nov 2024 00:45:05 +0000
Date: Mon, 11 Nov 2024 08:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] net: modernize ioremap in probe
Message-ID: <202411110835.tTxOya6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241109233641.8313-1-rosenp@gmail.com>
References: <20241109233641.8313-1-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: netdev@vger.kernel.org
CC: Chandrasekar Ramakrishnan <rcsekar@samsung.com>
CC: "Marc Kleine-Budde" <mkl@pengutronix.de>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Kurt Kanzenbach <kurt@linutronix.de>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Chris Snook <chris.snook@gmail.com>
CC: Marcin Wojtas <marcin.s.wojtas@gmail.com>
CC: Russell King <linux@armlinux.org.uk>
CC: Horatiu Vultur <horatiu.vultur@microchip.com>
CC: UNGLinuxDriver@microchip.com
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
CC: Doug Berger <opendmb@gmail.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>
CC: linux-can@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on next-20241108]
[cannot apply to mkl-can-next/testing net/main linus/master v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-modernize-ioremap-in-probe/20241110-073751
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241109233641.8313-1-rosenp%40gmail.com
patch subject: [PATCH] net: modernize ioremap in probe
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110835.tTxOya6U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411110835.tTxOya6U-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/freescale/xgmac_mdio.c:395 xgmac_mdio_probe() error: uninitialized symbol 'res'.

vim +/res +395 drivers/net/ethernet/freescale/xgmac_mdio.c

909bea73485fab Tobias Waldekranz 2022-01-26  370  
33897cc869eef8 Bill Pemberton    2012-12-03  371  static int xgmac_mdio_probe(struct platform_device *pdev)
9f35a7342cff0b Timur Tabi        2012-08-20  372  {
ac53c26433b51f Marcin Wojtas     2021-06-25  373  	struct fwnode_handle *fwnode;
73ee5442978b2d Shaohui Xie       2015-03-16  374  	struct mdio_fsl_priv *priv;
15e7064e879335 Calvin Johnson    2021-06-11  375  	struct resource *res;
15e7064e879335 Calvin Johnson    2021-06-11  376  	struct mii_bus *bus;
9f35a7342cff0b Timur Tabi        2012-08-20  377  	int ret;
9f35a7342cff0b Timur Tabi        2012-08-20  378  
229f4bb47512ec Calvin Johnson    2020-06-22  379  	/* In DPAA-1, MDIO is one of the many FMan sub-devices. The FMan
229f4bb47512ec Calvin Johnson    2020-06-22  380  	 * defines a register space that spans a large area, covering all the
229f4bb47512ec Calvin Johnson    2020-06-22  381  	 * subdevice areas. Therefore, MDIO cannot claim exclusive access to
229f4bb47512ec Calvin Johnson    2020-06-22  382  	 * this register area.
229f4bb47512ec Calvin Johnson    2020-06-22  383  	 */
9f35a7342cff0b Timur Tabi        2012-08-20  384  
1d14eb15dc2c39 Tobias Waldekranz 2022-01-26  385  	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(struct mdio_fsl_priv));
9f35a7342cff0b Timur Tabi        2012-08-20  386  	if (!bus)
9f35a7342cff0b Timur Tabi        2012-08-20  387  		return -ENOMEM;
9f35a7342cff0b Timur Tabi        2012-08-20  388  
9f35a7342cff0b Timur Tabi        2012-08-20  389  	bus->name = "Freescale XGMAC MDIO Bus";
c0fc8e6dcee40c Andrew Lunn       2023-01-09  390  	bus->read = xgmac_mdio_read_c22;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  391  	bus->write = xgmac_mdio_write_c22;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  392  	bus->read_c45 = xgmac_mdio_read_c45;
c0fc8e6dcee40c Andrew Lunn       2023-01-09  393  	bus->write_c45 = xgmac_mdio_write_c45;
9f35a7342cff0b Timur Tabi        2012-08-20  394  	bus->parent = &pdev->dev;
229f4bb47512ec Calvin Johnson    2020-06-22 @395  	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res->start);
9f35a7342cff0b Timur Tabi        2012-08-20  396  
73ee5442978b2d Shaohui Xie       2015-03-16  397  	priv = bus->priv;
865bbb2945a161 Rosen Penev       2024-11-09  398  	priv->mdio_base = devm_platform_ioremap_resource(pdev, 0);
865bbb2945a161 Rosen Penev       2024-11-09  399  	if (IS_ERR(priv->mdio_base))
865bbb2945a161 Rosen Penev       2024-11-09  400  		return PTR_ERR(priv->mdio_base);
9f35a7342cff0b Timur Tabi        2012-08-20  401  
15e7064e879335 Calvin Johnson    2021-06-11  402  	/* For both ACPI and DT cases, endianness of MDIO controller
15e7064e879335 Calvin Johnson    2021-06-11  403  	 * needs to be specified using "little-endian" property.
15e7064e879335 Calvin Johnson    2021-06-11  404  	 */
229f4bb47512ec Calvin Johnson    2020-06-22  405  	priv->is_little_endian = device_property_read_bool(&pdev->dev,
07bf2e11ad0586 Julia Lawall      2016-08-05  406  							   "little-endian");
73ee5442978b2d Shaohui Xie       2015-03-16  407  
6198c722019774 Tobias Waldekranz 2022-01-18  408  	priv->has_a009885 = device_property_read_bool(&pdev->dev,
6198c722019774 Tobias Waldekranz 2022-01-18  409  						      "fsl,erratum-a009885");
229f4bb47512ec Calvin Johnson    2020-06-22  410  	priv->has_a011043 = device_property_read_bool(&pdev->dev,
1d3ca681b9d957 Madalin Bucur     2020-01-22  411  						      "fsl,erratum-a011043");
1d3ca681b9d957 Madalin Bucur     2020-01-22  412  
909bea73485fab Tobias Waldekranz 2022-01-26  413  	xgmac_mdio_set_suppress_preamble(bus);
909bea73485fab Tobias Waldekranz 2022-01-26  414  
dd8f467eda72cd Tobias Waldekranz 2022-01-26  415  	ret = xgmac_mdio_set_mdc_freq(bus);
dd8f467eda72cd Tobias Waldekranz 2022-01-26  416  	if (ret)
dd8f467eda72cd Tobias Waldekranz 2022-01-26  417  		return ret;
dd8f467eda72cd Tobias Waldekranz 2022-01-26  418  
105b0468d7b2e6 zhaoxiao          2022-08-18  419  	fwnode = dev_fwnode(&pdev->dev);
ac53c26433b51f Marcin Wojtas     2021-06-25  420  	if (is_of_node(fwnode))
ac53c26433b51f Marcin Wojtas     2021-06-25  421  		ret = of_mdiobus_register(bus, to_of_node(fwnode));
ac53c26433b51f Marcin Wojtas     2021-06-25  422  	else if (is_acpi_node(fwnode))
ac53c26433b51f Marcin Wojtas     2021-06-25  423  		ret = acpi_mdiobus_register(bus, fwnode);
ac53c26433b51f Marcin Wojtas     2021-06-25  424  	else
ac53c26433b51f Marcin Wojtas     2021-06-25  425  		ret = -EINVAL;
9f35a7342cff0b Timur Tabi        2012-08-20  426  	if (ret) {
9f35a7342cff0b Timur Tabi        2012-08-20  427  		dev_err(&pdev->dev, "cannot register MDIO bus\n");
9f35a7342cff0b Timur Tabi        2012-08-20  428  		return ret;
9f35a7342cff0b Timur Tabi        2012-08-20  429  	}
9f35a7342cff0b Timur Tabi        2012-08-20  430  
1d14eb15dc2c39 Tobias Waldekranz 2022-01-26  431  	platform_set_drvdata(pdev, bus);
9f35a7342cff0b Timur Tabi        2012-08-20  432  
9f35a7342cff0b Timur Tabi        2012-08-20  433  	return 0;
9f35a7342cff0b Timur Tabi        2012-08-20  434  }
9f35a7342cff0b Timur Tabi        2012-08-20  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
