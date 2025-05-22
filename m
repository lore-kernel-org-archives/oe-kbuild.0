Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE486358
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947992; cv=none; b=rLKb/9rL8dMPSxob5w3tYABDiM6dui+uyqpmCihs3ovjh1LbjDXqPsi2+u3yKvkzCtfTuTM+V88OMdVXpimWKjsZGe9I53GylJKkW+scDCjSFAhTO8E0EytAnaZAIpC18xNTM/9cGp5PZabKVI02bdEWVzOO7ne3cQeZwbigQkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947992; c=relaxed/simple;
	bh=AOsU7fo08mrUQta+g7JDOFxcEgFkidha3Cie4HGUSOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itzVhEuTSg+nNb8hpLklBQECqffEEKglbC9wXLTo4JOHUgQN1HB/MKhSkiKQ4aJbaT0ZBtE6L1PxRseOP8Lz5ap0QNUVM8SHhSOjK59sXhSevI8DRSv7QmarMDSoJFQbg3VY1Hj3xmlH4FrtJsVAH5sS2qlBrnV5SXD4GFSnRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3XJqfbW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3XJqfbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947990; x=1779483990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOsU7fo08mrUQta+g7JDOFxcEgFkidha3Cie4HGUSOE=;
  b=d3XJqfbWzpp+sh5u9T2wwBf6uNMKD5kJnARPzJy6+E0s3t5CaJylDHhj
   VzYFK1dqQidB228ynToni5Xvds222kOat2zHmmSkkoUdjwTq9Q+Nh+6/7
   nDgklmZr0s1CSqV3SSV7Be0+G8Pl4kZYQ32jqNJizIyNmAYwAQStD12UY
   H0EFhZG9YM6i/JjIRd/2ff1P3Hh32VqRpBk2sdh5v93avZTFi7+I1qWWh
   +vxAH9sQlN1abjXGvc1vESXBhF04N4LuEJwmumHKu3xOb1XUq6idHk4eb
   IdKib3ZPRh88n4XZFTnFKIfzn60tCjaIXuY1YVIBMZZimnSFcZVzdV4J0
   w==;
X-CSE-ConnectionGUID: zVCfp8q3RJ2s5n+9aeIyBg==
X-CSE-MsgGUID: IWjeG1/uRYi9Lu/whWY/5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50106886"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50106886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:06:29 -0700
X-CSE-ConnectionGUID: ceeNVlq7Qcec9kVWzlWPAg==
X-CSE-MsgGUID: WXfD9y7QS6+7IsLEvNlDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145730342"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2025 14:06:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uID7R-000Phg-1V;
	Thu, 22 May 2025 21:06:25 +0000
Date: Fri, 23 May 2025 05:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host()
 helper
Message-ID: <202505230421.P12fqPfB-lkp@intel.com>
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
In-Reply-To: <21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin@loongson.cn>
References: <21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin@loongson.cn>
TO: Binbin Zhou <zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61bd8e76021e779f7ba3c761919b533fb3f6f584]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-alcor-Use-devm_mmc_alloc_host-helper/20250522-150218
base:   61bd8e76021e779f7ba3c761919b533fb3f6f584
patch link:    https://lore.kernel.org/r/21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host() helper
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230421.P12fqPfB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505230421.P12fqPfB-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/omap_hsmmc.c:1842 omap_hsmmc_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/mmc/host/omap_hsmmc.c:1155 omap_hsmmc_switch_opcond() warn: 'host->dbclk' from clk_prepare_enable() not released on lines: 1155.

vim +/PTR_ERR +1842 drivers/mmc/host/omap_hsmmc.c

46856a68dcb5f6 Rajendra Nayak         2012-03-12  1762  
c3be1efd41a97f Bill Pemberton         2012-11-19  1763  static int omap_hsmmc_probe(struct platform_device *pdev)
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1764  {
55143438907479 Andreas Fenkart        2014-11-08  1765  	struct omap_hsmmc_platform_data *pdata = pdev->dev.platform_data;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1766  	struct mmc_host *mmc;
70a3341a711f27 Denis Karpov           2009-09-22  1767  	struct omap_hsmmc_host *host = NULL;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1768  	struct resource *res;
db0fefc5119e2c Adrian Hunter          2010-02-15  1769  	int ret, irq;
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1770  	const struct of_device_id *match;
59445b10d08144 Nishanth Menon         2014-02-13  1771  	const struct omap_mmc_of_data *data;
77fae21987fc5c Balaji T K             2014-05-09  1772  	void __iomem *base;
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1773  
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1774  	match = of_match_device(of_match_ptr(omap_mmc_of_match), &pdev->dev);
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1775  	if (match) {
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1776  		pdata = of_get_hsmmc_pdata(&pdev->dev);
dc642c28d4eb39 Jan Luebbe             2013-01-30  1777  
dc642c28d4eb39 Jan Luebbe             2013-01-30  1778  		if (IS_ERR(pdata))
dc642c28d4eb39 Jan Luebbe             2013-01-30  1779  			return PTR_ERR(pdata);
dc642c28d4eb39 Jan Luebbe             2013-01-30  1780  
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1781  		if (match->data) {
59445b10d08144 Nishanth Menon         2014-02-13  1782  			data = match->data;
59445b10d08144 Nishanth Menon         2014-02-13  1783  			pdata->reg_offset = data->reg_offset;
59445b10d08144 Nishanth Menon         2014-02-13  1784  			pdata->controller_flags |= data->controller_flags;
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1785  		}
46856a68dcb5f6 Rajendra Nayak         2012-03-12  1786  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1787  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1788  	if (pdata == NULL) {
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1789  		dev_err(&pdev->dev, "Platform Data is missing\n");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1790  		return -ENXIO;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1791  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1792  
fb51b74a57859b Sergey Shtylyov        2023-06-17  1793  	irq = platform_get_irq(pdev, 0);
fb51b74a57859b Sergey Shtylyov        2023-06-17  1794  	if (irq < 0)
fb51b74a57859b Sergey Shtylyov        2023-06-17  1795  		return irq;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1796  
9a2fdd2e7d756e Yangtao Li             2023-07-04  1797  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
77fae21987fc5c Balaji T K             2014-05-09  1798  	if (IS_ERR(base))
77fae21987fc5c Balaji T K             2014-05-09  1799  		return PTR_ERR(base);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1800  
229ab512b90f8f Binbin Zhou            2025-05-22  1801  	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(*host));
229ab512b90f8f Binbin Zhou            2025-05-22  1802  	if (!mmc)
229ab512b90f8f Binbin Zhou            2025-05-22  1803  		return -ENOMEM;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1804  
fdb9de129e1d68 NeilBrown              2015-01-13  1805  	ret = mmc_of_parse(mmc);
fdb9de129e1d68 NeilBrown              2015-01-13  1806  	if (ret)
229ab512b90f8f Binbin Zhou            2025-05-22  1807  		return ret;
fdb9de129e1d68 NeilBrown              2015-01-13  1808  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1809  	host		= mmc_priv(mmc);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1810  	host->mmc	= mmc;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1811  	host->pdata	= pdata;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1812  	host->dev	= &pdev->dev;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1813  	host->use_dma	= 1;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1814  	host->dma_ch	= -1;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1815  	host->irq	= irq;
fc307df88f0d77 Balaji T K             2012-04-02  1816  	host->mapbase	= res->start + pdata->reg_offset;
77fae21987fc5c Balaji T K             2014-05-09  1817  	host->base	= base + pdata->reg_offset;
6da20c89af64b7 Adrian Hunter          2010-02-15  1818  	host->power_mode = MMC_POWER_OFF;
9782aff8df7e32 Per Forlin             2011-07-01  1819  	host->next_data.cookie = 1;
eab234fce3334f Yang Li                2021-01-15  1820  	host->pbias_enabled = false;
eab234fce3334f Yang Li                2021-01-15  1821  	host->vqmmc_enabled = false;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1822  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1823  	platform_set_drvdata(pdev, host);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1824  
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1825  	if (pdev->dev.of_node)
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1826  		host->wake_irq = irq_of_parse_and_map(pdev->dev.of_node, 1);
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1827  
70a3341a711f27 Denis Karpov           2009-09-22  1828  	mmc->ops	= &omap_hsmmc_ops;
dd498effcfa6a1 Denis Karpov           2009-09-22  1829  
6b206efeccacaf Andy Shevchenko        2011-07-13  1830  	mmc->f_min = OMAP_MMC_MIN_CLOCK;
d418ed87c4e3ec Daniel Mack            2012-02-19  1831  
d418ed87c4e3ec Daniel Mack            2012-02-19  1832  	if (pdata->max_freq > 0)
d418ed87c4e3ec Daniel Mack            2012-02-19  1833  		mmc->f_max = pdata->max_freq;
fdb9de129e1d68 NeilBrown              2015-01-13  1834  	else if (mmc->f_max == 0)
6b206efeccacaf Andy Shevchenko        2011-07-13  1835  		mmc->f_max = OMAP_MMC_MAX_CLOCK;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1836  
4dffd7a251172d Adrian Hunter          2009-09-22  1837  	spin_lock_init(&host->irq_lock);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1838  
9618195e5a152d Balaji T K             2014-05-09  1839  	host->fclk = devm_clk_get(&pdev->dev, "fck");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1840  	if (IS_ERR(host->fclk)) {
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1841  		host->fclk = NULL;
229ab512b90f8f Binbin Zhou            2025-05-22 @1842  		return PTR_ERR(host->fclk);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1843  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1844  
9b68256cdef752 Paul Walmsley          2011-10-06  1845  	if (host->pdata->controller_flags & OMAP_HSMMC_BROKEN_MULTIBLOCK_READ) {
9b68256cdef752 Paul Walmsley          2011-10-06  1846  		dev_info(&pdev->dev, "multiblock reads disabled due to 35xx erratum 2.1.1.128; MMC read performance may suffer\n");
afd8c29d254d7f Kuninori Morimoto      2014-09-08  1847  		omap_hsmmc_ops.multi_io_quirk = omap_hsmmc_multi_io_quirk;
9b68256cdef752 Paul Walmsley          2011-10-06  1848  	}
dd498effcfa6a1 Denis Karpov           2009-09-22  1849  
5b83b2234be673 Tony Lindgren          2015-05-21  1850  	device_init_wakeup(&pdev->dev, true);
fa4aa2d48dabed Balaji T K             2011-07-01  1851  	pm_runtime_enable(host->dev);
fa4aa2d48dabed Balaji T K             2011-07-01  1852  	pm_runtime_get_sync(host->dev);
fa4aa2d48dabed Balaji T K             2011-07-01  1853  	pm_runtime_set_autosuspend_delay(host->dev, MMC_AUTOSUSPEND_DELAY);
fa4aa2d48dabed Balaji T K             2011-07-01  1854  	pm_runtime_use_autosuspend(host->dev);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1855  
92a3aebf06bdef Balaji T K             2012-02-24  1856  	omap_hsmmc_context_save(host);
92a3aebf06bdef Balaji T K             2012-02-24  1857  
9618195e5a152d Balaji T K             2014-05-09  1858  	host->dbclk = devm_clk_get(&pdev->dev, "mmchsdb_fck");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1859  	/*
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1860  	 * MMC can still work without debounce clock.
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1861  	 */
cd03d9a85802c0 Rajendra Nayak         2012-04-09  1862  	if (IS_ERR(host->dbclk)) {
cd03d9a85802c0 Rajendra Nayak         2012-04-09  1863  		host->dbclk = NULL;
94c18149451e9a Rajendra Nayak         2012-06-27  1864  	} else if (clk_prepare_enable(host->dbclk) != 0) {
cd03d9a85802c0 Rajendra Nayak         2012-04-09  1865  		dev_warn(mmc_dev(host->mmc), "Failed to enable debounce clk\n");
cd03d9a85802c0 Rajendra Nayak         2012-04-09  1866  		host->dbclk = NULL;
2bec08937e3cdf Adrian Hunter          2009-09-22  1867  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1868  
9442400486a1ec Will Newton            2017-06-22  1869  	/* Set this to a value that allows allocating an entire descriptor
9442400486a1ec Will Newton            2017-06-22  1870  	 * list within a page (zero order allocation). */
9442400486a1ec Will Newton            2017-06-22  1871  	mmc->max_segs = 64;
0ccd76d4c236a0 Juha Yrjola            2008-11-14  1872  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1873  	mmc->max_blk_size = 512;       /* Block Length at max can be 1024 */
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1874  	mmc->max_blk_count = 0xFFFF;    /* No. of Blocks is 16 bits */
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1875  	mmc->max_req_size = mmc->max_blk_size * mmc->max_blk_count;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1876  
13189e78caa824 Jarkko Lavinen         2009-09-22  1877  	mmc->caps |= MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
1be64c7963f89a Ulf Hansson            2020-05-08  1878  		     MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_CMD23;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1879  
326119c9923711 Andreas Fenkart        2014-11-08  1880  	mmc->caps |= mmc_pdata(host)->caps;
3a63833ec30028 Sukumar Ghorai         2010-09-15  1881  	if (mmc->caps & MMC_CAP_8_BIT_DATA)
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1882  		mmc->caps |= MMC_CAP_4_BIT_DATA;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1883  
326119c9923711 Andreas Fenkart        2014-11-08  1884  	if (mmc_pdata(host)->nonremovable)
23d99bb923fc23 Adrian Hunter          2009-09-22  1885  		mmc->caps |= MMC_CAP_NONREMOVABLE;
23d99bb923fc23 Adrian Hunter          2009-09-22  1886  
fdb9de129e1d68 NeilBrown              2015-01-13  1887  	mmc->pm_caps |= mmc_pdata(host)->pm_caps;
6fdc75de7d0554 Eliad Peller           2011-11-22  1888  
70a3341a711f27 Denis Karpov           2009-09-22  1889  	omap_hsmmc_conf_bus_power(host);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1890  
81eef6ca920148 Peter Ujfalusi         2016-04-29  1891  	host->rx_chan = dma_request_chan(&pdev->dev, "rx");
81eef6ca920148 Peter Ujfalusi         2016-04-29  1892  	if (IS_ERR(host->rx_chan)) {
81eef6ca920148 Peter Ujfalusi         2016-04-29  1893  		dev_err(mmc_dev(host->mmc), "RX DMA channel request failed\n");
81eef6ca920148 Peter Ujfalusi         2016-04-29  1894  		ret = PTR_ERR(host->rx_chan);
b7bf773b0eaac6 Balaji T K             2012-03-07  1895  		goto err_irq;
b7bf773b0eaac6 Balaji T K             2012-03-07  1896  	}
b7bf773b0eaac6 Balaji T K             2012-03-07  1897  
81eef6ca920148 Peter Ujfalusi         2016-04-29  1898  	host->tx_chan = dma_request_chan(&pdev->dev, "tx");
81eef6ca920148 Peter Ujfalusi         2016-04-29  1899  	if (IS_ERR(host->tx_chan)) {
81eef6ca920148 Peter Ujfalusi         2016-04-29  1900  		dev_err(mmc_dev(host->mmc), "TX DMA channel request failed\n");
81eef6ca920148 Peter Ujfalusi         2016-04-29  1901  		ret = PTR_ERR(host->tx_chan);
26b88520b80695 Russell King           2012-04-13  1902  		goto err_irq;
c5c98927d74cd6 Russell King           2012-04-13  1903  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1904  
0b479790684192 Russell King           2018-12-11  1905  	/*
0b479790684192 Russell King           2018-12-11  1906  	 * Limit the maximum segment size to the lower of the request size
0b479790684192 Russell King           2018-12-11  1907  	 * and the DMA engine device segment size limits.  In reality, with
0b479790684192 Russell King           2018-12-11  1908  	 * 32-bit transfers, the DMA engine can do longer segments than this
0b479790684192 Russell King           2018-12-11  1909  	 * but there is no way to represent that in the DMA model - if we
0b479790684192 Russell King           2018-12-11  1910  	 * increase this figure here, we get warnings from the DMA API debug.
0b479790684192 Russell King           2018-12-11  1911  	 */
0b479790684192 Russell King           2018-12-11  1912  	mmc->max_seg_size = min3(mmc->max_req_size,
0b479790684192 Russell King           2018-12-11  1913  			dma_get_max_seg_size(host->rx_chan->device->dev),
0b479790684192 Russell King           2018-12-11  1914  			dma_get_max_seg_size(host->tx_chan->device->dev));
0b479790684192 Russell King           2018-12-11  1915  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1916  	/* Request IRQ for MMC operations */
e1538ed7db6a52 Balaji T K             2014-05-09  1917  	ret = devm_request_irq(&pdev->dev, host->irq, omap_hsmmc_irq, 0,
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1918  			mmc_hostname(mmc), host);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1919  	if (ret) {
b1e056ae4bfaa1 Venkatraman S          2012-11-19  1920  		dev_err(mmc_dev(host->mmc), "Unable to grab HSMMC IRQ\n");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1921  		goto err_irq;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1922  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1923  
db0fefc5119e2c Adrian Hunter          2010-02-15  1924  	ret = omap_hsmmc_reg_get(host);
db0fefc5119e2c Adrian Hunter          2010-02-15  1925  	if (ret)
bb09d15114a55a Andreas Fenkart        2014-11-08  1926  		goto err_irq;
db0fefc5119e2c Adrian Hunter          2010-02-15  1927  
13ab2a66d862e0 Kishon Vijay Abraham I 2017-06-07  1928  	if (!mmc->ocr_avail)
326119c9923711 Andreas Fenkart        2014-11-08  1929  		mmc->ocr_avail = mmc_pdata(host)->ocr_mask;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1930  
b417577d3b9bbb Adrian Hunter          2010-05-26  1931  	omap_hsmmc_disable_irq(host);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1932  
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1933  	/*
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1934  	 * For now, only support SDIO interrupt if we have a separate
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1935  	 * wake-up interrupt configured from device tree. This is because
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1936  	 * the wake-up interrupt is needed for idle state and some
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1937  	 * platforms need special quirks. And we don't want to add new
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1938  	 * legacy mux platform init code callbacks any longer as we
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1939  	 * are moving to DT based booting anyways.
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1940  	 */
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1941  	ret = omap_hsmmc_configure_wake_irq(host);
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1942  	if (!ret)
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1943  		mmc->caps |= MMC_CAP_SDIO_IRQ;
2cd3a2a54656f9 Andreas Fenkart        2014-05-29  1944  
a525cad241c339 Yang Yingliang         2022-11-08  1945  	ret = mmc_add_host(mmc);
a525cad241c339 Yang Yingliang         2022-11-08  1946  	if (ret)
a525cad241c339 Yang Yingliang         2022-11-08  1947  		goto err_irq;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1948  
326119c9923711 Andreas Fenkart        2014-11-08  1949  	if (mmc_pdata(host)->name != NULL) {
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1950  		ret = device_create_file(&mmc->class_dev, &dev_attr_slot_name);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1951  		if (ret < 0)
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1952  			goto err_slot_name;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1953  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1954  
70a3341a711f27 Denis Karpov           2009-09-22  1955  	omap_hsmmc_debugfs(mmc);
fa4aa2d48dabed Balaji T K             2011-07-01  1956  	pm_runtime_mark_last_busy(host->dev);
fa4aa2d48dabed Balaji T K             2011-07-01  1957  	pm_runtime_put_autosuspend(host->dev);
d900f7128cf73d Denis Karpov           2009-09-22  1958  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1959  	return 0;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1960  
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1961  err_slot_name:
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1962  	mmc_remove_host(mmc);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1963  err_irq:
5b83b2234be673 Tony Lindgren          2015-05-21  1964  	device_init_wakeup(&pdev->dev, false);
81eef6ca920148 Peter Ujfalusi         2016-04-29  1965  	if (!IS_ERR_OR_NULL(host->tx_chan))
c5c98927d74cd6 Russell King           2012-04-13  1966  		dma_release_channel(host->tx_chan);
81eef6ca920148 Peter Ujfalusi         2016-04-29  1967  	if (!IS_ERR_OR_NULL(host->rx_chan))
c5c98927d74cd6 Russell King           2012-04-13  1968  		dma_release_channel(host->rx_chan);
814a3c0c2a8dfa Tony Lindgren          2016-02-10  1969  	pm_runtime_dont_use_autosuspend(host->dev);
d59d77ed1e0cdd Balaji T K             2012-02-24  1970  	pm_runtime_put_sync(host->dev);
37f6190d54f4d9 Tony Lindgren          2012-03-08  1971  	pm_runtime_disable(host->dev);
94c18149451e9a Rajendra Nayak         2012-06-27  1972  	clk_disable_unprepare(host->dbclk);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1973  	return ret;
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1974  }
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1975  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
