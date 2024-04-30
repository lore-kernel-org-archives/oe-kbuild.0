Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE7D1802B8
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496394; cv=none; b=utfqQhZMwfeYQDevhvtiYTGJsxF3gLtc1gmVVHT6lL08ymeRzSVz/i1yzKPs/Oae3kR1/3SrK0+kmpJwiaXvNQ7ek3UKIkS57XSOLJoa6IZFC8k/jKv5IGvE/uZFQ1GRFGcU1n17qvRdPvLv73tzPKIDxsSQ9joFVmup2s3XRuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496394; c=relaxed/simple;
	bh=qz8/q7aDjXRetfMq0QCD+Hjl+BFQCiyUaL2twD/FGsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcc6CSmuKRHLUbiYgtbrtQHkBtWbvuT8Y1Q3XhtDZVa6BakOfzpmHu3n25xLNitva3NhBK2gi+lBmSoO/cFrE2u7VtJ/XE6n75XdvozmFlZmXgzioOioE51ClMWKTJoD3673xjSVblVdssGM6k+096HffBwXJfryBeyTS9FSPgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1qpS-0001MB-FN; Tue, 30 Apr 2024 18:59:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1qpR-00FCBm-IF; Tue, 30 Apr 2024 18:59:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1qpR-00CKvW-1Z;
	Tue, 30 Apr 2024 18:59:41 +0200
Date: Tue, 30 Apr 2024 18:59:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1128/2532] drivers/pwm/core.c:1530 pwm_put()
 warn: variable dereferenced before check 'pwm' (see line 1528)
Message-ID: <rxnzwxj2txeobevail7mt2xnstuwzusbcilxznjwuk7wqx2cke@y4aw2d24jzpx>
References: <086d46a0-70a2-41cf-94e5-5cd2377a0937@moroto.mountain>
 <ylioua4xvt7cbbhk6vnqmywbtj5zuk6lonxjyfaggrb7urvayz@pqglnven76ai>
 <7ab56969-2524-4458-9881-8b63fc80cca8@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3neuahgzqsxkrpzm"
Content-Disposition: inline
In-Reply-To: <7ab56969-2524-4458-9881-8b63fc80cca8@moroto.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild@lists.linux.dev


--3neuahgzqsxkrpzm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dan,

On Tue, Apr 30, 2024 at 02:08:05PM +0300, Dan Carpenter wrote:
> On Tue, Apr 02, 2024 at 05:11:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26  1526  void pwm_put(struct=
 pwm_device *pwm)
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26  1527  {
> > > d60bc299573248 Uwe Kleine-K=F6nig 2024-03-17 @1528  	struct pwm_chip =
*chip =3D pwm->chip;
> > >                                                                      =
           ^^^^^^^^^^
> > > Dereference
> > >=20
> > > d60bc299573248 Uwe Kleine-K=F6nig 2024-03-17  1529 =20
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26 @1530  	if (!pwm)
> > >                                                             ^^^^
> > > Too late.
> > >=20
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26  1531  		return;
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26  1532 =20
> > > 8138d2ddbcca2a Thierry Reding   2012-03-26  1533  	mutex_lock(&pwm_lo=
ck);
> >=20
> > This is already addressed in fbf632f9dc55.
> >=20
>=20
> Apparently we never merged that commit, though...  It's not in
> linux-next.

Oh, I recently dropped a few commits from my for-next branch and this
one was (wrongly) among them. Thanks for paying attention, it's back
now.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3neuahgzqsxkrpzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYxI3wACgkQj4D7WH0S
/k6YLgf/bgwGqi7ZhYTTDqJCwwDV+AjYaF9qEf9nkrttUVja+LzvOP25Z0Kij0Ub
vhk9l8dplZ3uyswwKTLco9UCX/uKlnZiRrqf5IyACUFYJTlY6zBb2W9xpFv3joCo
QDmvvhMBaCLEnhkUwlP1TmxIJPYlkALyemKjtLYY5gPDkMc1AwEZWfFAEjLr8t9j
8EmqvYvxmwuOPhMpB6degs46j9SKNmNCfpwHW7GdzcZO9JNWiZuhwcHnZ+PAb8iz
b5MNqYPOj95OVJCE2vz+dK3qyBSD8P0cZRVlum7W0uJbPM8So4wPZIpmyOwbVqYp
50mb0cXxF0nWgNmucgXI8ERhLVnTKw==
=ScWg
-----END PGP SIGNATURE-----

--3neuahgzqsxkrpzm--
