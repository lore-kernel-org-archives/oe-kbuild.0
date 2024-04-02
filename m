Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552612BF26
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070689; cv=none; b=gyCapFLSadxzBcsc3nr/m6pybpfRzSfPaA0oJynGWW072dIFHdN0QrO7tATbR5mwuNi7h53PPmkhT7txrRGzkHVhyjYGtK5eo1qOLJYw/4GCqtIBMHpmh6lQswDhhVZVLqEFYAYeKy2PTukH8WBmBeWqWcCGzVMPWPy4Z+4dN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070689; c=relaxed/simple;
	bh=sCdbldorM4fwcYHUGZUMrZ/GrDc3BFV9uss5146BVV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2EA846k97ZtXjrxm9MCKn9+AJJS+Fx7VSPHBBJlK572J3dmrlhudZPbkmO5DLAITi1Efwb4k7vu8fcK7d4iiDrekvyr/XEFJW1V6tZYUCfTehJAVo9FxcoEfJlpL63btJQ9d4p1YYJkLisLOdUs6kLL72EZxYs1H3uLKgdJhHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrfnH-0007I3-GQ; Tue, 02 Apr 2024 17:11:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrfnG-00A0Ji-NN; Tue, 02 Apr 2024 17:11:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrfnG-00EPQd-23;
	Tue, 02 Apr 2024 17:11:22 +0200
Date: Tue, 2 Apr 2024 17:11:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1128/2532] drivers/pwm/core.c:1530 pwm_put()
 warn: variable dereferenced before check 'pwm' (see line 1528)
Message-ID: <ylioua4xvt7cbbhk6vnqmywbtj5zuk6lonxjyfaggrb7urvayz@pqglnven76ai>
References: <086d46a0-70a2-41cf-94e5-5cd2377a0937@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dogpob2bd534sg2s"
Content-Disposition: inline
In-Reply-To: <086d46a0-70a2-41cf-94e5-5cd2377a0937@moroto.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild@lists.linux.dev


--dogpob2bd534sg2s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 02, 2024 at 05:13:15PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> commit: d60bc2995732489766cbe650fc367e036ff6a0e0 [1128/2532] pwm: Add a s=
truct device to struct pwm_chip
> config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/ar=
chive/20240331/202403312030.QYCgiAey-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403312030.QYCgiAey-lkp@intel.com/
>=20
> smatch warnings:
> drivers/pwm/core.c:1530 pwm_put() warn: variable dereferenced before chec=
k 'pwm' (see line 1528)
>=20
> vim +/pwm +1530 drivers/pwm/core.c
>=20
> 8138d2ddbcca2a Thierry Reding   2012-03-26  1526  void pwm_put(struct pwm=
_device *pwm)
> 8138d2ddbcca2a Thierry Reding   2012-03-26  1527  {
> d60bc299573248 Uwe Kleine-K=F6nig 2024-03-17 @1528  	struct pwm_chip *chi=
p =3D pwm->chip;
>                                                                          =
       ^^^^^^^^^^
> Dereference
>=20
> d60bc299573248 Uwe Kleine-K=F6nig 2024-03-17  1529 =20
> 8138d2ddbcca2a Thierry Reding   2012-03-26 @1530  	if (!pwm)
>                                                             ^^^^
> Too late.
>=20
> 8138d2ddbcca2a Thierry Reding   2012-03-26  1531  		return;
> 8138d2ddbcca2a Thierry Reding   2012-03-26  1532 =20
> 8138d2ddbcca2a Thierry Reding   2012-03-26  1533  	mutex_lock(&pwm_lock);

This is already addressed in fbf632f9dc55.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dogpob2bd534sg2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYMIBkACgkQj4D7WH0S
/k7OlwgAimd7sOhpRGfoD62K1mTknHUKNYm77sKkJB80/WmABlOdtMvJuMXdYFrC
mEBI6TVL8GBfiME7QlgzdoA2EiTNIb4+iG+ez2MN/u1cfob2FGXQus4LzdTZ17kO
guVN0H80yqq/awaK80YJQqLQLw5A+gugSriDtFyTrOON3Mi44Ak9tCrA0l9UoM2e
KXM9WBN/C3Lj57JiSKgdnZpLhVFD4j07cu8M6e5upXBr6wpE683/kNI9hjLsQNpY
6rUAmDPUH4yRCDKfO+YO4cVKLgFHHRR9twgWxn71PNnJnx+WygINaytqsyOTADr7
zpqcIF7Jhr3gKkIlJL7jsCzrTOwKFA==
=2V4r
-----END PGP SIGNATURE-----

--dogpob2bd534sg2s--
