Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BF383
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 05:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784132; cv=none; b=DNKOvXj5QgSvY4zkwEW0EK7f/xf3Zt0kZJC5dEfk9Vj3D5z3wCQ+hZ3Zz3ejkgll3lpk35CgYCXazluH6lcCnMiHaZbbAk5CJndVrTjezAI3znCK2SK0Uw9EhxscEhiLYGC3QOUfimXG2ItaJzyM7cNI98PcFK4KuTFm5DzGarM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784132; c=relaxed/simple;
	bh=NO5fO+8+tPMVyOLFsBmrHAIOaAlklqiPF2iRLvoDLXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNtikayx9iK/ZB88sSLvjSo9+eat6SQ0+zRMhpYkAfJY0RW0EyMIZW/QKDPQyJMYiA1uEDKVd+0CTSZU67a2CW5zjUyo6RGxtgs1qVujr/fMoPuyzajSUIu2N1VYU32dZL9ig/x+wOoq4WHyMuTcjO/AJTVef/VtdJaRrwRjse0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kncCSRgG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kncCSRgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730784130; x=1762320130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NO5fO+8+tPMVyOLFsBmrHAIOaAlklqiPF2iRLvoDLXw=;
  b=kncCSRgGLf/faCFX4e+ivkdPaRbbPzq7buNEed8w2pLKrhz3ippFQpEe
   y43yCS4XNeLRqBiiq5S372WTc5tb/dpltbXijo7imVEIs0e2TZ4mX5Fg3
   s14ASGzn0TtAyv1hm6NH+PkVzs6cXgK9xJSZv9zPvfxP8WLdfBc139ZRt
   EpAQgFycFz0cU5NcCB8SOD+LHgQz2FUukkX7O6VCwB7W8NxFZHEvBrWyt
   A5DJsMninnxOepVrb+dS90i0IirVUgqodMZRLfnTHnObnpVI5+IDBZN5w
   8Q3J6NVV6q2T/X9vnv10NYveKSloIe6CTT9yy7tMloCy5JzcGui8x3g5F
   w==;
X-CSE-ConnectionGUID: YSGsxiH0RdayeeQF/Desfg==
X-CSE-MsgGUID: OQLdJibsRzeqo0Ai8Gd3Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33349350"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="33349350"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:22:08 -0800
X-CSE-ConnectionGUID: zrme053qQTuV2dAmUDOWuw==
X-CSE-MsgGUID: 5yrxBoGfStCiX1NBD5rjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84211389"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 21:22:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8C0z-000lf5-0r;
	Tue, 05 Nov 2024 05:22:05 +0000
Date: Tue, 5 Nov 2024 13:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/fsl/qe/qmc.c:1942 qmc_probe() warn: missing error code
 'ret'
Message-ID: <202411051350.KNy6ZIWA-lkp@intel.com>
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
TO: Herve Codina <herve.codina@bootlin.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1b3cc9d7f790145a80cb705b168f05dab65df2
commit: eb680d563089e55b20cb7730ed881638fe4425b7 soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation
date:   9 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 weeks ago
config: powerpc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051350.KNy6ZIWA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/

smatch warnings:
drivers/soc/fsl/qe/qmc.c:1942 qmc_probe() warn: missing error code 'ret'

vim +/ret +1942 drivers/soc/fsl/qe/qmc.c

de5fdb7d14b34f Herve Codina 2024-08-08  1827  
3178d58e0b9772 Herve Codina 2023-02-17  1828  static int qmc_probe(struct platform_device *pdev)
3178d58e0b9772 Herve Codina 2023-02-17  1829  {
3178d58e0b9772 Herve Codina 2023-02-17  1830  	struct device_node *np = pdev->dev.of_node;
3178d58e0b9772 Herve Codina 2023-02-17  1831  	unsigned int nb_chans;
3178d58e0b9772 Herve Codina 2023-02-17  1832  	struct qmc *qmc;
3178d58e0b9772 Herve Codina 2023-02-17  1833  	int irq;
3178d58e0b9772 Herve Codina 2023-02-17  1834  	int ret;
3178d58e0b9772 Herve Codina 2023-02-17  1835  
3178d58e0b9772 Herve Codina 2023-02-17  1836  	qmc = devm_kzalloc(&pdev->dev, sizeof(*qmc), GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1837  	if (!qmc)
3178d58e0b9772 Herve Codina 2023-02-17  1838  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1839  
3178d58e0b9772 Herve Codina 2023-02-17  1840  	qmc->dev = &pdev->dev;
d23ae9f1815e89 Herve Codina 2024-08-08  1841  	qmc->data = of_device_get_match_data(&pdev->dev);
d23ae9f1815e89 Herve Codina 2024-08-08  1842  	if (!qmc->data) {
d23ae9f1815e89 Herve Codina 2024-08-08  1843  		dev_err(qmc->dev, "Missing match data\n");
d23ae9f1815e89 Herve Codina 2024-08-08  1844  		return -EINVAL;
d23ae9f1815e89 Herve Codina 2024-08-08  1845  	}
3178d58e0b9772 Herve Codina 2023-02-17  1846  	INIT_LIST_HEAD(&qmc->chan_head);
3178d58e0b9772 Herve Codina 2023-02-17  1847  
a13bf605342ea9 Herve Codina 2024-08-08  1848  	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
a13bf605342ea9 Herve Codina 2024-08-08  1849  	if (IS_ERR(qmc->tsa_serial)) {
a13bf605342ea9 Herve Codina 2024-08-08  1850  		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
a13bf605342ea9 Herve Codina 2024-08-08  1851  				     "Failed to get TSA serial\n");
a13bf605342ea9 Herve Codina 2024-08-08  1852  	}
a13bf605342ea9 Herve Codina 2024-08-08  1853  
727b3ab490a5f5 Herve Codina 2024-08-08  1854  	ret = qmc_init_resources(qmc, pdev);
727b3ab490a5f5 Herve Codina 2024-08-08  1855  	if (ret)
727b3ab490a5f5 Herve Codina 2024-08-08  1856  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1857  
3178d58e0b9772 Herve Codina 2023-02-17  1858  	/* Parse channels informationss */
3178d58e0b9772 Herve Codina 2023-02-17  1859  	ret = qmc_of_parse_chans(qmc, np);
3178d58e0b9772 Herve Codina 2023-02-17  1860  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1861  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1862  
3178d58e0b9772 Herve Codina 2023-02-17  1863  	nb_chans = qmc_nb_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1864  
3178d58e0b9772 Herve Codina 2023-02-17  1865  	/*
3178d58e0b9772 Herve Codina 2023-02-17  1866  	 * Allocate the buffer descriptor table
3178d58e0b9772 Herve Codina 2023-02-17  1867  	 * 8 rx and 8 tx descriptors per channel
3178d58e0b9772 Herve Codina 2023-02-17  1868  	 */
3178d58e0b9772 Herve Codina 2023-02-17  1869  	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
3178d58e0b9772 Herve Codina 2023-02-17  1870  	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
3178d58e0b9772 Herve Codina 2023-02-17  1871  					    &qmc->bd_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1872  	if (!qmc->bd_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1873  		dev_err(qmc->dev, "Failed to allocate bd table\n");
a13bf605342ea9 Herve Codina 2024-08-08  1874  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1875  	}
3178d58e0b9772 Herve Codina 2023-02-17  1876  	memset(qmc->bd_table, 0, qmc->bd_size);
3178d58e0b9772 Herve Codina 2023-02-17  1877  
3178d58e0b9772 Herve Codina 2023-02-17  1878  	qmc_write32(qmc->scc_pram + QMC_GBL_MCBASE, qmc->bd_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1879  
3178d58e0b9772 Herve Codina 2023-02-17  1880  	/* Allocate the interrupt table */
3178d58e0b9772 Herve Codina 2023-02-17  1881  	qmc->int_size = QMC_NB_INTS * sizeof(u16);
3178d58e0b9772 Herve Codina 2023-02-17  1882  	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
3178d58e0b9772 Herve Codina 2023-02-17  1883  					     &qmc->int_dma_addr, GFP_KERNEL);
3178d58e0b9772 Herve Codina 2023-02-17  1884  	if (!qmc->int_table) {
3178d58e0b9772 Herve Codina 2023-02-17  1885  		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
a13bf605342ea9 Herve Codina 2024-08-08  1886  		return -ENOMEM;
3178d58e0b9772 Herve Codina 2023-02-17  1887  	}
3178d58e0b9772 Herve Codina 2023-02-17  1888  	memset(qmc->int_table, 0, qmc->int_size);
3178d58e0b9772 Herve Codina 2023-02-17  1889  
3178d58e0b9772 Herve Codina 2023-02-17  1890  	qmc->int_curr = qmc->int_table;
3178d58e0b9772 Herve Codina 2023-02-17  1891  	qmc_write32(qmc->scc_pram + QMC_GBL_INTBASE, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1892  	qmc_write32(qmc->scc_pram + QMC_GBL_INTPTR, qmc->int_dma_addr);
3178d58e0b9772 Herve Codina 2023-02-17  1893  
3178d58e0b9772 Herve Codina 2023-02-17  1894  	/* Set MRBLR (valid for HDLC only) max MRU + max CRC */
3178d58e0b9772 Herve Codina 2023-02-17  1895  	qmc_write16(qmc->scc_pram + QMC_GBL_MRBLR, HDLC_MAX_MRU + 4);
3178d58e0b9772 Herve Codina 2023-02-17  1896  
3178d58e0b9772 Herve Codina 2023-02-17  1897  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFTHR, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1898  	qmc_write16(qmc->scc_pram + QMC_GBL_GRFCNT, 1);
3178d58e0b9772 Herve Codina 2023-02-17  1899  
3178d58e0b9772 Herve Codina 2023-02-17  1900  	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
3178d58e0b9772 Herve Codina 2023-02-17  1901  	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
3178d58e0b9772 Herve Codina 2023-02-17  1902  
eb680d563089e5 Herve Codina 2024-08-08  1903  	if (qmc_is_qe(qmc)) {
eb680d563089e5 Herve Codina 2024-08-08  1904  		/* Zeroed the reserved area */
eb680d563089e5 Herve Codina 2024-08-08  1905  		memset_io(qmc->scc_pram + QMC_QE_GBL_RSV_B0_START, 0,
eb680d563089e5 Herve Codina 2024-08-08  1906  			  QMC_QE_GBL_RSV_B0_SIZE);
eb680d563089e5 Herve Codina 2024-08-08  1907  
eb680d563089e5 Herve Codina 2024-08-08  1908  		qmc_write32(qmc->scc_pram + QMC_QE_GBL_GCSBASE, qmc->dpram_offset);
eb680d563089e5 Herve Codina 2024-08-08  1909  
eb680d563089e5 Herve Codina 2024-08-08  1910  		/* Init 'framer parameters' area and set the base addresses */
eb680d563089e5 Herve Codina 2024-08-08  1911  		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE, 0x01, 64);
eb680d563089e5 Herve Codina 2024-08-08  1912  		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE + 64, 0x01, 64);
eb680d563089e5 Herve Codina 2024-08-08  1913  		qmc_write16(qmc->scc_pram + QMC_QE_GBL_RX_FRM_BASE,
eb680d563089e5 Herve Codina 2024-08-08  1914  			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE);
eb680d563089e5 Herve Codina 2024-08-08  1915  		qmc_write16(qmc->scc_pram + QMC_QE_GBL_TX_FRM_BASE,
eb680d563089e5 Herve Codina 2024-08-08  1916  			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE + 64);
eb680d563089e5 Herve Codina 2024-08-08  1917  	}
eb680d563089e5 Herve Codina 2024-08-08  1918  
2d965e25fa4180 Herve Codina 2023-12-05  1919  	ret = qmc_init_tsa(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1920  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1921  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1922  
3178d58e0b9772 Herve Codina 2023-02-17  1923  	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
3178d58e0b9772 Herve Codina 2023-02-17  1924  
3178d58e0b9772 Herve Codina 2023-02-17  1925  	ret = qmc_setup_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1926  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1927  		return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1928  
3178d58e0b9772 Herve Codina 2023-02-17  1929  	/* Init interrupts table */
3178d58e0b9772 Herve Codina 2023-02-17  1930  	ret = qmc_setup_ints(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1931  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1932  		return ret;
a13bf605342ea9 Herve Codina 2024-08-08  1933  
eb680d563089e5 Herve Codina 2024-08-08  1934  	/* Init SCC (CPM1) or UCC (QE) */
de5fdb7d14b34f Herve Codina 2024-08-08  1935  	ret = qmc_init_xcc(qmc);
de5fdb7d14b34f Herve Codina 2024-08-08  1936  	if (ret)
a13bf605342ea9 Herve Codina 2024-08-08  1937  		return ret;
a13bf605342ea9 Herve Codina 2024-08-08  1938  
de5fdb7d14b34f Herve Codina 2024-08-08  1939  	/* Set the irq handler */
3178d58e0b9772 Herve Codina 2023-02-17  1940  	irq = platform_get_irq(pdev, 0);
3178d58e0b9772 Herve Codina 2023-02-17  1941  	if (irq < 0)
de5fdb7d14b34f Herve Codina 2024-08-08 @1942  		goto err_exit_xcc;
3178d58e0b9772 Herve Codina 2023-02-17  1943  	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1944  	if (ret < 0)
de5fdb7d14b34f Herve Codina 2024-08-08  1945  		goto err_exit_xcc;
3178d58e0b9772 Herve Codina 2023-02-17  1946  
3178d58e0b9772 Herve Codina 2023-02-17  1947  	/* Enable interrupts */
3178d58e0b9772 Herve Codina 2023-02-17  1948  	qmc_write16(qmc->scc_regs + SCC_SCCM,
3178d58e0b9772 Herve Codina 2023-02-17  1949  		    SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
3178d58e0b9772 Herve Codina 2023-02-17  1950  
3178d58e0b9772 Herve Codina 2023-02-17  1951  	ret = qmc_finalize_chans(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1952  	if (ret < 0)
3178d58e0b9772 Herve Codina 2023-02-17  1953  		goto err_disable_intr;
3178d58e0b9772 Herve Codina 2023-02-17  1954  
e49dd637e02589 Herve Codina 2024-08-08  1955  	/* Enable transmitter and receiver */
3178d58e0b9772 Herve Codina 2023-02-17  1956  	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
3178d58e0b9772 Herve Codina 2023-02-17  1957  
3178d58e0b9772 Herve Codina 2023-02-17  1958  	platform_set_drvdata(pdev, qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1959  
ba3b7e4753c5ad Herve Codina 2023-12-05  1960  	/* Populate channel related devices */
ba3b7e4753c5ad Herve Codina 2023-12-05  1961  	ret = devm_of_platform_populate(qmc->dev);
ba3b7e4753c5ad Herve Codina 2023-12-05  1962  	if (ret)
ba3b7e4753c5ad Herve Codina 2023-12-05  1963  		goto err_disable_txrx;
ba3b7e4753c5ad Herve Codina 2023-12-05  1964  
3178d58e0b9772 Herve Codina 2023-02-17  1965  	return 0;
3178d58e0b9772 Herve Codina 2023-02-17  1966  
ba3b7e4753c5ad Herve Codina 2023-12-05  1967  err_disable_txrx:
ba3b7e4753c5ad Herve Codina 2023-12-05  1968  	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
ba3b7e4753c5ad Herve Codina 2023-12-05  1969  
3178d58e0b9772 Herve Codina 2023-02-17  1970  err_disable_intr:
3178d58e0b9772 Herve Codina 2023-02-17  1971  	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
3178d58e0b9772 Herve Codina 2023-02-17  1972  
de5fdb7d14b34f Herve Codina 2024-08-08  1973  err_exit_xcc:
de5fdb7d14b34f Herve Codina 2024-08-08  1974  	qmc_exit_xcc(qmc);
3178d58e0b9772 Herve Codina 2023-02-17  1975  	return ret;
3178d58e0b9772 Herve Codina 2023-02-17  1976  }
3178d58e0b9772 Herve Codina 2023-02-17  1977  

:::::: The code at line 1942 was first introduced by commit
:::::: de5fdb7d14b34f7fea930f2d72cf0241ec679e72 soc: fsl: cpm1: qmc: Introduce qmc_{init,exit}_xcc() and their CPM1 version

:::::: TO: Herve Codina <herve.codina@bootlin.com>
:::::: CC: Christophe Leroy <christophe.leroy@csgroup.eu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
