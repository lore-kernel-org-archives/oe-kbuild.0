Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1201FB4
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685833142; x=1717369142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mT6U2O3yJTwE2tsicoJxQQeJXHMu5KnRUIXS2niAdP4=;
  b=hz9qi86OUv13JiAJn/R3ZP3P/OuYBGQABv2Bd+sWGPC1kMOp6rjHq9A4
   eANeLfhdMFi9DBZhjuPfr/GFCktNR1vvW78/uWloct1+M4i3TbGsCuP+A
   P2Ezyoc1fePApw4Y0npWm3nQBYBeU0ID3eXGpai7lEQH3fa9GF6NKZKrL
   jJcMjgD9uLCW2apnIou54nJZ0n324kIkMYhAcasrvEo/inYkhnrsanOSo
   cZuZ8FbaCGFw4JuqMjiQAPfhY+HcinjF3idoVJ9hvLz7Ofhh1O3UpQ5yD
   dDL5U2gwuzGxGH4Bf48sVat2bMVyo2fiGWasZOrWofHi3cE/U7b9Nf1PU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="353615126"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="353615126"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 15:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="708219457"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="708219457"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2023 15:59:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5aD5-00025l-1j;
	Sat, 03 Jun 2023 22:58:59 +0000
Date: Sun, 4 Jun 2023 06:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <202306040644.6ZHs55x4-lkp@intel.com>
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
In-Reply-To: <20230602084925.215411-3-william.qiu@starfivetech.com>
References: <20230602084925.215411-3-william.qiu@starfivetech.com>
TO: William Qiu <william.qiu@starfivetech.com>

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.4-rc4 next-20230602]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230602084925.215411-3-william.qiu%40starfivetech.com
patch subject: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c002-20230604 (https://download.01.org/0day-ci/archive/20230604/202306040644.6ZHs55x4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-cadence-quadspi.c:1730:6-21: WARNING: Unsigned expression compared with zero: cqspi -> num_clks     <     0

vim +1730 drivers/spi/spi-cadence-quadspi.c

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1634  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1635  static int cqspi_probe(struct platform_device *pdev)
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1636  {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1637  	const struct cqspi_driver_platdata *ddata;
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1638  	struct reset_control *rstc, *rstc_ocp, *rstc_ref;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1639  	struct device *dev = &pdev->dev;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1640  	struct spi_master *master;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1641  	struct resource *res_ahb;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1642  	struct cqspi_st *cqspi;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1643  	int ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1644  	int irq;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1645  
606e5d40818498 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-05-11  1646  	master = devm_spi_alloc_master(&pdev->dev, sizeof(*cqspi));
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1647  	if (!master) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1648  		dev_err(&pdev->dev, "spi_alloc_master failed\n");
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1649  		return -ENOMEM;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1650  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1651  	master->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1652  	master->mem_ops = &cqspi_mem_ops;
a9be454927de3b drivers/spi/spi-cadence-quadspi.c                 Miquel Raynal              2022-01-27  1653  	master->mem_caps = &cqspi_mem_caps;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1654  	master->dev.of_node = pdev->dev.of_node;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1655  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1656  	cqspi = spi_master_get_devdata(master);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1657  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1658  	cqspi->pdev = pdev;
606e5d40818498 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-05-11  1659  	cqspi->master = master;
ea94191e584b14 drivers/spi/spi-cadence-quadspi.c                 Meng Li                    2021-03-11  1660  	platform_set_drvdata(pdev, cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1661  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1662  	/* Obtain configuration from OF. */
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1663  	ret = cqspi_of_get_pdata(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1664  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1665  		dev_err(dev, "Cannot get mandatory OF data.\n");
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1666  		return -ENODEV;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1667  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1668  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1669  	/* Obtain QSPI clock. */
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1670  	cqspi->clk = devm_clk_get(dev, NULL);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1671  	if (IS_ERR(cqspi->clk)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1672  		dev_err(dev, "Cannot claim QSPI clock.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1673  		ret = PTR_ERR(cqspi->clk);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1674  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1675  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1676  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1677  	/* Obtain and remap controller address. */
4e12ef2b2e3f65 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2022-09-28  1678  	cqspi->iobase = devm_platform_ioremap_resource(pdev, 0);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1679  	if (IS_ERR(cqspi->iobase)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1680  		dev_err(dev, "Cannot remap controller address.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1681  		ret = PTR_ERR(cqspi->iobase);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1682  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1683  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1684  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1685  	/* Obtain and remap AHB address. */
4e12ef2b2e3f65 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2022-09-28  1686  	cqspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res_ahb);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1687  	if (IS_ERR(cqspi->ahb_base)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1688  		dev_err(dev, "Cannot remap AHB address.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1689  		ret = PTR_ERR(cqspi->ahb_base);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1690  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1691  	}
ffa639e069fb55 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2018-04-10  1692  	cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
a27f2eaf2b2757 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-12-29  1693  	cqspi->ahb_size = resource_size(res_ahb);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1694  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1695  	init_completion(&cqspi->transfer_complete);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1696  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1697  	/* Obtain IRQ line. */
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1698  	irq = platform_get_irq(pdev, 0);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1699  	if (irq < 0)
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1700  		return -ENXIO;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1701  
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1702  	pm_runtime_enable(dev);
b7be05d5e4a304 drivers/spi/spi-cadence-quadspi.c                 Minghao Chi                2022-04-14  1703  	ret = pm_runtime_resume_and_get(dev);
b7be05d5e4a304 drivers/spi/spi-cadence-quadspi.c                 Minghao Chi                2022-04-14  1704  	if (ret < 0)
4d0ef0a1c35189 drivers/spi/spi-cadence-quadspi.c                 Zhang Qilong               2022-09-24  1705  		goto probe_pm_failed;
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1706  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1707  	ret = clk_prepare_enable(cqspi->clk);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1708  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1709  		dev_err(dev, "Cannot enable QSPI clock.\n");
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1710  		goto probe_clk_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1711  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1712  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1713  	/* Obtain QSPI reset control */
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1714  	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1715  	if (IS_ERR(rstc)) {
ac9978fcad3c5a drivers/spi/spi-cadence-quadspi.c                 Zhihao Cheng               2020-11-16  1716  		ret = PTR_ERR(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1717  		dev_err(dev, "Cannot get QSPI reset.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1718  		goto probe_reset_failed;
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1719  	}
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1720  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1721  	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1722  	if (IS_ERR(rstc_ocp)) {
ac9978fcad3c5a drivers/spi/spi-cadence-quadspi.c                 Zhihao Cheng               2020-11-16  1723  		ret = PTR_ERR(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1724  		dev_err(dev, "Cannot get QSPI OCP reset.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1725  		goto probe_reset_failed;
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1726  	}
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1727  
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1728  	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1729  		cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02 @1730  		if (cqspi->num_clks < 0) {
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1731  			dev_err(dev, "Cannot claim clock: %u\n", cqspi->num_clks);
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1732  			return -EINVAL;
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1733  		}
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1734  
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1735  		ret = clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1736  		if (ret)
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1737  			dev_err(dev, "Cannot enable clock clks\n");
6bbd49e32d407d drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-06-02  1738  
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1739  		rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1740  		if (IS_ERR(rstc_ref)) {
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1741  			ret = PTR_ERR(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1742  			dev_err(dev, "Cannot get QSPI REF reset.\n");
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1743  			goto probe_reset_failed;
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1744  		}
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1745  		reset_control_assert(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1746  		reset_control_deassert(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1747  	}
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1748  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1749  	reset_control_assert(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1750  	reset_control_deassert(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1751  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1752  	reset_control_assert(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1753  	reset_control_deassert(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1754  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1755  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
3a5c09c8d1ed9a drivers/spi/spi-cadence-quadspi.c                 Pratyush Yadav             2020-12-23  1756  	master->max_speed_hz = cqspi->master_ref_clk_hz;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1757  
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1758  	/* write completion is supported by default */
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1759  	cqspi->wr_completion = true;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1760  
2cc788387497d1 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2019-02-12  1761  	ddata  = of_device_get_match_data(dev);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1762  	if (ddata) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1763  		if (ddata->quirks & CQSPI_NEEDS_WR_DELAY)
f453f293979fb6 drivers/spi/spi-cadence-quadspi.c                 Pratyush Yadav             2020-12-23  1764  			cqspi->wr_delay = 50 * DIV_ROUND_UP(NSEC_PER_SEC,
61dc8493bae9ba drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1765  						cqspi->master_ref_clk_hz);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1766  		if (ddata->hwcaps_mask & CQSPI_SUPPORTS_OCTAL)
f453f293979fb6 drivers/spi/spi-cadence-quadspi.c                 Pratyush Yadav             2020-12-23  1767  			master->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1768  		if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE)) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1769  			cqspi->use_direct_mode = true;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1770  			cqspi->use_direct_mode_wr = true;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1771  		}
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1772  		if (ddata->quirks & CQSPI_SUPPORT_EXTERNAL_DMA)
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1773  			cqspi->use_dma_read = true;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1774  		if (ddata->quirks & CQSPI_NO_SUPPORT_WR_COMPLETION)
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1775  			cqspi->wr_completion = false;
9ee5b6d53b8c99 drivers/spi/spi-cadence-quadspi.c                 Niravkumar L Rabara        2022-08-13  1776  		if (ddata->quirks & CQSPI_SLOW_SRAM)
9ee5b6d53b8c99 drivers/spi/spi-cadence-quadspi.c                 Niravkumar L Rabara        2022-08-13  1777  			cqspi->slow_sram = true;
f5c2f9f9584353 drivers/spi/spi-cadence-quadspi.c                 Brad Larson                2023-05-15  1778  		if (ddata->quirks & CQSPI_NEEDS_APB_AHB_HAZARD_WAR)
f5c2f9f9584353 drivers/spi/spi-cadence-quadspi.c                 Brad Larson                2023-05-15  1779  			cqspi->apb_ahb_hazard = true;
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1780  
09e393e3f13970 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1781  		if (of_device_is_compatible(pdev->dev.of_node,
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1782  					    "xlnx,versal-ospi-1.0"))
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1783  			dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1784  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1785  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1786  	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1787  			       pdev->name, cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1788  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1789  		dev_err(dev, "Cannot request IRQ.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1790  		goto probe_reset_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1791  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1792  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1793  	cqspi_wait_idle(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1794  	cqspi_controller_init(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1795  	cqspi->current_cs = -1;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1796  	cqspi->sclk = 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1797  
b436fb7d29bfa4 drivers/spi/spi-cadence-quadspi.c                 Ramuthevar Vadivel Murugan 2020-11-24  1798  	master->num_chipselect = cqspi->num_chipselect;
b436fb7d29bfa4 drivers/spi/spi-cadence-quadspi.c                 Ramuthevar Vadivel Murugan 2020-11-24  1799  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1800  	ret = cqspi_setup_flash(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1801  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1802  		dev_err(dev, "failed to setup flash parameters %d\n", ret);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1803  		goto probe_setup_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1804  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1805  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1806  	if (cqspi->use_direct_mode) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1807  		ret = cqspi_request_mmap_dma(cqspi);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1808  		if (ret == -EPROBE_DEFER)
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1809  			goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1810  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1811  
606e5d40818498 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-05-11  1812  	ret = spi_register_master(master);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1813  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1814  		dev_err(&pdev->dev, "failed to register SPI ctlr %d\n", ret);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1815  		goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1816  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1817  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1818  	return 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1819  probe_setup_failed:
329864d35a7f49 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1820  	cqspi_controller_enable(cqspi, 0);
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1821  probe_reset_failed:
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1822  	clk_disable_unprepare(cqspi->clk);
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1823  probe_clk_failed:
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1824  	pm_runtime_put_sync(dev);
4d0ef0a1c35189 drivers/spi/spi-cadence-quadspi.c                 Zhang Qilong               2022-09-24  1825  probe_pm_failed:
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1826  	pm_runtime_disable(dev);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1827  	return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1828  }
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
