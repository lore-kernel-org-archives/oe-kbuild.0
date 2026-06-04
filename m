Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762613CF679
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780554961; cv=none; b=SbBypCgTX+hrt0kLigzsS4smbd4CJVR7WMbQxhylh4NWvCeeHd2Ggyn+SO9Hpx1jM1iXwiUdnpQcKw5P54MSqq65N1R/If2tsPdFM19YvNzFlWg5Zsl8gzJy+X4cj9AUBex5Og05IbNfeh//62m3XUeAbQoaW7V1qYkr21HUbaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780554961; c=relaxed/simple;
	bh=i5/n8MrbJwhzvCO0VERhtijb/EtfmYKrLF1BhofArvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qAoyxvYTT4p4p6R39cGvY+WT0lPmFKNiUqulpK7dDQ4ePbQVVBzcgSTk/5aBX0e13VuQUABqOtBRbkdlAGADBlg0bHp1aFT4byIYmsvz1BszY+HGJDVFb4VgMO807f+jNteDcSo0MkZinNMpvYirQI9xBFmXvs9fwC9Eo4QiTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIqUWwR8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIqUWwR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780554957; x=1812090957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i5/n8MrbJwhzvCO0VERhtijb/EtfmYKrLF1BhofArvQ=;
  b=lIqUWwR8ABlD0d8InotM4jTXq8SP1gwWhkFozHOFEjH24btulDTh/EhS
   9p+BtzTIZsHO1ejqeOJ4UQe1poU4DCLo97NEBR/JoBjzbSejmCDKcBZE/
   yl/eybB1O/O9SBAV91v/FxS9+kcG5T3uZOGqSB9ooUoWAHOZSlCYtbhFO
   QxmaADDx0UUvVFPyT7KwRdilT4XwB/x/nkGFMN/ZtqhsxLRA4pvQmNbMR
   ERCvBHsqtWMaGSjwWoweMYQXas9FAOGcY/Efp8W5//cm3ViIKPc7kyWvN
   /wnMFjK+54583OVixuyKQ9921Kt1PFk6TDN9qalNsPicivgDE80fNfVRT
   w==;
X-CSE-ConnectionGUID: VDEgckodTr6UGPL1ivU2YQ==
X-CSE-MsgGUID: FV23ICWpQDKqV6kKycl3Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92060343"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92060343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 23:35:56 -0700
X-CSE-ConnectionGUID: pKDa/aDDQFKMz2HR9ExhBQ==
X-CSE-MsgGUID: +HsGcMxcRAKCd0roURBWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="249542160"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2026 23:35:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV1gG-00000000EN8-1RPR;
	Thu, 04 Jun 2026 06:35:52 +0000
Date: Thu, 04 Jun 2026 14:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/at_hdmac.c:2110 at_dma_probe() warn: 'irq' from
 request_irq() not released on lines: 2110.
Message-ID: <202606041453.RblE8vuv-lkp@intel.com>
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
TO: Rosen Penev <rosenp@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 5d8c5bea0da97809813b5f702700019cfffb6085 dmaengine: at_hdmac: add C=
OMPILE_TEST support
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r072-20260604 (https://download.01.org/0day-ci/arc=
hive/20260604/202606041453.RblE8vuv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606041453.RblE8vuv-lkp@intel.com/

smatch warnings:
drivers/dma/at_hdmac.c:2110 at_dma_probe() warn: 'irq' from request_irq() n=
ot released on lines: 2110.

vim +/irq +2110 drivers/dma/at_hdmac.c

dc78baa2b90b28 Nicolas Ferre     2009-07-03  1937 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1938  static int __init at_dma=
_probe(struct platform_device *pdev)
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1939  {
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1940  	struct at_dma		*atdma;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1941  	int			irq;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1942  	int			err;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1943  	int			i;
7fd63ccdad7233 Uwe Kleine-K=C3=B6nig  2012-07-13  1944  	const struct at_dm=
a_platform_data *plat_dat;
67348450b86cb1 Nicolas Ferre     2011-10-17  1945 =20
02f88be9488a3d Nicolas Ferre     2011-11-22  1946  	/* setup platform data =
for each SoC */
02f88be9488a3d Nicolas Ferre     2011-11-22  1947  	dma_cap_set(DMA_MEMCPY,=
 at91sam9rl_config.cap_mask);
5abecfa5e96972 Maxime Ripard     2015-05-27  1948  	dma_cap_set(DMA_INTERLE=
AVE, at91sam9g45_config.cap_mask);
02f88be9488a3d Nicolas Ferre     2011-11-22  1949  	dma_cap_set(DMA_MEMCPY,=
 at91sam9g45_config.cap_mask);
4d112426c3446d Maxime Ripard     2015-08-24  1950  	dma_cap_set(DMA_MEMSET,=
 at91sam9g45_config.cap_mask);
67d25f0d4e2477 Maxime Ripard     2015-10-22  1951  	dma_cap_set(DMA_MEMSET_=
SG, at91sam9g45_config.cap_mask);
4d112426c3446d Maxime Ripard     2015-08-24  1952  	dma_cap_set(DMA_PRIVATE=
, at91sam9g45_config.cap_mask);
02f88be9488a3d Nicolas Ferre     2011-11-22  1953  	dma_cap_set(DMA_SLAVE, =
at91sam9g45_config.cap_mask);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1954 =20
67348450b86cb1 Nicolas Ferre     2011-10-17  1955  	/* get DMA parameters f=
rom controller type */
02f88be9488a3d Nicolas Ferre     2011-11-22  1956  	plat_dat =3D at_dma_get=
_driver_data(pdev);
02f88be9488a3d Nicolas Ferre     2011-11-22  1957  	if (!plat_dat)
02f88be9488a3d Nicolas Ferre     2011-11-22  1958  		return -ENODEV;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1959 =20
5f1d429b43b34b Tudor Ambarus     2022-10-25  1960  	atdma =3D devm_kzalloc(=
&pdev->dev,
5f1d429b43b34b Tudor Ambarus     2022-10-25  1961  			     struct_size(atdm=
a, chan, plat_dat->nr_channels),
5f1d429b43b34b Tudor Ambarus     2022-10-25  1962  			     GFP_KERNEL);
5f1d429b43b34b Tudor Ambarus     2022-10-25  1963  	if (!atdma)
5f1d429b43b34b Tudor Ambarus     2022-10-25  1964  		return -ENOMEM;
5f1d429b43b34b Tudor Ambarus     2022-10-25  1965 =20
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1966  	atdma->regs =3D devm_pl=
atform_ioremap_resource(pdev, 0);
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1967  	if (IS_ERR(atdma->regs))
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1968  		return PTR_ERR(atdma->=
regs);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1969 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1970  	irq =3D platform_get_ir=
q(pdev, 0);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1971  	if (irq < 0)
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1972  		return irq;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1973 =20
67348450b86cb1 Nicolas Ferre     2011-10-17  1974  	/* discover transaction=
 capabilities */
1c1114d850b699 Tudor Ambarus     2022-10-25  1975  	atdma->dma_device.cap_m=
ask =3D plat_dat->cap_mask;
02f88be9488a3d Nicolas Ferre     2011-11-22  1976  	atdma->all_chan_mask =
=3D (1 << plat_dat->nr_channels) - 1;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1977 =20
4c15a4c7f693f1 Tudor Ambarus     2022-10-25  1978  	atdma->clk =3D devm_clk=
_get(&pdev->dev, "dma_clk");
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1979  	if (IS_ERR(atdma->clk))
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1980  		return PTR_ERR(atdma->=
clk);
8bfe4a61d40df2 Tudor Ambarus     2022-10-25  1981 =20
f784d9c90469d7 Boris Brezillon   2013-06-19  1982  	err =3D clk_prepare_ena=
ble(atdma->clk);
f784d9c90469d7 Boris Brezillon   2013-06-19  1983  	if (err)
4c15a4c7f693f1 Tudor Ambarus     2022-10-25  1984  		return err;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1985 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1986  	/* force dma off, just =
in case */
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1987  	at_dma_off(atdma);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1988 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1989  	err =3D request_irq(irq=
, at_dma_interrupt, 0, "at_hdmac", atdma);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1990  	if (err)
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1991  		goto err_irq;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1992 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1993  	platform_set_drvdata(pd=
ev, atdma);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1994 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1995  	/* create a pool of con=
sistent memory blocks for hardware descriptors */
ac803b56860f65 Tudor Ambarus     2022-10-25  1996  	atdma->lli_pool =3D dma=
_pool_create("at_hdmac_lli_pool",
ac803b56860f65 Tudor Ambarus     2022-10-25  1997  					  &pdev->dev, sizeo=
f(struct at_lli),
dc78baa2b90b28 Nicolas Ferre     2009-07-03  1998  					  4 /* word alignme=
nt */, 0);
ac803b56860f65 Tudor Ambarus     2022-10-25  1999  	if (!atdma->lli_pool) {
ac803b56860f65 Tudor Ambarus     2022-10-25  2000  		dev_err(&pdev->dev, "U=
nable to allocate DMA LLI descriptor pool\n");
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2001  		err =3D -ENOMEM;
4d112426c3446d Maxime Ripard     2015-08-24  2002  		goto err_desc_pool_cre=
ate;
4d112426c3446d Maxime Ripard     2015-08-24  2003  	}
4d112426c3446d Maxime Ripard     2015-08-24  2004 =20
4d112426c3446d Maxime Ripard     2015-08-24  2005  	/* create a pool of con=
sistent memory blocks for memset blocks */
4d112426c3446d Maxime Ripard     2015-08-24  2006  	atdma->memset_pool =3D =
dma_pool_create("at_hdmac_memset_pool",
4d112426c3446d Maxime Ripard     2015-08-24  2007  					     &pdev->dev, si=
zeof(int), 4, 0);
4d112426c3446d Maxime Ripard     2015-08-24  2008  	if (!atdma->memset_pool=
) {
4d112426c3446d Maxime Ripard     2015-08-24  2009  		dev_err(&pdev->dev, "N=
o memory for memset dma pool\n");
4d112426c3446d Maxime Ripard     2015-08-24  2010  		err =3D -ENOMEM;
4d112426c3446d Maxime Ripard     2015-08-24  2011  		goto err_memset_pool_c=
reate;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2012  	}
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2013 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2014  	/* clear any pending in=
terrupt */
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2015  	while (dma_readl(atdma,=
 EBCISR))
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2016  		cpu_relax();
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2017 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2018  	/* initialize channels =
related values */
1c1114d850b699 Tudor Ambarus     2022-10-25  2019  	INIT_LIST_HEAD(&atdma->=
dma_device.channels);
02f88be9488a3d Nicolas Ferre     2011-11-22  2020  	for (i =3D 0; i < plat_=
dat->nr_channels; i++) {
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2021  		struct at_dma_chan	*at=
chan =3D &atdma->chan[i];
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2022 =20
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2023  		atchan->mem_if =3D AT_=
DMA_MEM_IF;
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2024  		atchan->per_if =3D AT_=
DMA_PER_IF;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2025 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2026  		atchan->ch_regs =3D at=
dma->regs + ch_regs(i);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2027  		atchan->mask =3D 1 << =
i;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2028 =20
ac803b56860f65 Tudor Ambarus     2022-10-25  2029  		atchan->atdma =3D atdm=
a;
ac803b56860f65 Tudor Ambarus     2022-10-25  2030  		atchan->vc.desc_free =
=3D atdma_desc_free;
ac803b56860f65 Tudor Ambarus     2022-10-25  2031  		vchan_init(&atchan->vc=
, &atdma->dma_device);
bda3a47c886664 Nikolaus Voss     2012-01-17  2032  		atc_enable_chan_irq(at=
dma, i);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2033  	}
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2034 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2035  	/* set base routines */
1c1114d850b699 Tudor Ambarus     2022-10-25  2036  	atdma->dma_device.devic=
e_alloc_chan_resources =3D atc_alloc_chan_resources;
1c1114d850b699 Tudor Ambarus     2022-10-25  2037  	atdma->dma_device.devic=
e_free_chan_resources =3D atc_free_chan_resources;
1c1114d850b699 Tudor Ambarus     2022-10-25  2038  	atdma->dma_device.devic=
e_tx_status =3D atc_tx_status;
1c1114d850b699 Tudor Ambarus     2022-10-25  2039  	atdma->dma_device.devic=
e_issue_pending =3D atc_issue_pending;
1c1114d850b699 Tudor Ambarus     2022-10-25  2040  	atdma->dma_device.dev =
=3D &pdev->dev;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2041 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2042  	/* set prep routines ba=
sed on capability */
1c1114d850b699 Tudor Ambarus     2022-10-25  2043  	if (dma_has_cap(DMA_INT=
ERLEAVE, atdma->dma_device.cap_mask))
1c1114d850b699 Tudor Ambarus     2022-10-25  2044  		atdma->dma_device.devi=
ce_prep_interleaved_dma =3D atc_prep_dma_interleaved;
5abecfa5e96972 Maxime Ripard     2015-05-27  2045 =20
1c1114d850b699 Tudor Ambarus     2022-10-25  2046  	if (dma_has_cap(DMA_MEM=
CPY, atdma->dma_device.cap_mask))
1c1114d850b699 Tudor Ambarus     2022-10-25  2047  		atdma->dma_device.devi=
ce_prep_dma_memcpy =3D atc_prep_dma_memcpy;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2048 =20
1c1114d850b699 Tudor Ambarus     2022-10-25  2049  	if (dma_has_cap(DMA_MEM=
SET, atdma->dma_device.cap_mask)) {
1c1114d850b699 Tudor Ambarus     2022-10-25  2050  		atdma->dma_device.devi=
ce_prep_dma_memset =3D atc_prep_dma_memset;
1c1114d850b699 Tudor Ambarus     2022-10-25  2051  		atdma->dma_device.devi=
ce_prep_dma_memset_sg =3D atc_prep_dma_memset_sg;
1c1114d850b699 Tudor Ambarus     2022-10-25  2052  		atdma->dma_device.fill=
_align =3D DMAENGINE_ALIGN_4_BYTES;
4d112426c3446d Maxime Ripard     2015-08-24  2053  	}
4d112426c3446d Maxime Ripard     2015-08-24  2054 =20
1c1114d850b699 Tudor Ambarus     2022-10-25  2055  	if (dma_has_cap(DMA_SLA=
VE, atdma->dma_device.cap_mask)) {
1c1114d850b699 Tudor Ambarus     2022-10-25  2056  		atdma->dma_device.devi=
ce_prep_slave_sg =3D atc_prep_slave_sg;
d7db80801f8117 Nicolas Ferre     2011-08-05  2057  		/* controller can do s=
lave DMA: can trigger cyclic transfers */
1c1114d850b699 Tudor Ambarus     2022-10-25  2058  		dma_cap_set(DMA_CYCLIC=
, atdma->dma_device.cap_mask);
1c1114d850b699 Tudor Ambarus     2022-10-25  2059  		atdma->dma_device.devi=
ce_prep_dma_cyclic =3D atc_prep_dma_cyclic;
1c1114d850b699 Tudor Ambarus     2022-10-25  2060  		atdma->dma_device.devi=
ce_config =3D atc_config;
1c1114d850b699 Tudor Ambarus     2022-10-25  2061  		atdma->dma_device.devi=
ce_pause =3D atc_pause;
1c1114d850b699 Tudor Ambarus     2022-10-25  2062  		atdma->dma_device.devi=
ce_resume =3D atc_resume;
1c1114d850b699 Tudor Ambarus     2022-10-25  2063  		atdma->dma_device.devi=
ce_terminate_all =3D atc_terminate_all;
1c1114d850b699 Tudor Ambarus     2022-10-25  2064  		atdma->dma_device.src_=
addr_widths =3D ATC_DMA_BUSWIDTHS;
1c1114d850b699 Tudor Ambarus     2022-10-25  2065  		atdma->dma_device.dst_=
addr_widths =3D ATC_DMA_BUSWIDTHS;
1c1114d850b699 Tudor Ambarus     2022-10-25  2066  		atdma->dma_device.dire=
ctions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
1c1114d850b699 Tudor Ambarus     2022-10-25  2067  		atdma->dma_device.resi=
due_granularity =3D DMA_RESIDUE_GRANULARITY_BURST;
d7db80801f8117 Nicolas Ferre     2011-08-05  2068  	}
808347f6a31792 Nicolas Ferre     2009-07-22  2069 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2070  	dma_writel(atdma, EN, A=
T_DMA_ENABLE);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2071 =20
c678fa66341c7b Dave Jiang        2017-08-21  2072  	dev_info(&pdev->dev, "A=
tmel AHB DMA Controller ( %s%s%s), %d channels\n",
1c1114d850b699 Tudor Ambarus     2022-10-25  2073  	  dma_has_cap(DMA_MEMCP=
Y, atdma->dma_device.cap_mask) ? "cpy " : "",
1c1114d850b699 Tudor Ambarus     2022-10-25  2074  	  dma_has_cap(DMA_MEMSE=
T, atdma->dma_device.cap_mask) ? "set " : "",
1c1114d850b699 Tudor Ambarus     2022-10-25  2075  	  dma_has_cap(DMA_SLAVE=
, atdma->dma_device.cap_mask)  ? "slave " : "",
02f88be9488a3d Nicolas Ferre     2011-11-22  2076  	  plat_dat->nr_channels=
);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2077 =20
1c1114d850b699 Tudor Ambarus     2022-10-25  2078  	err =3D dma_async_devic=
e_register(&atdma->dma_device);
c47e6403fa099f Tudor Ambarus     2022-10-25  2079  	if (err) {
c47e6403fa099f Tudor Ambarus     2022-10-25  2080  		dev_err(&pdev->dev, "U=
nable to register: %d.\n", err);
c47e6403fa099f Tudor Ambarus     2022-10-25  2081  		goto err_dma_async_dev=
ice_register;
c47e6403fa099f Tudor Ambarus     2022-10-25  2082  	}
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2083 =20
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2084  	/*
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2085  	 * Do not return an err=
or if the dmac node is not present in order to
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2086  	 * not break the existi=
ng way of requesting channel with
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2087  	 * dma_request_channel(=
).
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2088  	 */
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2089  	if (pdev->dev.of_node) {
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2090  		err =3D of_dma_control=
ler_register(pdev->dev.of_node,
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2091  						 at_dma_xlate, atd=
ma);
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2092  		if (err) {
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2093  			dev_err(&pdev->dev, "=
could not register of_dma_controller\n");
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2094  			goto err_of_dma_contr=
oller_register;
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2095  		}
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2096  	}
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2097 =20
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2098  	return 0;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2099 =20
bbe89c8e3d5981 Ludovic Desroches 2013-04-19  2100  err_of_dma_controller_re=
gister:
1c1114d850b699 Tudor Ambarus     2022-10-25  2101  	dma_async_device_unregi=
ster(&atdma->dma_device);
c47e6403fa099f Tudor Ambarus     2022-10-25  2102  err_dma_async_device_reg=
ister:
4d112426c3446d Maxime Ripard     2015-08-24  2103  	dma_pool_destroy(atdma-=
>memset_pool);
4d112426c3446d Maxime Ripard     2015-08-24  2104  err_memset_pool_create:
ac803b56860f65 Tudor Ambarus     2022-10-25  2105  	dma_pool_destroy(atdma-=
>lli_pool);
4d112426c3446d Maxime Ripard     2015-08-24  2106  err_desc_pool_create:
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2107  	free_irq(platform_get_i=
rq(pdev, 0), atdma);
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2108  err_irq:
f784d9c90469d7 Boris Brezillon   2013-06-19  2109  	clk_disable_unprepare(a=
tdma->clk);
dc78baa2b90b28 Nicolas Ferre     2009-07-03 @2110  	return err;
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2111  }
dc78baa2b90b28 Nicolas Ferre     2009-07-03  2112 =20

:::::: The code at line 2110 was first introduced by commit
:::::: dc78baa2b90b289590911b40b6800f77d0dc935a dmaengine: at_hdmac: new dr=
iver for the Atmel AHB DMA Controller

:::::: TO: Nicolas Ferre <nicolas.ferre@atmel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
