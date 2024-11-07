Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B891DFE2C;
	Thu,  7 Nov 2024 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979460; cv=none; b=Ru/h7pIfb/eeWfiPfpRpbiM8ogkdaq3D93ex2q1Ej5WzrI3xoSN7Fps8id/c5zWeMg+CvOsl5ky2rnpGl+PSNrhZZx4n3+i/aru9y7TB5QB38vxpS2wmFFjH2PIP0yyVA4vtinaBbsC4zuEhK0bQtN/B+bNz6iZwU6jSCfSJejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979460; c=relaxed/simple;
	bh=q+Scylho+cV4/J6VoffuPnClD1fUGGBLrzA9OYo2GbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMQe0J+bpqjUmk4v/2+DLdoUH9+1pBn85DC77rdhDp8sfPwx7Ku0TsnfPNFD4rc9qUGU/D/BuEW6fNj0YgcQVfdlvWLVYI75phMiU+Yk7QC4fjHTLxygZdRgpXWfC3blsiRFvzQdK28HfgoYUmhlIwKZrhTYyyv7WGQMC71bsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgsCNxHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgsCNxHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C522C4CED2;
	Thu,  7 Nov 2024 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730979460;
	bh=q+Scylho+cV4/J6VoffuPnClD1fUGGBLrzA9OYo2GbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgsCNxHexmNrCF4M/xGK0NOIqBLDdsbB2vQrNHmxMyckHqeSyYBwcE3h662ncshQD
	 BDD/z3ALLVid7C4hpKA4tlPL/qLmER2MVJmKYZ01HtiIqPFN6G0pTWV3zG8HFfpfre
	 +XX9vBlXl0tz9foq/GtbQm86xCGtp0wV+MQKVNqzCETpZMzIaPt4PNoJluq1Jm1MiQ
	 iJEN/UqHj61JtvRnCpv3e28YalU/V0BKgPRY/8kgtVd3R62GqEbktQLvuEWVXR71Qi
	 +J4KZ20MbICMkMubmyAgWlFEkA0pK9ggQfxkc0F1vkNQUbnumVO5sFRWkRckUDMJ7+
	 0hmKw57CYGjQQ==
Date: Thu, 7 Nov 2024 11:37:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [conor:gpio-irq-regmap 2/18] drivers/mailbox/mailbox-mpfs.c:255
 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <20241107-septum-useable-5d5e65ad3f4f@spud>
References: <2e34c90c-3260-49dc-89b2-2a5fa098cccd@suswa.mountain>
 <20241107-briar-decline-fcf3c81a62d5@spud>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pQY9vjrnHa9JcyNt"
Content-Disposition: inline
In-Reply-To: <20241107-briar-decline-fcf3c81a62d5@spud>


--pQY9vjrnHa9JcyNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 11:34:19AM +0000, Conor Dooley wrote:
> On Thu, Nov 07, 2024 at 02:10:14PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git=
 gpio-irq-regmap
> > head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
> > commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/18] mailbox: mpfs: =
support new, syscon based, devicetree configuration
> > config: parisc-randconfig-r072-20241106 (https://download.01.org/0day-c=
i/archive/20241107/202411071659.wRgcOIQB-lkp@intel.com/config)
> > compiler: hppa-linux-gcc (GCC) 14.2.0
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202411071659.wRgcOIQB-lkp@intel.com/
> >=20
> > smatch warnings:
> > drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passi=
ng zero to 'PTR_ERR'
> >=20
> > vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c
> >=20
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  243  static inline int mpfs_mbo=
x_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
> > 83d7b1560810e0 Conor Dooley 2021-06-24  244  {
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  245  	mbox->control_scb =3D sys=
con_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  246  	if (IS_ERR(mbox->control_=
scb))
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  247  		return PTR_ERR(mbox->con=
trol_scb);
> > 83d7b1560810e0 Conor Dooley 2021-06-24  248 =20
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  249  	mbox->sysreg_scb =3D sysc=
on_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  250  	if (IS_ERR(mbox->sysreg_s=
cb))
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  251  		return PTR_ERR(mbox->sys=
reg_scb);
> > 83d7b1560810e0 Conor Dooley 2021-06-24  252 =20
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  253  	mbox->mbox_base =3D devm_=
platform_ioremap_resource(pdev, 0);
> > 6692ff5a8ee2df Conor Dooley 2024-08-07  254  	if (IS_ERR(mbox->ctrl_bas=
e))
> > 6692ff5a8ee2df Conor Dooley 2024-08-07 @255  		return PTR_ERR(mbox->mbo=
x_base);
> >=20
> > s/mbox->mbox_base/mbox->ctrl_base/
>=20
> Sweet, good spot chief. I'll squash this in before I send a v2.

Hmm, actually it should be the other way around and on line 254, no?
The code on line 253 is acting on mbox_base and the IS_ERR() is not.

--pQY9vjrnHa9JcyNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyymgAAKCRB4tDGHoIJi
0hHmAQCZYJTx19gOqtKsK5GW0wtW1mhguDgxKlVMc9/v5dK75QEA0M/WQjBec3jo
Di8mECUeMZSKA2VQ4WThnaTUbc1gbwE=
=CyoL
-----END PGP SIGNATURE-----

--pQY9vjrnHa9JcyNt--
