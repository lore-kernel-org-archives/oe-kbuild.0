Content-Type: multipart/mixed; boundary="===============6370376341417098102=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/ethernet/freescale/gianfar.c:580 gfar_parse_group() warn: 'grp->regs' not released on lines: 517.
Date: Tue, 17 Nov 2020 10:14:42 +0300
Message-ID: <20201117071442.GF18329@kadam>
In-Reply-To: <VE1PR04MB6687ADE11367CF7FAE759B678FE20@VE1PR04MB6687.eurprd04.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6370376341417098102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 01:41:15AM +0000, Leo Li wrote:
> > ee873fda3bec7c6 drivers/net/ethernet/freescale/gianfar.c Claudiu Manoil
> > 2013-01-29  513  		gfar_irq(grp, ER)->irq =3D
> > irq_of_parse_and_map(np, 2);
> > fea0f6650979a4f drivers/net/ethernet/freescale/gianfar.c Mark Brown
> > 2015-11-26  514  		if (!gfar_irq(grp, TX)->irq ||
> > fea0f6650979a4f drivers/net/ethernet/freescale/gianfar.c Mark Brown
> > 2015-11-26  515  		    !gfar_irq(grp, RX)->irq ||
> > fea0f6650979a4f drivers/net/ethernet/freescale/gianfar.c Mark Brown
> > 2015-11-26  516  		    !gfar_irq(grp, ER)->irq)
> > 46ceb60ca80fa07 drivers/net/gianfar.c                    Sandeep Gopalp=
et 2009-11-
> > 02  517  			return -EINVAL;
> > =

> > This should unmap "grp->regs".
> =

> This variable is unmapped in the caller with a wholesale cleanup function=
 unmap_group_regs().  Probably a false positive for smatch?
> =


Yeah.  Thanks.  Smatch doesn't consider that the variable might be freed
in the caller.

regards,
dan carpenter

--===============6370376341417098102==--

