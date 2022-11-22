Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C810FC
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Nov 2022 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=53i08yR3LPrkTPNVM14C8/vkyZB/
	BrnmKD0QHFVvf/I=; b=Z+zftOPTuivrufyN6t+KAEh4fDfg/dGKe831HY77SLRs
	lVKDTvhJzvS+Mz7wTvBXwc23kPt3Ty+C5xkkOqx3xj5mwkbm/Ms/QaB1GQV2B+6U
	mPC2rIPJcEFInPsYCIL6MTDYoStAgjtMO22Qu/ocGiG2Ufibim63qpajxcwCNng=
Received: (qmail 177683 invoked from network); 22 Nov 2022 09:42:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2022 09:42:35 +0100
X-UD-Smtp-Session: l3s3148p1@FP5OJwvuWKFehh99
Date: Tue, 22 Nov 2022 09:42:34 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [linux-next:master 8444/9537]
 drivers/mmc/host/renesas_sdhi_internal_dmac.c:327
 renesas_sdhi_internal_dmac_dma_irq() warn: set_bit() takes a bit number
Message-ID: <Y3yLerDI33CAgEUe@ninjato>
References: <202211220405.lg7LeBgb-lkp@intel.com>
 <Y3x3RvDIviaKvni/@shikoro>
 <Y3yETLzmBhjVeOr/@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1Orkc0/N1qVe7Pd"
Content-Disposition: inline
In-Reply-To: <Y3yETLzmBhjVeOr/@kadam>


--U1Orkc0/N1qVe7Pd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> These warnings are normally harmless because people write consistent

Yes, the code still works. Using APIs not correctly doesn't look good,
though...


--U1Orkc0/N1qVe7Pd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN8i3cACgkQFA3kzBSg
Kbac8Q/8CoK310SBUomk7RYD5WIiPp09Y2FUp2vfQ8xijylMQ4sTx3HusKHTje0j
4ewVPervcYFKiCRSbplWzbmsyuvpCJn5GZ6cAiESY501xAdSa68PHRCwo5WVIzEl
oc+yVIgAKttb8hi29delmJ2JM/AxHm/TBBJQwaxeX5N0Bm6t04SHQnNWbnFr4tY1
XQNhWdghk5SlY3e3Qo21rzLgFgTr4Pm8R7p3WR0oE2+cVWV+ntApaZXSy44JNgN8
Ih67KB4/3CqiSmgFdXfPVPwoYSQ4W/ACHh5G3yJTHtxTDzqEw39wvZMXkL7/CDQ+
ufRtyVX+PxXcQBbfwT6UUg1SPYUF6Nni0XRk+LXqIbS3pihPyx5iasIF/sUk8Mdy
JWKOn90fd+7Yv84mTsk/+rls2W7jGjLtam2UTvtSx19oT0LHizdXESH4vX2tm5qb
/1dVJIaKNPJtJtO4kC42LdmmOxUatzp3aFKIHDdMXVyygDqNw/be/dftHhUiuD1J
HKdy0vw0KrWNbZYR+KUTv5VkKGmQUuYNJOm48c9FHyry3I4W+Sm0iADb17IBzwys
fAZ7AvH6bWUJMq/dMo7ORkaiSEK1OReB9UEArZpmMNTrgwev2PLXRYH46cgJnPHw
0oEt1MKhHw6yK0DMlTUYBxEqgU1JKW7ICzYxrc70T53M5b5yz/w=
=GLhW
-----END PGP SIGNATURE-----

--U1Orkc0/N1qVe7Pd--
