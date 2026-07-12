Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072D28DC4
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870579; cv=none; b=avwCuD10Df0wY2lLPH8DEvQZQKge4fLX05DJTPnqlRhpMtPpgUmhtOJPzL7CZRgK55ru5Z81JqgzuFwTM9N+Etj4F4zuR7JcaHqG19qwwGk6LB+x/3ySzoZJa9lma709BdWkToijB1PeIIw+ZFskDZ99y6lAgtbP17EtAIBA2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870579; c=relaxed/simple;
	bh=JYZ302WGA0OuNzQVoThySkgEfGlEKsA1HPud9w7nnSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dzr2QGcOJFMKTxwOt0SRYYPw0X1xpYZkhYh3/uQQIC/grdEToagigMnuOgnr52NVCtZZCSzt1sowwuEDY3UQJE2HJQg2QtKfAEeASUxD3WXBLy/svYgKw9IELkPkl8osgyKCZObN+7sBvvx7ppKo6TjIXM+ipGch8I2YVVfPktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPw9KD+s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPw9KD+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783870578; x=1815406578;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JYZ302WGA0OuNzQVoThySkgEfGlEKsA1HPud9w7nnSk=;
  b=PPw9KD+svFc48jusy6i6/CmKpt/2BxVktESKpJD2eb6BoS9g9Bs+GHNB
   AuMR9XYoUaNikDA/0dnQ93v1xBROzhJda6zLv7FJ1MFQZFYKE8CulpIS3
   6D6o2aAhyPJwnI7xE9PFEEWahk6bViG33/KAS/Tmz6RMguHFXxrumftzj
   2whjfqn+WoWLg5wRf1hlt4QYbTctlkQ9f2Ob3diTmR6sHDWyu5VKE/LQA
   5UdXlNiR9MHmOTN6BXE0CKpK/n2ATxpEDEtmYZ9PDkA+mp77J5xV7Ue8K
   scvVya2qOFOquUXuxJyPxsTC8Bdb3zkB4MkUiLphyqbkYJroovTnQ3oMB
   Q==;
X-CSE-ConnectionGUID: 6wrg0q5zQPWNHPisA8pR3Q==
X-CSE-MsgGUID: 8hTAoy2ARce/MJK3Jw6wtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72023353"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="72023353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 08:36:17 -0700
X-CSE-ConnectionGUID: YeWQJMr4QFW/RRJq/w52FA==
X-CSE-MsgGUID: 2v1Jmy/jSKypp12VKMUuYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260216837"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jul 2026 08:36:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiwDy-00000000Kws-1fDR;
	Sun, 12 Jul 2026 15:36:10 +0000
Date: Sun, 12 Jul 2026 23:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5449/5655]
 drivers/spi/spi-geni-qcom.c:637 spi_geni_init() warn: missing error code?
 'ret'
Message-ID: <202607122241.qzP3QAXF-lkp@intel.com>
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
TO: Praveen Talari <praveen.talari@oss.qualcomm.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: d8e9ea989acb54508477e4a8c9d9eaf8217e0081 [5449/5655] spi: qcom-geni=
: Fix missing error check on pm_runtime_get_sync()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r071-20260711 (https://download.01.org/0day-c=
i/archive/20260712/202607122241.qzP3QAXF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607122241.qzP3QAXF-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-geni-qcom.c:637 spi_geni_init() warn: missing error code? '=
ret'

Old smatch warnings:
drivers/spi/spi-geni-qcom.c:648 spi_geni_init() warn: missing error code? '=
ret'

vim +/ret +637 drivers/spi/spi-geni-qcom.c

b59c122484ecb1 Vinod Koul              2021-10-20  616 =20
561de45f72bd5f Girish Mahadevan        2018-10-03  617  static int spi_geni=
_init(struct spi_geni_master *mas)
561de45f72bd5f Girish Mahadevan        2018-10-03  618  {
14cea92338a077 Uwe Kleine-K=C3=B6nig        2024-02-07  619  	struct spi_co=
ntroller *spi =3D dev_get_drvdata(mas->dev);
561de45f72bd5f Girish Mahadevan        2018-10-03  620  	struct geni_se *se=
 =3D &mas->se;
561de45f72bd5f Girish Mahadevan        2018-10-03  621  	unsigned int proto=
, major, minor, ver;
b59c122484ecb1 Vinod Koul              2021-10-20  622  	u32 spi_tx_cfg, fi=
fo_disable;
b59c122484ecb1 Vinod Koul              2021-10-20  623  	int ret =3D -ENXIO;
561de45f72bd5f Girish Mahadevan        2018-10-03  624 =20
d8e9ea989acb54 Praveen Talari          2026-07-10  625  	PM_RUNTIME_ACQUIRE=
_IF_ENABLED(mas->dev, pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  626  	ret =3D PM_RUNTIME=
_ACQUIRE_ERR(&pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  627  	if (ret < 0) {
d8e9ea989acb54 Praveen Talari          2026-07-10  628  		dev_err(mas->dev,=
 "Failed to resume and get %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  629  		return ret;
d8e9ea989acb54 Praveen Talari          2026-07-10  630  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  631 =20
561de45f72bd5f Girish Mahadevan        2018-10-03  632  	proto =3D geni_se_=
read_proto(se);
d7f74cc31a89a4 Praveen Talari          2023-07-14  633 =20
8726bdcef62eac Yang Yingliang          2023-11-28  634  	if (spi->target) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  635  		if (proto !=3D GE=
NI_SE_SPI_SLAVE) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  636  			dev_err(mas->dev=
, "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10 @637  			return ret;
d7f74cc31a89a4 Praveen Talari          2023-07-14  638  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  639  		spi_slv_setup(mas=
);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  640  	} else if (proto =
=3D=3D GENI_SE_INVALID_PROTO) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  641  		ret =3D geni_load=
_se_firmware(se, GENI_SE_SPI);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  642  		if (ret) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  643  			dev_err(mas->dev=
, "spi master firmware load failed ret: %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  644  			return ret;
99cf351ee1c46b Viken Dadhaniya         2025-09-11  645  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  646  	} else if (proto !=
=3D GENI_SE_SPI) {
561de45f72bd5f Girish Mahadevan        2018-10-03  647  		dev_err(mas->dev,=
 "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10  648  		return ret;
561de45f72bd5f Girish Mahadevan        2018-10-03  649  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  650  	mas->tx_fifo_depth=
 =3D geni_se_get_tx_fifo_depth(se);
561de45f72bd5f Girish Mahadevan        2018-10-03  651 =20
561de45f72bd5f Girish Mahadevan        2018-10-03  652  	/* Width of Tx and=
 Rx FIFO is same */
561de45f72bd5f Girish Mahadevan        2018-10-03  653  	mas->fifo_width_bi=
ts =3D geni_se_get_tx_fifo_width(se);
561de45f72bd5f Girish Mahadevan        2018-10-03  654 =20
561de45f72bd5f Girish Mahadevan        2018-10-03  655  	/*
561de45f72bd5f Girish Mahadevan        2018-10-03  656  	 * Hardware progra=
mming guide suggests to configure
561de45f72bd5f Girish Mahadevan        2018-10-03  657  	 * RX FIFO RFR lev=
el to fifo_depth-2.
561de45f72bd5f Girish Mahadevan        2018-10-03  658  	 */
fc129a43aa2705 Douglas Anderson        2020-09-12  659  	geni_se_init(se, m=
as->tx_fifo_depth - 3, mas->tx_fifo_depth - 2);
561de45f72bd5f Girish Mahadevan        2018-10-03  660  	/* Transmit an ent=
ire FIFO worth of data per IRQ */
561de45f72bd5f Girish Mahadevan        2018-10-03  661  	mas->tx_wm =3D 1;
561de45f72bd5f Girish Mahadevan        2018-10-03  662  	ver =3D geni_se_ge=
t_qup_hw_version(se);
561de45f72bd5f Girish Mahadevan        2018-10-03  663  	major =3D GENI_SE_=
VERSION_MAJOR(ver);
561de45f72bd5f Girish Mahadevan        2018-10-03  664  	minor =3D GENI_SE_=
VERSION_MINOR(ver);
561de45f72bd5f Girish Mahadevan        2018-10-03  665 =20
561de45f72bd5f Girish Mahadevan        2018-10-03  666  	if (major =3D=3D 1=
 && minor =3D=3D 0)
561de45f72bd5f Girish Mahadevan        2018-10-03  667  		mas->oversampling=
 =3D 2;
561de45f72bd5f Girish Mahadevan        2018-10-03  668  	else
561de45f72bd5f Girish Mahadevan        2018-10-03  669  		mas->oversampling=
 =3D 1;
561de45f72bd5f Girish Mahadevan        2018-10-03  670 =20
b59c122484ecb1 Vinod Koul              2021-10-20  671  	fifo_disable =3D r=
eadl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
b59c122484ecb1 Vinod Koul              2021-10-20  672  	switch (fifo_disab=
le) {
b59c122484ecb1 Vinod Koul              2021-10-20  673  	case 1:
b59c122484ecb1 Vinod Koul              2021-10-20  674  		ret =3D spi_geni_=
grab_gpi_chan(mas);
b59c122484ecb1 Vinod Koul              2021-10-20  675  		if (!ret) { /* su=
ccess case */
b59c122484ecb1 Vinod Koul              2021-10-20  676  			mas->cur_xfer_mo=
de =3D GENI_GPI_DMA;
b59c122484ecb1 Vinod Koul              2021-10-20  677  			geni_se_select_m=
ode(se, GENI_GPI_DMA);
b59c122484ecb1 Vinod Koul              2021-10-20  678  			dev_dbg(mas->dev=
, "Using GPI DMA mode for SPI\n");
b59c122484ecb1 Vinod Koul              2021-10-20  679  			break;
9d7054fb3ac2e8 Neil Armstrong          2023-06-15  680  		} else if (ret =
=3D=3D -EPROBE_DEFER) {
d8e9ea989acb54 Praveen Talari          2026-07-10  681  			return ret;
b59c122484ecb1 Vinod Koul              2021-10-20  682  		}
b59c122484ecb1 Vinod Koul              2021-10-20  683  		/*
e5f0dfa78ac773 Vijaya Krishna Nivarthi 2022-12-08  684  		 * in case of fai=
lure to get gpi dma channel, we can still do the
b59c122484ecb1 Vinod Koul              2021-10-20  685  		 * FIFO mode, so =
fallthrough
b59c122484ecb1 Vinod Koul              2021-10-20  686  		 */
b59c122484ecb1 Vinod Koul              2021-10-20  687  		dev_warn(mas->dev=
, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
b59c122484ecb1 Vinod Koul              2021-10-20  688  		fallthrough;
b59c122484ecb1 Vinod Koul              2021-10-20  689 =20
b59c122484ecb1 Vinod Koul              2021-10-20  690  	case 0:
b59c122484ecb1 Vinod Koul              2021-10-20  691  		mas->cur_xfer_mod=
e =3D GENI_SE_FIFO;
da48dc8c70c20e Douglas Anderson        2020-07-01  692  		geni_se_select_mo=
de(se, GENI_SE_FIFO);
739062a9f1e9a7 Jonathan Marek          2025-11-20  693  		/* setup_fifo_par=
ams assumes that these registers start with a zero value */
739062a9f1e9a7 Jonathan Marek          2025-11-20  694  		writel(0, se->bas=
e + SE_SPI_LOOPBACK);
739062a9f1e9a7 Jonathan Marek          2025-11-20  695  		writel(0, se->bas=
e + SE_SPI_DEMUX_SEL);
739062a9f1e9a7 Jonathan Marek          2025-11-20  696  		writel(0, se->bas=
e + SE_SPI_CPHA);
739062a9f1e9a7 Jonathan Marek          2025-11-20  697  		writel(0, se->bas=
e + SE_SPI_CPOL);
739062a9f1e9a7 Jonathan Marek          2025-11-20  698  		writel(0, se->bas=
e + SE_SPI_DEMUX_OUTPUT_INV);
b59c122484ecb1 Vinod Koul              2021-10-20  699  		ret =3D 0;
b59c122484ecb1 Vinod Koul              2021-10-20  700  		break;
b59c122484ecb1 Vinod Koul              2021-10-20  701  	}
da48dc8c70c20e Douglas Anderson        2020-07-01  702 =20
b99181cdf9fa02 Jonathan Marek          2025-11-20  703  	/* We never contro=
l CS manually */
8726bdcef62eac Yang Yingliang          2023-11-28  704  	if (!spi->target) {
14ac4e049dc118 Douglas Anderson        2020-09-12  705  		spi_tx_cfg =3D re=
adl(se->base + SE_SPI_TRANS_CFG);
14ac4e049dc118 Douglas Anderson        2020-09-12  706  		spi_tx_cfg &=3D ~=
CS_TOGGLE;
14ac4e049dc118 Douglas Anderson        2020-09-12  707  		writel(spi_tx_cfg=
, se->base + SE_SPI_TRANS_CFG);
d7f74cc31a89a4 Praveen Talari          2023-07-14  708  	}
14ac4e049dc118 Douglas Anderson        2020-09-12  709 =20
b59c122484ecb1 Vinod Koul              2021-10-20  710  	return ret;
561de45f72bd5f Girish Mahadevan        2018-10-03  711  }
561de45f72bd5f Girish Mahadevan        2018-10-03  712 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
