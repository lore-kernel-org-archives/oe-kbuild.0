Content-Type: multipart/mixed; boundary="===============6565694895253099052=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error: uninitialized symbol 'off'.
Date: Mon, 06 Jun 2022 14:25:02 +0300
Message-ID: <20220606112502.GN2168@kadam>
In-Reply-To: <87zgiq3uux.wl-maz@kernel.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6565694895253099052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 12:16:22PM +0100, Marc Zyngier wrote:
> > dc97fd6fec0099 Hector Martin 2022-03-10   926  	switch (irqc->info.vers=
ion) {
> > dc97fd6fec0099 Hector Martin 2022-03-10   927  	case 1: {
> > dc97fd6fec0099 Hector Martin 2022-03-10   928  		u32 info;
> > dc97fd6fec0099 Hector Martin 2022-03-10   929  =

> > 76cde26394114f Hector Martin 2021-01-21   930  		info =3D aic_ic_read(i=
rqc, AIC_INFO);
> > 7c841f5f6fa3f9 Hector Martin 2022-03-10   931  		irqc->nr_irq =3D FIELD=
_GET(AIC_INFO_NR_IRQ, info);
> > dc97fd6fec0099 Hector Martin 2022-03-10   932  		irqc->max_irq =3D AIC_=
MAX_IRQ;
> > dc97fd6fec0099 Hector Martin 2022-03-10   933  =

> > dc97fd6fec0099 Hector Martin 2022-03-10   934  		off =3D irqc->info.tar=
get_cpu;
> > dc97fd6fec0099 Hector Martin 2022-03-10   935  		off +=3D sizeof(u32) *=
 irqc->max_irq; /* TARGET_CPU */
> > dc97fd6fec0099 Hector Martin 2022-03-10   936  =

> > dc97fd6fec0099 Hector Martin 2022-03-10   937  		break;
> > =

> > "off" uninitialized if irqc->info.version !=3D 1.
> =

> Which is pretty much impossible by construction, as as of this
> particular commit, all the possible implementations have version =3D=3D 1.
> =

> Subsequent patches do add cases where version =3D=3D 2, and that gets
> covered too.
> =

> So unless I'm missing something obvious, there is no bug here.

I assumed it was something like that.  The kbuild bot doesn't do cross
function analysis.  Neither does Clang really.

regards,
dan carpenter
--===============6565694895253099052==--

