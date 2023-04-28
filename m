Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF98883E
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682709343; x=1714245343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WBZTrUUQvGlLExGWbi0F6caUSXc0qAyQzP7uUzD7wQ=;
  b=khzjeu8jFXQtk7Wb+IiM1VKBUdgGw+xpGv9Agp7CjQq+J25zQqLrcvWp
   2uW1EUSftOB1moiTPg0oiWwevwqwCAI5o+VJYDMn1tIk0ZAlyatLcpH9f
   MeXCoEZmK8VWw+GfVEZCsfd2HoF7fm63JfhWIGeCRJ21ravkL+vlp9xBX
   rkjzCFMmEAPaRATMEWNamQrLWVHHPuBMonw6Jj5jECaVVagU4dWVoJV3q
   UrwkbeRL1kGBeb/1nPvh4o+s9JL2pI0Gq5JBKOceDIIGDNDdOO7j8XpMn
   h2aeWa/5eSfGQlVKTooaPc/PyAKcOnUK0FNqjXe3uhI7+9mSj1JF69BWo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410941318"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="410941318"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 12:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869295560"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="869295560"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 12:15:41 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psTZE-0000cz-2W;
	Fri, 28 Apr 2023 19:15:40 +0000
Date: Sat, 29 Apr 2023 03:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-davinci.c:915 davinci_spi_probe() warn:
 platform_get_irq() does not return zero
Message-ID: <202304290337.oTtneBtb-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   22b8cc3e78f5448b4c5df00303817a9137cd663f
commit: e48d57d7203441b7a32b4275462ebb9296ea3fa0 spi: davinci: Make available for build test
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-m031-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290337.oTtneBtb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304290337.oTtneBtb-lkp@intel.com/

smatch warnings:
drivers/spi/spi-davinci.c:915 davinci_spi_probe() warn: platform_get_irq() does not return zero

vim +915 drivers/spi/spi-davinci.c

aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   845  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   846  /**
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   847   * davinci_spi_probe - probe function for SPI Master Controller
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   848   * @pdev: platform_device structure which contains plateform specific data
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   849   *
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   850   * According to Linux Device Model this function will be invoked by Linux
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   851   * with platform_device struct which contains the device specific info.
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   852   * This function will map the SPI controller's memory, register IRQ,
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   853   * Reset SPI controller and setting its registers to default value.
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   854   * It will invoke spi_bitbang_start to create work queue so that client driver
035540f6ea2394 drivers/spi/davinci_spi.c Brian Niebuhr           2010-10-06   855   * can register transfer method to work queue.
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   856   */
fd4a319bc933ae drivers/spi/spi-davinci.c Grant Likely            2012-12-07   857  static int davinci_spi_probe(struct platform_device *pdev)
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   858  {
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   859  	struct spi_master *master;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   860  	struct davinci_spi *dspi;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   861  	struct davinci_spi_platform_data *pdata;
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   862  	struct resource *r;
c060014063d552 drivers/spi/spi-davinci.c Grygorii Strashko       2014-08-01   863  	int ret = 0;
f34bd4cc68fb45 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-03   864  	u32 spipc0;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   865  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   866  	master = spi_alloc_master(&pdev->dev, sizeof(struct davinci_spi));
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   867  	if (master == NULL) {
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   868  		ret = -ENOMEM;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   869  		goto err;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   870  	}
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   871  
24b5a82cf5709a drivers/spi/spi-davinci.c Jingoo Han              2013-05-23   872  	platform_set_drvdata(pdev, master);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   873  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   874  	dspi = spi_master_get_devdata(master);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   875  
8074cf063e410a drivers/spi/spi-davinci.c Jingoo Han              2013-07-30   876  	if (dev_get_platdata(&pdev->dev)) {
8074cf063e410a drivers/spi/spi-davinci.c Jingoo Han              2013-07-30   877  		pdata = dev_get_platdata(&pdev->dev);
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   878  		dspi->pdata = *pdata;
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   879  	} else {
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   880  		/* update dspi pdata with that from the DT */
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   881  		ret = spi_davinci_get_pdata(pdev, dspi);
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   882  		if (ret < 0)
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   883  			goto free_master;
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   884  	}
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   885  
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   886  	/* pdata in dspi is now updated and point pdata to that */
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   887  	pdata = &dspi->pdata;
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   888  
a86854d0c599b3 drivers/spi/spi-davinci.c Kees Cook               2018-06-12   889  	dspi->bytes_per_word = devm_kcalloc(&pdev->dev,
a86854d0c599b3 drivers/spi/spi-davinci.c Kees Cook               2018-06-12   890  					    pdata->num_chipselect,
a86854d0c599b3 drivers/spi/spi-davinci.c Kees Cook               2018-06-12   891  					    sizeof(*dspi->bytes_per_word),
a86854d0c599b3 drivers/spi/spi-davinci.c Kees Cook               2018-06-12   892  					    GFP_KERNEL);
7480e755c6e6e8 drivers/spi/spi-davinci.c Murali Karicheri        2014-07-31   893  	if (dspi->bytes_per_word == NULL) {
7480e755c6e6e8 drivers/spi/spi-davinci.c Murali Karicheri        2014-07-31   894  		ret = -ENOMEM;
7480e755c6e6e8 drivers/spi/spi-davinci.c Murali Karicheri        2014-07-31   895  		goto free_master;
7480e755c6e6e8 drivers/spi/spi-davinci.c Murali Karicheri        2014-07-31   896  	}
7480e755c6e6e8 drivers/spi/spi-davinci.c Murali Karicheri        2014-07-31   897  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   898  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   899  	if (r == NULL) {
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   900  		ret = -ENOENT;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   901  		goto free_master;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   902  	}
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   903  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   904  	dspi->pbase = r->start;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   905  
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   906  	dspi->base = devm_ioremap_resource(&pdev->dev, r);
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   907  	if (IS_ERR(dspi->base)) {
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   908  		ret = PTR_ERR(dspi->base);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   909  		goto free_master;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   910  	}
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   911  
87248dc7923657 drivers/spi/spi-davinci.c Michele Dionisio        2017-12-12   912  	init_completion(&dspi->done);
87248dc7923657 drivers/spi/spi-davinci.c Michele Dionisio        2017-12-12   913  
8494cdea2223b6 drivers/spi/spi-davinci.c Andrzej Hajda           2015-09-24   914  	ret = platform_get_irq(pdev, 0);
8494cdea2223b6 drivers/spi/spi-davinci.c Andrzej Hajda           2015-09-24  @915  	if (ret == 0)
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   916  		ret = -EINVAL;
8494cdea2223b6 drivers/spi/spi-davinci.c Andrzej Hajda           2015-09-24   917  	if (ret < 0)
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   918  		goto free_master;
8494cdea2223b6 drivers/spi/spi-davinci.c Andrzej Hajda           2015-09-24   919  	dspi->irq = ret;
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   920  
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   921  	ret = devm_request_threaded_irq(&pdev->dev, dspi->irq, davinci_spi_irq,
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   922  				dummy_thread_fn, 0, dev_name(&pdev->dev), dspi);
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   923  	if (ret)
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   924  		goto free_master;
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   925  
94c69f765f1b4a drivers/spi/spi-davinci.c Axel Lin                2013-09-10   926  	dspi->bitbang.master = master;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   927  
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   928  	dspi->clk = devm_clk_get(&pdev->dev, NULL);
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   929  	if (IS_ERR(dspi->clk)) {
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   930  		ret = -ENODEV;
5b3bb5963ff23a drivers/spi/spi-davinci.c Jingoo Han              2013-12-09   931  		goto free_master;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   932  	}
35fc3b9ff66b90 drivers/spi/spi-davinci.c Arvind Yadav            2017-06-05   933  	ret = clk_prepare_enable(dspi->clk);
35fc3b9ff66b90 drivers/spi/spi-davinci.c Arvind Yadav            2017-06-05   934  	if (ret)
35fc3b9ff66b90 drivers/spi/spi-davinci.c Arvind Yadav            2017-06-05   935  		goto free_master;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   936  
101a68e74fe089 drivers/spi/spi-davinci.c Linus Walleij           2019-01-07   937  	master->use_gpio_descriptors = true;
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11   938  	master->dev.of_node = pdev->dev.of_node;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   939  	master->bus_num = pdev->id;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   940  	master->num_chipselect = pdata->num_chipselect;
24778be20f87d5 drivers/spi/spi-davinci.c Stephen Warren          2013-05-21   941  	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
ea4ab99cb58cc9 drivers/spi/spi-davinci.c Matija Glavinic Pecotic 2021-08-24   942  	master->flags = SPI_MASTER_MUST_RX | SPI_MASTER_GPIO_SS;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   943  	master->setup = davinci_spi_setup;
365a7bb32e097a drivers/spi/spi-davinci.c Murali Karicheri        2014-09-16   944  	master->cleanup = davinci_spi_cleanup;
8aedbf580d2112 drivers/spi/spi-davinci.c Fabien Parent           2017-02-23   945  	master->can_dma = davinci_spi_can_dma;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   946  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   947  	dspi->bitbang.chipselect = davinci_spi_chipselect;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   948  	dspi->bitbang.setup_transfer = davinci_spi_setup_transfer;
fa466c91970a02 drivers/spi/spi-davinci.c Franklin S Cooper Jr    2015-07-22   949  	dspi->prescaler_limit = pdata->prescaler_limit;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   950  	dspi->version = pdata->version;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   951  
a3762b13a59664 drivers/spi/spi-davinci.c David Lechner           2018-09-12   952  	dspi->bitbang.flags = SPI_NO_CS | SPI_LSB_FIRST | SPI_LOOP | SPI_CS_WORD;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   953  	if (dspi->version == SPI_VERSION_2)
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   954  		dspi->bitbang.flags |= SPI_READY;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   955  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   956  	dspi->bitbang.txrx_bufs = davinci_spi_bufs;
96fd881f22b44f drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-27   957  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   958  	ret = davinci_spi_request_dma(dspi);
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29   959  	if (ret == -EPROBE_DEFER) {
903ca25b219e28 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-01   960  		goto free_clk;
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29   961  	} else if (ret) {
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29   962  		dev_info(&pdev->dev, "DMA is not supported (%d)\n", ret);
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29   963  		dspi->dma_rx = NULL;
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29   964  		dspi->dma_tx = NULL;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   965  	}
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   966  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   967  	dspi->get_rx = davinci_spi_rx_buf_u8;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   968  	dspi->get_tx = davinci_spi_tx_buf_u8;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   969  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   970  	/* Reset In/OUT SPI module */
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   971  	iowrite32(0, dspi->base + SPIGCR0);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   972  	udelay(100);
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   973  	iowrite32(1, dspi->base + SPIGCR0);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   974  
be88471b96cf3a drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-03   975  	/* Set up SPIPC0.  CS and ENA init is done in davinci_spi_setup */
f34bd4cc68fb45 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-03   976  	spipc0 = SPIPC0_DIFUN_MASK | SPIPC0_DOFUN_MASK | SPIPC0_CLKFUN_MASK;
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   977  	iowrite32(spipc0, dspi->base + SPIPC0);
f34bd4cc68fb45 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-03   978  
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   979  	if (pdata->intr_line)
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   980  		iowrite32(SPI_INTLVL_1, dspi->base + SPILVL);
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   981  	else
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   982  		iowrite32(SPI_INTLVL_0, dspi->base + SPILVL);
e0d205e9914476 drivers/spi/davinci_spi.c Brian Niebuhr           2010-09-02   983  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   984  	iowrite32(CS_DEFAULT, dspi->base + SPIDEF);
843a713bc53d04 drivers/spi/davinci_spi.c Brian Niebuhr           2010-08-12   985  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   986  	/* master mode default */
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   987  	set_io_bits(dspi->base + SPIGCR1, SPIGCR1_CLKMOD_MASK);
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   988  	set_io_bits(dspi->base + SPIGCR1, SPIGCR1_MASTER_MASK);
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   989  	set_io_bits(dspi->base + SPIGCR1, SPIGCR1_POWERDOWN_MASK);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   990  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   991  	ret = spi_bitbang_start(&dspi->bitbang);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   992  	if (ret)
903ca25b219e28 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-01   993  		goto free_dma;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   994  
212d4b69652171 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-11   995  	dev_info(&pdev->dev, "Controller at 0x%p\n", dspi->base);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   996  
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   997  	return ret;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16   998  
903ca25b219e28 drivers/spi/davinci_spi.c Sekhar Nori             2010-10-01   999  free_dma:
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29  1000  	if (dspi->dma_rx) {
048177ce3b3962 drivers/spi/spi-davinci.c Matt Porter             2012-08-22  1001  		dma_release_channel(dspi->dma_rx);
048177ce3b3962 drivers/spi/spi-davinci.c Matt Porter             2012-08-22  1002  		dma_release_channel(dspi->dma_tx);
fe5fd2540947a6 drivers/spi/spi-davinci.c Peter Ujfalusi          2016-04-29  1003  	}
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1004  free_clk:
aae7147dfc5220 drivers/spi/spi-davinci.c Murali Karicheri        2012-12-11  1005  	clk_disable_unprepare(dspi->clk);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1006  free_master:
94c69f765f1b4a drivers/spi/spi-davinci.c Axel Lin                2013-09-10  1007  	spi_master_put(master);
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1008  err:
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1009  	return ret;
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1010  }
358934a60d2180 drivers/spi/davinci_spi.c Sandeep Paulraj         2009-12-16  1011  

:::::: The code at line 915 was first introduced by commit
:::::: 8494cdea2223b66491df1264619e2205b4487913 spi: davinci: fix handling platform_get_irq result

:::::: TO: Andrzej Hajda <a.hajda@samsung.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
