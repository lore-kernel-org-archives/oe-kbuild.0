Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A042597;
	Wed, 10 May 2023 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683705524; x=1715241524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4RA6Es6geZL+3T0CK3mOKV6dn+v7iYhWtpIDgZbPPo=;
  b=UYVTp8hvAnOy4IZAwLlU743pG6wujA2Gw92hZhsMisLjWxAR7XAktmc+
   wCjmLQEPGVMtDk7fgn6w7G4wedBTMxuGu+xRZiOcHd6jv3x9rkkVtG+2R
   xttbFwPfvYg5h7ZFj0HDZgoe3LmF7GgPRsEI86E1Cq5+mAks/FIdaWX1F
   c072+OYxA1xk8m/ccl94GnjQuQuU2ssFt/9LS3HOiohZFV9oYOCo7nLzf
   zymvYb/toiACgPlvP7DhQ4Xe/VdTvsWMEjIPegEDdESrxn/Ms3FfKF4v8
   B+aATdS/Jhztehe19nyGtpgdl5G8I7HRM9PB2HNum+pzFxYQ9kdOK/sTp
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="212698768"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 00:57:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 00:57:34 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 00:57:33 -0700
Date: Wed, 10 May 2023 08:57:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, Conor Dooley <conor+lkp@kernel.org>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:351
 mpfs_irq_mux_init() warn: 'priv->reg' from of_iomap() not released on lines:
 310,316,333,339.
Message-ID: <20230510-overripe-famine-326e83d0287c@wendy>
References: <eee3db8f-77ba-4218-af2a-9f7ec44ceec7@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ioac55ihHTRtJF6y"
Content-Disposition: inline
In-Reply-To: <eee3db8f-77ba-4218-af2a-9f7ec44ceec7@kili.mountain>

--Ioac55ihHTRtJF6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


$from: dan.carpenter@linaro.org

Congrats on the new job :)

On Wed, May 10, 2023 at 10:30:55AM +0300, Dan Carpenter wrote:

>=20
> f39a859cf7fec5 Conor Dooley 2023-05-09  289  static int __init mpfs_irq_m=
ux_init(struct device_node *node, struct device_node *parent)
> f39a859cf7fec5 Conor Dooley 2023-05-09  290  {
> f39a859cf7fec5 Conor Dooley 2023-05-09  291  	struct mpfs_irq_mux *priv;
> f39a859cf7fec5 Conor Dooley 2023-05-09  292  	struct irq_domain *domain;
> f39a859cf7fec5 Conor Dooley 2023-05-09  293  	int i;
> f39a859cf7fec5 Conor Dooley 2023-05-09  294 =20
> f39a859cf7fec5 Conor Dooley 2023-05-09  295  	priv =3D kzalloc(sizeof(*pr=
iv), GFP_KERNEL);
> f39a859cf7fec5 Conor Dooley 2023-05-09  296  	if (!priv)
> f39a859cf7fec5 Conor Dooley 2023-05-09  297  		return -ENOMEM;
> f39a859cf7fec5 Conor Dooley 2023-05-09  298 =20
> f39a859cf7fec5 Conor Dooley 2023-05-09  299  	priv->reg =3D of_iomap(node=
, 0);
> f39a859cf7fec5 Conor Dooley 2023-05-09  300  	if (!priv->reg)
> f39a859cf7fec5 Conor Dooley 2023-05-09  301  		return -ENODEV; //TODO: ad=
d teardown code
>=20
> Of course, these are all marked with TODOs so you already know about
> them...  These emails are generated automatically and I just review
> them and hit forward.

Yah, no worries. I mainly pushed this stuff out to catch whatever
Kconfig dependencies that I had missed (and I had missed quite a few
apparently).
For regular LKP stuff I've got the private report thing on for branches
not starting with "riscv-" to try and no bother anyone other than the
robots, hence still having bits marked TODO. Been iterating quite a lot,
so hadn't bothered writing the error handling yet.

> f39a859cf7fec5 Conor Dooley 2023-05-09  302 =20
> f39a859cf7fec5 Conor Dooley 2023-05-09  303  	priv->mux_config =3D readl(=
priv->reg);
> f39a859cf7fec5 Conor Dooley 2023-05-09  304 =20
> f39a859cf7fec5 Conor Dooley 2023-05-09  305  	for (i =3D 0; i < MPFS_MUX_=
NUM_DIRECT_IRQS; i++) {
> f39a859cf7fec5 Conor Dooley 2023-05-09  306  		priv->irqchip_data[i].outp=
ut_hwirq =3D i;
> f39a859cf7fec5 Conor Dooley 2023-05-09  307 =20
> f39a859cf7fec5 Conor Dooley 2023-05-09  308  		priv->irqchip_data[i].irq =
=3D irq_of_parse_and_map(node, i);
> f39a859cf7fec5 Conor Dooley 2023-05-09  309  		if (priv->irqchip_data[i].=
irq <=3D 0)
> f39a859cf7fec5 Conor Dooley 2023-05-09  310  			return -1; //TODO: add te=
ardown code
>=20
> It's unfortunate that irq_of_parse_and_map() returns zero on error.
> It's for historical reasons.  It used to return NO_IRQ.  :(  I can't
> imagine that all the callers check correctly so I've created a new
> static checker warning for this.  We shall see tomorrow.

Heh, hopefully I am not on the receiving any of any of those!

Thanks,
Conor.

--Ioac55ihHTRtJF6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFtOTAAKCRB4tDGHoIJi
0lz6AP93pkp/7nV5/TefTiIgp+a9HAb8B73P58M4xErocbWm1gEA2fxwb3TvPAX+
yPfo7i1adBQ5R14QcaK8HdBtMnDHWQQ=
=4omw
-----END PGP SIGNATURE-----

--Ioac55ihHTRtJF6y--
