Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6729CA
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694640127; x=1726176127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyrctvyqyYzkB42Q6sOokgoGsQ00bHjQ0J8dkNmgW7U=;
  b=kwr9GGUQw3kt8ixJ9QU8XYE4dxlcYy/15/x3j2bWbPWN8zNvBs0GCLZP
   oNGG8f0oBBiP1GQR+tu2BV4NWH+3Ih8KNG4UhmCau3kYo0hc3aWLBsGXP
   WceYHm2GQX/QWkxIFi2tamfrnUEaQtUg/wT5mx04QC7iHf0CRweaCLaur
   EiQ7PwO7aw87mU3IDoXJe50aqaVeBTWS3uPcvEpihUlSSpybvoMuVc3ss
   JgXHuSsJrMA6gpNpKAw9Xv6h1rv+o1b+AUHkZOj2vjVBB6JMd50ddJGPy
   IGwhWa6mOmwxGnj1yENxPkT2PeD3ZH5GEJ0hQUU+Y5+8Gh47shirp69TV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378713091"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="378713091"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 14:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887498303"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887498303"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 14:21:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgXJ5-0000g9-37;
	Wed, 13 Sep 2023 21:21:55 +0000
Date: Thu, 14 Sep 2023 05:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1275/4965] drivers/spi/spi-cadence-quadspi.c:1882
 cqspi_probe() warn: missing unwind goto?
Message-ID: <202309140543.03dMbMM5-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dhruva Gole <d-gole@ti.com>
CC: Mark Brown <broonie@kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e143016b56ecb0fcda5bb6026b0a25fe55274f56
commit: 0578a6dbfe7514db7134501cf93acc21cf13e479 [1275/4965] spi: spi-cadence-quadspi: add runtime pm support
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140543.03dMbMM5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140543.03dMbMM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309140543.03dMbMM5-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cadence-quadspi.c:1882 cqspi_probe() warn: missing unwind goto?

vim +1882 drivers/spi/spi-cadence-quadspi.c

33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1697  
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1698  static void cqspi_jh7110_disable_clk(struct platform_device *pdev, struct cqspi_st *cqspi)
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1699  {
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1700  	clk_disable_unprepare(cqspi->clks[CLK_QSPI_AHB]);
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1701  	clk_disable_unprepare(cqspi->clks[CLK_QSPI_APB]);
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1702  }
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1703  static int cqspi_probe(struct platform_device *pdev)
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1704  {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1705  	const struct cqspi_driver_platdata *ddata;
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1706  	struct reset_control *rstc, *rstc_ocp, *rstc_ref;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1707  	struct device *dev = &pdev->dev;
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1708  	struct spi_controller *host;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1709  	struct resource *res_ahb;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1710  	struct cqspi_st *cqspi;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1711  	int ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1712  	int irq;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1713  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1714  	host = devm_spi_alloc_host(&pdev->dev, sizeof(*cqspi));
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1715  	if (!host) {
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1716  		dev_err(&pdev->dev, "devm_spi_alloc_host failed\n");
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1717  		return -ENOMEM;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1718  	}
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1719  	host->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1720  	host->mem_ops = &cqspi_mem_ops;
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1721  	host->mem_caps = &cqspi_mem_caps;
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1722  	host->dev.of_node = pdev->dev.of_node;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1723  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1724  	cqspi = spi_controller_get_devdata(host);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1725  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1726  	cqspi->pdev = pdev;
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1727  	cqspi->host = host;
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1728  	cqspi->is_jh7110 = false;
ea94191e584b14 drivers/spi/spi-cadence-quadspi.c                 Meng Li                    2021-03-11  1729  	platform_set_drvdata(pdev, cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1730  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1731  	/* Obtain configuration from OF. */
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1732  	ret = cqspi_of_get_pdata(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1733  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1734  		dev_err(dev, "Cannot get mandatory OF data.\n");
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1735  		return -ENODEV;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1736  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1737  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1738  	/* Obtain QSPI clock. */
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1739  	cqspi->clk = devm_clk_get(dev, NULL);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1740  	if (IS_ERR(cqspi->clk)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1741  		dev_err(dev, "Cannot claim QSPI clock.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1742  		ret = PTR_ERR(cqspi->clk);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1743  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1744  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1745  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1746  	/* Obtain and remap controller address. */
4e12ef2b2e3f65 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2022-09-28  1747  	cqspi->iobase = devm_platform_ioremap_resource(pdev, 0);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1748  	if (IS_ERR(cqspi->iobase)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1749  		dev_err(dev, "Cannot remap controller address.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1750  		ret = PTR_ERR(cqspi->iobase);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1751  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1752  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1753  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1754  	/* Obtain and remap AHB address. */
4e12ef2b2e3f65 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2022-09-28  1755  	cqspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res_ahb);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1756  	if (IS_ERR(cqspi->ahb_base)) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1757  		dev_err(dev, "Cannot remap AHB address.\n");
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1758  		ret = PTR_ERR(cqspi->ahb_base);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1759  		return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1760  	}
ffa639e069fb55 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2018-04-10  1761  	cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
a27f2eaf2b2757 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-12-29  1762  	cqspi->ahb_size = resource_size(res_ahb);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1763  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1764  	init_completion(&cqspi->transfer_complete);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1765  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1766  	/* Obtain IRQ line. */
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1767  	irq = platform_get_irq(pdev, 0);
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1768  	if (irq < 0)
73d5fe04627028 drivers/spi/spi-cadence-quadspi.c                 Vaishnav Achath            2022-06-01  1769  		return -ENXIO;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1770  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1771  	ret = pm_runtime_set_active(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1772  	if (ret)
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1773  		return ret;
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1774  
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1775  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1776  	ret = clk_prepare_enable(cqspi->clk);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1777  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1778  		dev_err(dev, "Cannot enable QSPI clock.\n");
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1779  		goto probe_clk_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1780  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1781  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1782  	/* Obtain QSPI reset control */
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1783  	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1784  	if (IS_ERR(rstc)) {
ac9978fcad3c5a drivers/spi/spi-cadence-quadspi.c                 Zhihao Cheng               2020-11-16  1785  		ret = PTR_ERR(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1786  		dev_err(dev, "Cannot get QSPI reset.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1787  		goto probe_reset_failed;
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1788  	}
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1789  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1790  	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1791  	if (IS_ERR(rstc_ocp)) {
ac9978fcad3c5a drivers/spi/spi-cadence-quadspi.c                 Zhihao Cheng               2020-11-16  1792  		ret = PTR_ERR(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1793  		dev_err(dev, "Cannot get QSPI OCP reset.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1794  		goto probe_reset_failed;
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1795  	}
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1796  
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1797  	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1798  		rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1799  		if (IS_ERR(rstc_ref)) {
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1800  			ret = PTR_ERR(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1801  			dev_err(dev, "Cannot get QSPI REF reset.\n");
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1802  			goto probe_reset_failed;
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1803  		}
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1804  		reset_control_assert(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1805  		reset_control_deassert(rstc_ref);
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1806  	}
47fef94afeae2a drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-03-02  1807  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1808  	reset_control_assert(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1809  	reset_control_deassert(rstc);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1810  
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1811  	reset_control_assert(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1812  	reset_control_deassert(rstc_ocp);
8d1336c241bdad drivers/mtd/spi-nor/cadence-quadspi.c             Dinh Nguyen                2019-06-13  1813  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1814  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1815  	host->max_speed_hz = cqspi->master_ref_clk_hz;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1816  
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1817  	/* write completion is supported by default */
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1818  	cqspi->wr_completion = true;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1819  
2cc788387497d1 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2019-02-12  1820  	ddata  = of_device_get_match_data(dev);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1821  	if (ddata) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1822  		if (ddata->quirks & CQSPI_NEEDS_WR_DELAY)
f453f293979fb6 drivers/spi/spi-cadence-quadspi.c                 Pratyush Yadav             2020-12-23  1823  			cqspi->wr_delay = 50 * DIV_ROUND_UP(NSEC_PER_SEC,
61dc8493bae9ba drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1824  						cqspi->master_ref_clk_hz);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1825  		if (ddata->hwcaps_mask & CQSPI_SUPPORTS_OCTAL)
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1826  			host->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1827  		if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE)) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1828  			cqspi->use_direct_mode = true;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1829  			cqspi->use_direct_mode_wr = true;
e8c51b164355c1 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-01-25  1830  		}
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1831  		if (ddata->quirks & CQSPI_SUPPORT_EXTERNAL_DMA)
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1832  			cqspi->use_dma_read = true;
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1833  		if (ddata->quirks & CQSPI_NO_SUPPORT_WR_COMPLETION)
98d948eb833104 drivers/spi/spi-cadence-quadspi.c                 Dinh Nguyen                2021-11-08  1834  			cqspi->wr_completion = false;
9ee5b6d53b8c99 drivers/spi/spi-cadence-quadspi.c                 Niravkumar L Rabara        2022-08-13  1835  		if (ddata->quirks & CQSPI_SLOW_SRAM)
9ee5b6d53b8c99 drivers/spi/spi-cadence-quadspi.c                 Niravkumar L Rabara        2022-08-13  1836  			cqspi->slow_sram = true;
f5c2f9f9584353 drivers/spi/spi-cadence-quadspi.c                 Brad Larson                2023-05-15  1837  		if (ddata->quirks & CQSPI_NEEDS_APB_AHB_HAZARD_WAR)
f5c2f9f9584353 drivers/spi/spi-cadence-quadspi.c                 Brad Larson                2023-05-15  1838  			cqspi->apb_ahb_hazard = true;
1a6f854f7daab1 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1839  
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1840  		if (ddata->jh7110_clk_init) {
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1841  			ret = cqspi_jh7110_clk_init(pdev, cqspi);
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1842  			if (ret)
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1843  				goto probe_clk_failed;
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1844  		}
33f1ef6d4eb6bc drivers/spi/spi-cadence-quadspi.c                 William Qiu                2023-08-04  1845  
09e393e3f13970 drivers/spi/spi-cadence-quadspi.c                 Sai Krishna Potthuri       2021-09-24  1846  		if (of_device_is_compatible(pdev->dev.of_node,
947c70a213769f drivers/spi/spi-cadence-quadspi.c                 Jiasheng Jiang             2023-06-06  1847  					    "xlnx,versal-ospi-1.0")) {
947c70a213769f drivers/spi/spi-cadence-quadspi.c                 Jiasheng Jiang             2023-06-06  1848  			ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
947c70a213769f drivers/spi/spi-cadence-quadspi.c                 Jiasheng Jiang             2023-06-06  1849  			if (ret)
947c70a213769f drivers/spi/spi-cadence-quadspi.c                 Jiasheng Jiang             2023-06-06  1850  				goto probe_reset_failed;
947c70a213769f drivers/spi/spi-cadence-quadspi.c                 Jiasheng Jiang             2023-06-06  1851  		}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1852  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1853  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1854  	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1855  			       pdev->name, cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1856  	if (ret) {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1857  		dev_err(dev, "Cannot request IRQ.\n");
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1858  		goto probe_reset_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1859  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1860  
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1861  	cqspi_wait_idle(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1862  	cqspi_controller_init(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1863  	cqspi->current_cs = -1;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1864  	cqspi->sclk = 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1865  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1866  	host->num_chipselect = cqspi->num_chipselect;
b436fb7d29bfa4 drivers/spi/spi-cadence-quadspi.c                 Ramuthevar Vadivel Murugan 2020-11-24  1867  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1868  	ret = cqspi_setup_flash(cqspi);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1869  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1870  		dev_err(dev, "failed to setup flash parameters %d\n", ret);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1871  		goto probe_setup_failed;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1872  	}
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1873  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1874  	if (cqspi->use_direct_mode) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1875  		ret = cqspi_request_mmap_dma(cqspi);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1876  		if (ret == -EPROBE_DEFER)
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1877  			goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1878  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1879  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1880  	ret = devm_pm_runtime_enable(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1881  	if (ret)
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29 @1882  		return ret;
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1883  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1884  	pm_runtime_set_autosuspend_delay(dev, CQSPI_AUTOSUSPEND_TIMEOUT);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1885  	pm_runtime_use_autosuspend(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1886  	pm_runtime_get_noresume(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1887  
1c75d749b5ebd2 drivers/spi/spi-cadence-quadspi.c                 Yang Yingliang             2023-08-07  1888  	ret = spi_register_controller(host);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1889  	if (ret) {
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1890  		dev_err(&pdev->dev, "failed to register SPI ctlr %d\n", ret);
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1891  		goto probe_setup_failed;
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1892  	}
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1893  
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1894  	pm_runtime_mark_last_busy(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1895  	pm_runtime_put_autosuspend(dev);
0578a6dbfe7514 drivers/spi/spi-cadence-quadspi.c                 Dhruva Gole                2023-08-29  1896  
a314f6367787ee drivers/mtd/spi-nor/controllers/cadence-quadspi.c Ramuthevar Vadivel Murugan 2020-06-01  1897  	return 0;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1898  probe_setup_failed:
329864d35a7f49 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1899  	cqspi_controller_enable(cqspi, 0);
c61088d1f99329 drivers/mtd/spi-nor/controllers/cadence-quadspi.c Vignesh Raghavendra        2020-06-01  1900  probe_reset_failed:
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1901  	clk_disable_unprepare(cqspi->clk);
4892b374c9b797 drivers/mtd/spi-nor/cadence-quadspi.c             Vignesh R                  2017-10-03  1902  probe_clk_failed:
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1903  	return ret;
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1904  }
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c             Graham Moore               2016-06-04  1905  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
