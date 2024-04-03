Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5101369A1
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Apr 2024 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712140146; cv=none; b=tm9RwcWWy3ce+H139ZpGTptlJg3aVy6ENb6g1bR4pmnugXe36Tqf/BciY1cXAz/5Oloo4x0rCzmqAoMx2l+GiVrBoO6oXMr114ZYH6xqjrLTEqFR2VvDtYTQ9SaypNUKKumvaEmIuY6oyHNCnVpRcp+xhQP3F0iKEwzQTfmdUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712140146; c=relaxed/simple;
	bh=fEouSaoFT1YWDi/4XiRoWBbjoikxsSUd4J0RiHPeu1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3vHu/BFBCgFomZrkKj/ebj87qqLNAm4sRSeQ+f8/q0Kmyx/aGhv/UWO7AMJ+QL/lwdo699p//tBsaLzUDhyjkoktdsae5Y00kZqKWNeysWMctqo381wIYIR/ISvzjBe8EsFcCpECd1u37J7MBzf23cr6esi4lN0EE6ALy+T+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrxrZ-0003JJ-IB; Wed, 03 Apr 2024 12:29:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrxrY-00A9pi-SB; Wed, 03 Apr 2024 12:29:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rrxrY-00EfDg-2Z;
	Wed, 03 Apr 2024 12:29:00 +0200
Date: Wed, 3 Apr 2024 12:28:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 1131/2532] drivers/pwm/core.c:1282
 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
Message-ID: <jobtlrm6v7r2gssuko6hn3mo4wsjcifaytsltfj3nvwhrh66lr@wmihv53dv75s>
References: <1e3dc81d-dcd4-4b04-85b1-23937e2f0acd@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hnjw5qr6b7htquoy"
Content-Disposition: inline
In-Reply-To: <1e3dc81d-dcd4-4b04-85b1-23937e2f0acd@moroto.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild@lists.linux.dev


--hnjw5qr6b7htquoy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 05:26:31PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> commit: 0835e5c8704297e91b54071c3bbcd0c05c63bd3f [1131/2532] pwm: Add sup=
port for pwmchip devices for faster and easier userspace access
> config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/ar=
chive/20240401/202404010703.o1yYkXrA-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202404010703.o1yYkXrA-lkp@intel.com/
>=20
> New smatch warnings:
> drivers/pwm/core.c:1282 pwm_cdev_ioctl() warn: potential spectre issue 'c=
data->pwm' [r]
> drivers/pwm/core.c:1284 pwm_cdev_ioctl() warn: possible spectre second ha=
lf.  'pwm'
> drivers/pwm/core.c:1368 pwm_cdev_ioctl() warn: maybe return -EFAULT inste=
ad of the bytes remaining?

I fixed the issue in line 1368 in my pwm/for-next branch.

For the spectre issue my first guess is:

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 2745941a008b..dd54acd336a6 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/nospec.h>
 #include <linux/seq_file.h>
=20
 #include <dt-bindings/pwm/pwm.h>
@@ -1191,6 +1192,12 @@ static int pwm_cdev_request(struct pwm_cdev_data *cd=
ata, unsigned int hwpwm)
 	if (hwpwm >=3D chip->npwm)
 		return -EINVAL;
=20
+	/*
+	 * Mitigate speculation side-channels; without considering speculation
+	 * this is a noop.
+	 */
+	hwpwm =3D array_index_nospec(hwpwm, chip->npwm);
+
 	if (!cdata->pwm[hwpwm]) {
 		struct pwm_device *pwm =3D &chip->pwms[hwpwm];
 		int ret;

But I'm unsure if this also addresses the issue for

	pwm =3D cdata->pwm[cstate.hwpwm];

Maybe pwm_cdev_request() is better changed to return the struct
pwm_device *? Who is the expert, who can help here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hnjw5qr6b7htquoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYNL2gACgkQj4D7WH0S
/k5pPggAhYTYpqOYGx/B5ZBGuGAJ06eRTdwfs5RBTSo+drBUbHt1HYoXNZu+lSj1
kWkvQY5zjtQ7j4MesZKTx81zv3Iu1+rZIQvjhgNFK9aUCltc6GvsEr6Bv0KuES6A
P4Ac4QykB9BSIAQtHi67ZnTL4ZQxDDK+JNtr/NY19o3SwEYyLilyvOlvrya/xFac
YfQw2Gz659rZs06h/mgQFrFBAN39GKfOOx5PsVa/y/2ZSC5QVXV2UhQdR04W6mms
eymlUm1SzKpfomclNXUvOx/fPRmx8oKRgD9W+rznsvGRU04Ct1ttu79Lw1zW6wbj
5pRb0KBbdFji4rNMJMqXYYcByg64Xg==
=lg3v
-----END PGP SIGNATURE-----

--hnjw5qr6b7htquoy--
