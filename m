Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85AFBFE
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=wA/h8KysoxaKRWGauIL/QZouLXO/
	549R5kA28Mw8hMc=; b=Vypzmk+OacVQWvSdJxxiuA70qpTEWBAkHpfBeiE5ksLd
	tNVyHxqu+w1qJaNn7SLLNHp3TpIBXK2rJuYNR/isWbFQ0ULECSxptj/bA98ma6Vj
	QiGyCEYt1ChmzzmpfJZB8Fg5U5HWV0Wz6W4aOWoxmKkd4G6kfsQhF1N9ZcADshE=
Received: (qmail 600225 invoked from network); 20 Jun 2023 12:36:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2023 12:36:40 +0200
X-UD-Smtp-Session: l3s3148p1@eBH3OY3+KJZehhtC
Date: Tue, 20 Jun 2023 12:36:39 +0200
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
Message-ID: <ZJGBN+CitODr/65a@ninjato>
References: <20230523064310.3005-5-wsa+renesas@sang-engineering.com>
 <a4648fe2-c439-4f3e-a09a-624d4b097d84@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3DnQdxfqv9tDptO"
Content-Disposition: inline
In-Reply-To: <a4648fe2-c439-4f3e-a09a-624d4b097d84@kili.mountain>


--s3DnQdxfqv9tDptO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> 32522a4fa4ae01 Wolfram Sang 2023-05-23  127  	if (IS_ERR(data->reset_gpio=
))
> 32522a4fa4ae01 Wolfram Sang 2023-05-23 @128  		return PTR_ERR(data->reset=
_gpio);
>=20
> ret =3D PTR_ERR(data->reset_gpio);
> goto err_free_gserial;

Correct! Fixed in the next version, thank you!


--s3DnQdxfqv9tDptO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSRgTcACgkQFA3kzBSg
KbbgIQ//Zsxrl8fU1wAPcF0DMgPkauF6qPHyTuKb7y5U7KlKMd8Hkn4pmJq9J+Y3
HtCa2xLmOiF5qeyO/v6RGNyJG8oD84/c2LOj4D4HbYtNHrdA2e+tlrY/zV1726Tq
ESSeJTzOisWTtS+bNcwEPFgdx1NgPn94Za9s7F737T9Wcnh52GhcWfmA2alkH8Qn
3lt3m9WB/SFqHqLoPxInN2BXKVhp9abESgEEy+1wwiDSb+NY6yZgcjltKTNQR7xN
t55W0EMgkFjP6brN6fhxJbZfp95kN+RbiwjQiSfUmrvNFQ+r43t+2/oEsma4uSPd
nAWnToSayeRYKItrq2ATJ3q4qoK4UMVVQsCrywIJcJiD8Ewhek7LE/Gs0eVJzUL2
bjALHAoJBFABEcx71HRkCJHEc1MLDx5SvxY2m5+vqstEVlD835JLmiTDKrag9uMD
6k+YYBPeV2i1d1BgGhVCtJN4PVnnlpbH0sHT44F/kPDIiMo+/1kBlxWhWAPFYjfP
Dl1yFlUvJQimrlvXfDAQTGzBjevovnNVmwf2hFmkkkhL+6L/zhF7Il1FpgH52zAB
iMCMIZcJaSZXOb8R54O02bNJJHuGbse9UGnPWB+Q/JJircK2t2zCM1CtJZ3Nn3ux
Gu44XwP0aOrGF9UNkxhyaSdDQqdj9WjvC/701Qb/v+BFutfqkvk=
=sTBW
-----END PGP SIGNATURE-----

--s3DnQdxfqv9tDptO--
