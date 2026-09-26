Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CA12C534
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396209; cv=none; b=ULDVKFPiYoxQ/VvdZshfm85JJpikKKHmSnGg5F0+eQCgt+rIeKSuTEb5x9yGGwRPGpPEOgdjBcU0ORD1Th0zUwJFR1nlvJ1bBGJdAduWwKDFi02QMu4N7qGpbLOJy2kkqR7yqJ+S5lds1E+oSl9C4fW5ljz/RgjpEoCzcYn3F+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396209; c=relaxed/simple;
	bh=6G12k+GKHBAAZC/mOAhcXz82qdn4bVjzYTDa8E+3vdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TL9wvr2XxsRDWZ9iAR9hI68MyKBwHNRW7lG9qggITvCHgDvKyMubPECFEXPha4Fy07lRL1hVH7HSK8o6T/Z6PvKjTkQOCqFESdWiPc19HpKFTdP2EDU3pfiWm8xsnLPSSOqOykycGJsC7xdxfPMmJ1ivTqwoZIDqANlVTC2fAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBMGk5y5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBMGk5y5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790396207; x=1821932207;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6G12k+GKHBAAZC/mOAhcXz82qdn4bVjzYTDa8E+3vdg=;
  b=dBMGk5y5fbpyohEVy9IHdDqg1FKGVL0S8iPEjCDASetmSSZX+AGb3EMF
   uRQbAqqMn0AMwln+fK8fzmE2cgO28Q6s5fXBiwWNpZXOmE2Xxlah7dHzr
   GbjpJOZNPlZyC0dEkJrBz9OK6kk0yB1zrfX3BVsvQhq4EzW7Q4Kxt7Hm4
   DsBz4Q1++zV+VwoEhyrTxh/SoCHT0cGYeErioGRhLvAU6ie+UlLk29htj
   PlFsost3GN7e0xmaByBQIAf3ybl3+cHuu/rXTymwbGd3KV0mGHWVKhCVn
   MR0YmpL6WqtFrsNcfMKvZQwLZeCaZ87aN7/Knmtqs0nhu2qiHFm8q/0rk
   g==;
X-CSE-ConnectionGUID: kvr66s1kSGiFi8QCanLOmw==
X-CSE-MsgGUID: axf1/eiFQAyFsnNAiUnZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93898028"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="93898028"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 21:16:46 -0700
X-CSE-ConnectionGUID: WCXmSSG9T2mcIko42LWXaw==
X-CSE-MsgGUID: HBuW8vi4SIeq9rfxKZkvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="270983407"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 21:16:45 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAJq6-000000000DP-2FE6;
	Sat, 26 Sep 2026 04:16:42 +0000
Date: Sat, 26 Sep 2026 06:16:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arnd-playground:randconfig-7.3-next 562/673]
 drivers/tty/serial/8250/8250_dw.c:591 dw8250_quirks() warn: if statement not
 indented
Message-ID: <202609260659.bEI1s3z6-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 065c245ab6ac3537488e5c410d38d4768824dd07 [562/673] random hacks
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/arch=
ive/20260926/202609260659.bEI1s3z6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609260659.bEI1s3z6-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/8250/8250_dw.c:591 dw8250_quirks() warn: if statement no=
t indented
drivers/tty/serial/8250/8250_dw.c:686 dw8250_probe() warn: if statement not=
 indented
drivers/tty/serial/8250/8250_of.c:181 of_platform_serial_setup() warn: if s=
tatement not indented

Old smatch warnings:
drivers/tty/serial/8250/8250_dw.c:592 dw8250_quirks() warn: if statement no=
t indented
drivers/tty/serial/8250/8250_of.c:184 of_platform_serial_setup() warn: if s=
tatement not indented

vim +591 drivers/tty/serial/8250/8250_dw.c

0946efc2255fee drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2021-=
10-05  590 =20
4a218b277fdba3 drivers/tty/serial/8250/8250_dw.c Emil Renner Berthing 2022-=
04-22 @591  	if (quirks & DW_UART_QUIRK_ARMADA_38X)
4a218b277fdba3 drivers/tty/serial/8250/8250_dw.c Emil Renner Berthing 2022-=
04-22  592  	if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  593  	if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  594  		data->data.dma.txconf.device_fc =3D 1;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  595  		data->data.dma.rxconf.device_fc =3D 1;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  596  		data->data.dma.prepare_tx_dma =3D dw8250_prepare_tx_dma;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  597  		data->data.dma.prepare_rx_dma =3D dw8250_prepare_rx_dma;
aa63d786cea273 drivers/tty/serial/8250/8250_dw.c Phil Edworthy        2022-=
04-22  598  	}
173b097dcc8d74 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-06  599  	if (quirks & DW_UART_QUIRK_APMC0D08) {
c73942e22aa4a3 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  600  		data->uart_16550_compatible =3D true;
9e08fa50b2f593 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  601  	}
6a7320c4669fbf drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2013-=
01-10  602  }
6a7320c4669fbf drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2013-=
01-10  603 =20
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  604  static void dw8250_reset_control_assert(void *data)
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  605  {
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  606  	reset_control_assert(data);
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  607  }
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  608 =20
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  609  static void dw8250_shutdown(struct uart_port *port)
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  610  {
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  611  	struct dw8250_data *d =3D to_dw8250_data(port->private_da=
ta);
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  612 =20
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  613  	serial8250_do_shutdown(port);
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  614  	d->no_int_count =3D 0;
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  615  }
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  616 =20
9671f09921d93e drivers/tty/serial/8250/8250_dw.c Bill Pemberton       2012-=
11-19  617  static int dw8250_probe(struct platform_device *pdev)
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  618  {
62907e90cc7e81 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
08-06  619  	struct uart_8250_port uart =3D {}, *up =3D &uart;
62907e90cc7e81 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
08-06  620  	struct uart_port *p =3D &up->port;
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  621  	struct device *dev =3D &pdev->dev;
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  622  	struct dw8250_data *data;
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  623  	struct resource *regs;
c859e8d1c0dd53 drivers/tty/serial/8250/8250_dw.c Arnd Bergmann        2025-=
08-07  624  	int err =3D 0;
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  625 =20
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  626  	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  627  	if (!regs)
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  628  		return dev_err_probe(dev, -EINVAL, "no registers defined\n");
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  629 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  630  	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
e302cd932094fa drivers/tty/serial/8250/8250_dw.c Emilio L=C3=B3pez         =
2013-03-29  631  	if (!data)
e302cd932094fa drivers/tty/serial/8250/8250_dw.c Emilio L=C3=B3pez         =
2013-03-29  632  		return -ENOMEM;
e302cd932094fa drivers/tty/serial/8250/8250_dw.c Emilio L=C3=B3pez         =
2013-03-29  633 =20
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  634  	if (!p->membase)
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  635  		return -ENOMEM;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  636 =20
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  637  	/* no interrupt -> fall back to polling */
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  638  	if (err =3D=3D -ENXIO)
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  639  		err =3D 0;
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  640  	if (err)
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  641  		return err;
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  642 =20
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  643  	switch (p->iotype) {
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  644  	case UPIO_MEM:
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  645  		break;
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  646  	case UPIO_MEM32:
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  647  		break;
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  648  	case UPIO_MEM32BE:
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  649  		break;
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  650  	default:
e6a46d073e11ba drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2024-=
03-04  651  		return -ENODEV;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  652  	}
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  653 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  654  	if (device_property_read_bool(dev, "dcd-override")) {
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  655  		/* Always report DCD as active */
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  656  		data->msr_mask_on |=3D UART_MSR_DCD;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  657  		data->msr_mask_off |=3D UART_MSR_DDCD;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  658  	}
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  659 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  660  	if (device_property_read_bool(dev, "dsr-override")) {
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  661  		/* Always report DSR as active */
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  662  		data->msr_mask_on |=3D UART_MSR_DSR;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  663  		data->msr_mask_off |=3D UART_MSR_DDSR;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  664  	}
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  665 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  666  	if (device_property_read_bool(dev, "cts-override")) {
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  667  		/* Always report CTS as active */
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  668  		data->msr_mask_on |=3D UART_MSR_CTS;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  669  		data->msr_mask_off |=3D UART_MSR_DCTS;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  670  	}
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  671 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  672  	if (device_property_read_bool(dev, "ri-override")) {
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  673  		/* Always report Ring indicator as inactive */
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  674  		data->msr_mask_off |=3D UART_MSR_RI;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  675  		data->msr_mask_off |=3D UART_MSR_TERI;
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  676  	}
1bd8edba10e6aa drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  677 =20
23f5b3fdd04e89 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
03-18  678  	/* If there is separate baudclk, get the rate from it. */
70a0d499db058b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2023-=
09-19  679  	data->clk =3D devm_clk_get_optional_enabled(dev, "baudclk");
a8afc193558a42 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
09-25  680  	if (data->clk =3D=3D NULL)
70a0d499db058b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2023-=
09-19  681  		data->clk =3D devm_clk_get_optional_enabled(dev, NULL);
a8afc193558a42 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
09-25  682  	if (IS_ERR(data->clk))
65295eba1915cf drivers/tty/serial/8250/8250_dw.c Uwe Kleine-K=C3=B6nig     =
2024-02-22  683  		return dev_err_probe(dev, PTR_ERR(data->clk),
65295eba1915cf drivers/tty/serial/8250/8250_dw.c Uwe Kleine-K=C3=B6nig     =
2024-02-22  684  				     "failed to get baudclk\n");
a8afc193558a42 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
09-25  685 =20
a8afc193558a42 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
09-25 @686  	if (data->clk)
e302cd932094fa drivers/tty/serial/8250/8250_dw.c Emilio L=C3=B3pez         =
2013-03-29  687 =20
23f5b3fdd04e89 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
03-18  688  	/* If no clock rate is defined, fail. */
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  689  	if (!p->uartclk)
57f83e5dd6a33c drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  690  		return dev_err_probe(dev, -EINVAL, "clock rate not defined\n"=
);
23f5b3fdd04e89 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
03-18  691 =20
70a0d499db058b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2023-=
09-19  692  	data->pclk =3D devm_clk_get_optional_enabled(dev, "apb_pclk");
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  693  	if (IS_ERR(data->pclk))
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  694  		return PTR_ERR(data->pclk);
a8afc193558a42 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
09-25  695 =20
41424f5c3bef47 drivers/tty/serial/8250/8250_dw.c Hal Feng             2024-=
06-04  696  	data->rst =3D devm_reset_control_array_get_optional_exclusive(=
dev);
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  697  	if (IS_ERR(data->rst))
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  698  		return PTR_ERR(data->rst);
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  699 =20
daeb4037adf7d3 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
10-19  700  	err =3D reset_control_deassert(data->rst);
daeb4037adf7d3 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
10-19  701  	if (err)
daeb4037adf7d3 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
10-19  702  		return dev_err_probe(dev, err, "failed to deassert resets\n");
7fe090bf48b522 drivers/tty/serial/8250/8250_dw.c Chen-Yu Tsai         2014-=
07-23  703 =20
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  704  	err =3D devm_add_action_or_reset(dev, dw8250_reset_control_ass=
ert, data->rst);
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  705  	if (err)
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  706  		return err;
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  707 =20
485c13d9bc7a83 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
11-04  708  	err =3D pm_runtime_set_active(dev);
485c13d9bc7a83 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
11-04  709  	if (err)
485c13d9bc7a83 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
11-04  710  		return dev_err_probe(dev, err, "Failed to set the runtime sus=
pend as active\n");
485c13d9bc7a83 drivers/tty/serial/8250/8250_dw.c Artem Shimko         2025-=
11-04  711 =20
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  712  	data->uart_16550_compatible =3D device_property_read_bool(dev,=
 "snps,uart-16550-compatible");
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  713 =20
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  714  	data->pdata =3D device_get_match_data(p->dev);
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  715  	if (data->pdata)
9e08fa50b2f593 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  716  		dw8250_quirks(p, data);
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  717 =20
c73942e22aa4a3 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  718  	/* If the Busy Functionality is not implemented, don't handle =
it */
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  719  	if (data->uart_16550_compatible) {
c73942e22aa4a3 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  720  		p->handle_irq =3D NULL;
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  721  	} else if (data->pdata) {
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  722  		p->handle_irq =3D dw8250_handle_irq;
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  723  		p->shutdown =3D dw8250_shutdown;
73a4ed8f9efaaa drivers/tty/serial/8250/8250_dw.c Ilpo J=C3=A4rvinen        =
2026-02-03  724  	}
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  725 =20
c213375e328304 drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2025-=
02-12  726  	dw8250_setup_dma_filter(p, data);
c73942e22aa4a3 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  727 =20
4f042054faa0f4 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  728  	if (!data->skip_autocfg)
2338a75e0fe719 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  729  		dw8250_setup_port(p);
4f042054faa0f4 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  730 =20
2559318caa7602 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  731  	/* If we have a valid fifosize, try hooking up DMA */
2559318caa7602 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  732  	if (p->fifosize) {
4d5675c3b10b7b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
08-06  733  		data->data.dma.rxconf.src_maxburst =3D p->fifosize / 4;
4d5675c3b10b7b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
08-06  734  		data->data.dma.txconf.dst_maxburst =3D p->fifosize / 4;
2559318caa7602 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  735  	}
2559318caa7602 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2015-=
09-21  736 =20
4d5675c3b10b7b drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2019-=
08-06  737  	data->data.line =3D serial8250_register_8250_port(up);
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  738  	if (data->data.line < 0)
295b09128d12fb drivers/tty/serial/8250/8250_dw.c Andy Shevchenko      2022-=
05-09  739  		return data->data.line;
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  740 =20
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  741  	platform_set_drvdata(pdev, data);
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  742 =20
2cb78eab2376a3 drivers/tty/serial/8250/8250_dw.c Kefeng Wang          2016-=
09-01  743  	pm_runtime_enable(dev);
ffc3ae6dd925b6 drivers/tty/serial/8250/8250_dw.c Heikki Krogerus      2013-=
04-10  744 =20
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  745  	return 0;
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  746  }
7d4008ebb1c971 drivers/tty/serial/8250_dw.c      Jamie Iles           2011-=
08-26  747 =20

:::::: The code at line 591 was first introduced by commit
:::::: 4a218b277fdba357d8e9022ae675c94e59d64b4e serial: 8250: dw: Create a =
generic platform data structure

:::::: TO: Emil Renner Berthing <kernel@esmil.dk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
