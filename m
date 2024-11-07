Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FECF1EF08E;
	Thu,  7 Nov 2024 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979263; cv=none; b=nMt86dOGIAceGY9wRKWjPpyTSLoAH31eFIJ33eplERnEDfUjhaXdEB46t2r7cUdLmAJvrZVZTzbVaebz5V2QbaA4xdHwBy8/MX+g2Qaf4+CTjuqVXthCpG5JuJgLuL3HWRWI2wDnqBFQhkRWstdHP0Cl9lvFB5sOzx4pL+2lzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979263; c=relaxed/simple;
	bh=JiJSXSGstzF0acFtzlHTWEni3atDv6RBUrwF9Y7mlt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIHz3aO0LZ8O7f5pAeOMAiUpZiNtNcgW3wmQt5VGdvh/J//e1TrT/6Gxm49XFe/SdiyWDoLX9QL+AUgkJPg8qXgNQZElko31LQRDo6wIgYHZn6Fk8QxT31VqPtrdH2acsDfqzHsFR1yCpaSNGCNo+xFJnTx8wYBY91kUUPEI1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1DQIH1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1DQIH1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A80C4CED0;
	Thu,  7 Nov 2024 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730979263;
	bh=JiJSXSGstzF0acFtzlHTWEni3atDv6RBUrwF9Y7mlt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1DQIH1CHbp3IZ85JpTV3Sy61aELnmHJCvKgx24OcjXGAoEoHKzbKLFV4ldEVURIY
	 J5hpYvKqNPJnJO/jlqW6cNdSax9x0Kik3fSlG0BJxhWgF5GUKl24qaqnm6hqBARZx0
	 OYTSMyDDVjBMNaMNSWT/bmotuhZAu00xQkEmL2qd7YqDCdvdmtMtqfBsehwAFeLyTA
	 Xd3aYjzK2iRQ0JkxJrmPN75WMEN8cdciiU/4YzD4nE2wBpKBJon4GcZexXFBqYtTk3
	 1ZSFNxlR3/thM8RY+pUiaYnS0E5/+CWd8U5l4X7b/q0MoeNl8LsJFzZjE9fXaoluJk
	 kMt6kkWtMK11w==
Date: Thu, 7 Nov 2024 11:34:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [conor:gpio-irq-regmap 2/18] drivers/mailbox/mailbox-mpfs.c:255
 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <20241107-briar-decline-fcf3c81a62d5@spud>
References: <2e34c90c-3260-49dc-89b2-2a5fa098cccd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gRWjX3MtgBchrbS1"
Content-Disposition: inline
In-Reply-To: <2e34c90c-3260-49dc-89b2-2a5fa098cccd@suswa.mountain>


--gRWjX3MtgBchrbS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 02:10:14PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git g=
pio-irq-regmap
> head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
> commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/18] mailbox: mpfs: su=
pport new, syscon based, devicetree configuration
> config: parisc-randconfig-r072-20241106 (https://download.01.org/0day-ci/=
archive/20241107/202411071659.wRgcOIQB-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411071659.wRgcOIQB-lkp@intel.com/
>=20
> smatch warnings:
> drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passing=
 zero to 'PTR_ERR'
>=20
> vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c
>=20
> 6692ff5a8ee2df Conor Dooley 2024-08-07  243  static inline int mpfs_mbox_=
syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
> 83d7b1560810e0 Conor Dooley 2021-06-24  244  {
> 6692ff5a8ee2df Conor Dooley 2024-08-07  245  	mbox->control_scb =3D sysco=
n_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
> 6692ff5a8ee2df Conor Dooley 2024-08-07  246  	if (IS_ERR(mbox->control_sc=
b))
> 6692ff5a8ee2df Conor Dooley 2024-08-07  247  		return PTR_ERR(mbox->contr=
ol_scb);
> 83d7b1560810e0 Conor Dooley 2021-06-24  248 =20
> 6692ff5a8ee2df Conor Dooley 2024-08-07  249  	mbox->sysreg_scb =3D syscon=
_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
> 6692ff5a8ee2df Conor Dooley 2024-08-07  250  	if (IS_ERR(mbox->sysreg_scb=
))
> 6692ff5a8ee2df Conor Dooley 2024-08-07  251  		return PTR_ERR(mbox->sysre=
g_scb);
> 83d7b1560810e0 Conor Dooley 2021-06-24  252 =20
> 6692ff5a8ee2df Conor Dooley 2024-08-07  253  	mbox->mbox_base =3D devm_pl=
atform_ioremap_resource(pdev, 0);
> 6692ff5a8ee2df Conor Dooley 2024-08-07  254  	if (IS_ERR(mbox->ctrl_base))
> 6692ff5a8ee2df Conor Dooley 2024-08-07 @255  		return PTR_ERR(mbox->mbox_=
base);
>=20
> s/mbox->mbox_base/mbox->ctrl_base/

Sweet, good spot chief. I'll squash this in before I send a v2.

>=20
> 6692ff5a8ee2df Conor Dooley 2024-08-07  256 =20
> 6692ff5a8ee2df Conor Dooley 2024-08-07  257  	return 0;
> 6692ff5a8ee2df Conor Dooley 2024-08-07  258  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--gRWjX3MtgBchrbS1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyyluwAKCRB4tDGHoIJi
0kLvAP9ihNZs+H2CaYGGfrh8yawadTOB553xJsOLrqFCnzRj9QEAs+AAJc6Swg8r
gnEpJ3h733WrXOSYBdWGvGkDTXzG4gk=
=wr0N
-----END PGP SIGNATURE-----

--gRWjX3MtgBchrbS1--
