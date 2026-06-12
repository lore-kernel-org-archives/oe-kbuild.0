Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866F25C804
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781242597; cv=none; b=KDPVzNDX/JURc5ILyWi+//1uu7PSYVy51GXlVWpo4DMT+N76RO7Ysmi1njlLWhhZvmrtw47o872xgF+DkSRpIHIiMqEw2Mv3eocNUO3aUFgAJK435YyilOOKH0bYeHT1l+bI3AObLqUiapxQU5vzRaVHyxyC4oPBBdeiAts3SOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781242597; c=relaxed/simple;
	bh=QG1uJY+6aONI8UImULw871C3UzwssqnyF6jdgCuISLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NzaefwSeg/DoIby1xGgWgys1dYXWyJ7B3fbAnZ5qIzREiX8eIcszrbEaxYASC2fxipLlNbGHDFMs6QJMD0cmf8PfH8dpxdn5qB6uQF+i3f7ZGIUabRJI2unbmTOeslrrwI0sf/9hdEQf9GpuvGcajYtOLbAocJpxADiv7iGrf0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoR44ETY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoR44ETY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781242596; x=1812778596;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QG1uJY+6aONI8UImULw871C3UzwssqnyF6jdgCuISLA=;
  b=aoR44ETYu0bzoL+y7NXWnK0HXDbxKkDMKun7trZxkUPgTPj818qcm9w4
   4JU0J+w1K0vkLR2sf0K2mm9d7+ICwI32HgLYiBFpb6D/mTNw7F4edK5mJ
   c1CIv66D/TeWv+eT6DSc/YUSUwUVmo3Bcn7YqixUQIU1Xj7VHTFBZ8287
   8ycTgLj3Obou1s1K3Ez0ngmQmg98Vtrj6+pChA/e9VHXm3GwlrDqGpzpm
   nwCwP+sEdGLxLaW7zpXFv0BJGwmA+khOplQfahkFkCxkmfrGxWXokgZAM
   r1Cwshxt1VqevHSQyq5ygPCMKwCXIlUMQQBslerpgMYuhBzge9BE+pzOy
   w==;
X-CSE-ConnectionGUID: 9ImY3GGjSWyzFmhH/jN/5g==
X-CSE-MsgGUID: eglUNtmNR8iTNb7gleKsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82261723"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82261723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 22:36:36 -0700
X-CSE-ConnectionGUID: W4h3o9FdRq2lFuPikhAXxg==
X-CSE-MsgGUID: 934KMh+yTFGXoXqmt28wMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250656717"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 22:36:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXuZD-00000000ON7-1iZu;
	Fri, 12 Jun 2026 05:36:31 +0000
Date: Fri, 12 Jun 2026 13:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-stm32.c:1649 stm32_spi_transfer_one_dma()
 error: we previously assumed 'spi->mdma_rx' could be null (see line 1595)
Message-ID: <202606121324.cEkcMNpp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Cl=C3=A9ment Le Goffic" <clement.legoffic@foss.st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: d17dd2f1d8a1d919e39c6302b024f135a2f90773 spi: stm32: use STM32 DMA =
with STM32 MDMA to enhance DDR use
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-r072-20260612 (https://download.01.org/0day-ci=
/archive/20260612/202606121324.cEkcMNpp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8a=
d049db78ae52052722b6f42b54cd2a666072b)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhanc=
e DDR use")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606121324.cEkcMNpp-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-stm32.c:1649 stm32_spi_transfer_one_dma() error: we previou=
sly assumed 'spi->mdma_rx' could be null (see line 1595)

Old smatch warnings:
drivers/spi/spi-stm32.c:1532 stm32_spi_prepare_rx_dma_mdma_chaining() warn:=
 variable dereferenced before check 'rx_dma_desc' (see line 1527)
drivers/spi/spi-stm32.c:1566 stm32_spi_prepare_rx_dma_mdma_chaining() warn:=
 variable dereferenced before check 'rx_mdma_desc' (see line 1561)

vim +1649 drivers/spi/spi-stm32.c

d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1573 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1574  /**
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1575   * stm32_spi_transfer_on=
e_dma - transfer a single spi_transfer using DMA
1c52be8bed83e1 Alain Volmat      2020-03-20  1576   * @spi: pointer to the =
spi controller data structure
1c52be8bed83e1 Alain Volmat      2020-03-20  1577   * @xfer: pointer to the=
 spi_transfer structure
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1578   *
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1579   * It must returns 0 if =
the transfer is finished or 1 if the transfer is still
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1580   * in progress.
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1581   */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1582  static int stm32_spi_tra=
nsfer_one_dma(struct stm32_spi *spi,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1583  				      struct spi_tra=
nsfer *xfer)
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1584  {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1585  	struct dma_async_t=
x_descriptor *rx_mdma_desc =3D NULL, *rx_dma_desc =3D NULL;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1586  	struct dma_async_t=
x_descriptor *tx_dma_desc =3D NULL;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1587  	struct dma_slave_config=
 tx_dma_conf, rx_dma_conf;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1588  	unsigned long flags;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1589  	int ret =3D 0;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1590 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1591  	spin_lock_irqsave(&spi-=
>lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1592 =20
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1593  	if (spi->rx_buf && spi-=
>dma_rx) {
6f98f25247b7ef Alain Volmat      2023-12-18  1594  		stm32_spi_dma_config(s=
pi, spi->dma_rx, &rx_dma_conf, DMA_DEV_TO_MEM);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16 @1595  		if (spi->mdma_rx)=
 {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1596  			rx_dma_conf.peri=
pheral_size =3D 1;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1597  			dmaengine_slave_confi=
g(spi->dma_rx, &rx_dma_conf);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1598 =20
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1599  			ret =3D stm32_sp=
i_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1600  								     &rx_dm=
a_desc, &rx_mdma_desc);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1601  			if (ret) { /* RX=
 DMA MDMA chaining not possible, fallback to DMA only */
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1602  				rx_dma_conf.per=
ipheral_config =3D 0;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1603  				rx_dma_desc =3D =
NULL;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1604  			}
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1605  		}
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1606  		if (!rx_dma_desc)=
 {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1607  			dmaengine_slave_=
config(spi->dma_rx, &rx_dma_conf);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1608  			rx_dma_desc =3D =
dmaengine_prep_slave_sg(spi->dma_rx, xfer->rx_sg.sgl,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1609  							      xfer->rx_sg=
.nents,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1610  							      rx_dma_conf=
.direction,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1611  							      DMA_PREP_IN=
TERRUPT);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1612  		}
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1613  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1614 =20
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1615  	if (spi->tx_buf && spi-=
>dma_tx) {
6f98f25247b7ef Alain Volmat      2023-12-18  1616  		stm32_spi_dma_config(s=
pi, spi->dma_tx, &tx_dma_conf, DMA_MEM_TO_DEV);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1617  		dmaengine_slave_config=
(spi->dma_tx, &tx_dma_conf);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1618  		tx_dma_desc =3D d=
maengine_prep_slave_sg(spi->dma_tx, xfer->tx_sg.sgl,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1619  						      xfer->tx_sg.=
nents,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1620  						      tx_dma_conf.=
direction,
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1621  						      DMA_PREP_INT=
ERRUPT);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1622  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1623 =20
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1624  	if ((spi->tx_buf && spi=
->dma_tx && !tx_dma_desc) ||
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1625  	    (spi->rx_buf && spi=
->dma_rx && !rx_dma_desc))
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1626  		goto dma_desc_error;
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1627 =20
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1628  	if (spi->cur_comm =3D=
=3D SPI_FULL_DUPLEX && (!tx_dma_desc || !rx_dma_desc))
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1629  		goto dma_desc_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1630 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1631  	if (rx_dma_desc) {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1632  		if (rx_mdma_desc)=
 {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1633  			rx_mdma_desc->ca=
llback =3D spi->cfg->dma_rx_cb;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1634  			rx_mdma_desc->ca=
llback_param =3D spi;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1635  		} else {
55166853b2f56c Cezary Gapinski   2018-12-24  1636  			rx_dma_desc->callback=
 =3D spi->cfg->dma_rx_cb;
7b821a6485c943 Amelie Delaunay   2017-06-27  1637  			rx_dma_desc->callback=
_param =3D spi;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1638  		}
7b821a6485c943 Amelie Delaunay   2017-06-27  1639 =20
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1640  		/* Enable Rx DMA =
request */
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1641  		stm32_spi_set_bit=
s(spi, spi->cfg->regs->dma_rx_en.reg,
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1642  				   spi->cfg->re=
gs->dma_rx_en.mask);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1643  		if (rx_mdma_desc)=
 {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1644  			if (dma_submit_e=
rror(dmaengine_submit(rx_mdma_desc))) {
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1645  				dev_err(spi->de=
v, "Rx MDMA submit failed\n");
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1646  				goto dma_desc_e=
rror;
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1647  			}
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1648  			/* Enable Rx MDM=
A channel */
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16 @1649  			dma_async_issue_=
pending(spi->mdma_rx);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1650  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1651  		if (dma_submit_error(d=
maengine_submit(rx_dma_desc))) {
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1652  			dev_err(spi->dev, "Rx=
 DMA submit failed\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1653  			goto dma_desc_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1654  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1655  		/* Enable Rx DMA chann=
el */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1656  		dma_async_issue_pendin=
g(spi->dma_rx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1657  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1658 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1659  	if (tx_dma_desc) {
9d5fce166c7a26 Cezary Gapinski   2018-12-24  1660  		if (spi->cur_comm =3D=
=3D SPI_SIMPLEX_TX ||
9d5fce166c7a26 Cezary Gapinski   2018-12-24  1661  		    spi->cur_comm =3D=
=3D SPI_3WIRE_TX) {
55166853b2f56c Cezary Gapinski   2018-12-24  1662  			tx_dma_desc->callback=
 =3D spi->cfg->dma_tx_cb;
7b821a6485c943 Amelie Delaunay   2017-06-27  1663  			tx_dma_desc->callback=
_param =3D spi;
7b821a6485c943 Amelie Delaunay   2017-06-27  1664  		}
7b821a6485c943 Amelie Delaunay   2017-06-27  1665 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1666  		if (dma_submit_error(d=
maengine_submit(tx_dma_desc))) {
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1667  			dev_err(spi->dev, "Tx=
 DMA submit failed\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1668  			goto dma_submit_error;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1669  		}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1670  		/* Enable Tx DMA chann=
el */
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1671  		dma_async_issue_pendin=
g(spi->dma_tx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1672 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1673  		/* Enable Tx DMA reque=
st */
55166853b2f56c Cezary Gapinski   2018-12-24  1674  		stm32_spi_set_bits(spi=
, spi->cfg->regs->dma_tx_en.reg,
55166853b2f56c Cezary Gapinski   2018-12-24  1675  				   spi->cfg->regs->d=
ma_tx_en.mask);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1676  	}
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1677 =20
55166853b2f56c Cezary Gapinski   2018-12-24  1678  	spi->cfg->transfer_one_=
dma_start(spi);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1679 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1680  	spin_unlock_irqrestore(=
&spi->lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1681 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1682  	return 1;
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1683 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1684  dma_submit_error:
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1685  	if (spi->mdma_rx)
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1686  		dmaengine_termina=
te_sync(spi->mdma_rx);
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1687  	if (spi->dma_rx)
4f2b39dc2d14d4 Alain Volmat      2023-06-15  1688  		dmaengine_terminate_sy=
nc(spi->dma_rx);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1689 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1690  dma_desc_error:
55166853b2f56c Cezary Gapinski   2018-12-24  1691  	stm32_spi_clr_bits(spi,=
 spi->cfg->regs->dma_rx_en.reg,
55166853b2f56c Cezary Gapinski   2018-12-24  1692  			   spi->cfg->regs->dm=
a_rx_en.mask);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1693 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1694  	spin_unlock_irqrestore(=
&spi->lock, flags);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1695 =20
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1696  	dev_info(spi->dev, "DMA=
 issue: fall back to irq transfer\n");
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1697 =20
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1698  	if (spi->sram_rx_b=
uf)
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1699  		memset(spi->sram_=
rx_buf, 0, spi->sram_rx_buf_size);
d17dd2f1d8a1d9 Cl=C3=A9ment Le Goffic 2025-06-16  1700 =20
2cbee7f886b2ab Cezary Gapinski   2018-12-24  1701  	spi->cur_usedma =3D fal=
se;
55166853b2f56c Cezary Gapinski   2018-12-24  1702  	return spi->cfg->transf=
er_one_irq(spi);
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1703  }
dcbe0d84dfa5a3 Amelie Delaunay   2017-06-21  1704 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
