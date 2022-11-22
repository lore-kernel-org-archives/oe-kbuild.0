Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621E10EE
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Nov 2022 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=RJ78S9RpQeos44zG9PO3A7NDJuTV
	Xik+8SBdyARUPh8=; b=N1fDR4XYrY8bJLn7KDa0rVadkY9Xtgk2rOXfp8z0cwuq
	YGX7hFPhguoMgoQLGbqn/LXIk0w4J8n/MwWPCJkARetdOuz4ZE4ua8UOuBLH5bxp
	Qmn4IN7NLUGiDtp3DftfUeGc76YiUcnVF39sP4NUgUrJvqnXq+UHfTgzbHBBZaY=
Received: (qmail 142531 invoked from network); 22 Nov 2022 08:16:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2022 08:16:25 +0100
X-UD-Smtp-Session: l3s3148p1@3mgB8wnu0JZehh99
Date: Tue, 22 Nov 2022 08:16:22 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [linux-next:master 8444/9537]
 drivers/mmc/host/renesas_sdhi_internal_dmac.c:327
 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
Message-ID: <Y3x3RvDIviaKvni/@shikoro>
References: <202211220405.lg7LeBgb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I+bsF90XrdwJMcIq"
Content-Disposition: inline
In-Reply-To: <202211220405.lg7LeBgb-lkp@intel.com>


--I+bsF90XrdwJMcIq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This is like doing dma_priv->end_flags = BIT(BIT(x));  Double BIT().

Eeks, right! Thank you for reporting, I will send a fix!


--I+bsF90XrdwJMcIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN8d0IACgkQFA3kzBSg
Kbb1sw/+N88Kb8T5uFSFiF6/qU6pgnWpZPTF3pVXMXnl4DlSELb6ZSQEj1Fwn986
5KEU2nNS/s6VxGkqJVt4Mljifc519T0cI2Ga97AksZaj0udj7EVOggM1mp+uY7v9
25ReMGir129yLHojadusxbaZ/GpihxCtrGHs5gPVMCtWaoXGmbIL9Ue1LGmwPnqx
58Oc/6TdvXnWwclUSmaOcdeN4IUNWCNZoqc5rGuZ0U6k85TrG9S+fDZFhVCwGH9D
W2TtYfBU0BEIUkoMhi69Es7VJEbAqdXzR6KW0fn/T6FY3d7BeWRYgqfY0a5GV9GT
XauicR+9xDGrCyCRJ+fcgr1ST8iw8Q5gkbKtW4MfVHQpP7pf0lAVeOcSe1g/jCcE
kgo/kQh5F4ApQeqJauYKOkTsu+4zsyRUrWokgd7H0EPYnvNZH7J1c29uX7SN8njE
HIR5za5hO3JclqQTMnKO+c0uyYf6GKMdm5L6oNbuVBFXX4eCqpAdF3R4yd7J5nFi
vVr7le3ZctE1d2WSYmhD8AQJMxAsbc0ndg/2GqbkngbRIgVpZhrYq9isCOHVndf2
L5FXQasnZWb5PaYOKuaEpCRcSGh0rfRc485RewempmfdIgZYRUq8P8QRI5Ph1gLq
Vqx33cmLScXYwkTiE9keO9g4h0zwRhJ00c07I6suMnDJspXMchk=
=Y5FS
-----END PGP SIGNATURE-----

--I+bsF90XrdwJMcIq--
