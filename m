Content-Type: multipart/mixed; boundary="===============7199267595882004031=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 8752/11953] sound/soc/codecs/lpass-macro-common.c:53 lpass_macro_pds_init() warn: passing zero to 'ERR_PTR'
Date: Tue, 22 Mar 2022 17:09:31 +0300
Message-ID: <20220322140931.GW336@kadam>
In-Reply-To: <b4d712ea-ba66-81a6-8cb5-180b5e6f8123@quicinc.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7199267595882004031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 07:32:16PM +0530, Srinivasa Rao Mandadapu wrote:
> =

> On 3/22/2022 7:24 PM, Dan Carpenter wrote:
> Thanks for Your Time Dan!!!
> > On Tue, Mar 22, 2022 at 07:03:23PM +0530, Srinivasa Rao Mandadapu wrote:
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  14  struct lpas=
s_macro *lpass_macro_pds_init(struct device *dev)
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  15  {
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  16  	struct lpa=
ss_macro *l_pds;
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  17  	int ret;
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  18
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  19  	if (!of_fi=
nd_property(dev->of_node, "power-domains", NULL))
> > > > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  20  		return NU=
LL;
> > > > =

> > > > Returning NULL here will lead to a crash in tx_macro_runtime_resume=
()
> > > > =

> > > > When a function returns a mix of NULL and error pointers, then NULL
> > > > means the feature is deliberately disabled.  It's not an error, it'=
s a
> > > > deliberate choice by the distro or sys admin.  The caller has to
> > > > be written to allow the feature to be disabled.
> > > > =

> > > > An example of this might be LEDs.  Maybe people don't want LEDs so =
code
> > > > has to asume that the led->ops pointer might be NULL and check for =
that
> > > > before dereferencing it.
> > > Actually, it's optional here. For some targets, with lpass ADSP enabl=
ed,
> > > power domains are not required.
> > > =

> > > So is the reason, returning NULL Here.
> > > =

> > Unfortunately, the caller is not written to handle NULLs so it will
> > crash.
> =

> Yes agree. will add error check with in lpass_macro_pds_exit().
> =

> Will that make sense?

Yep.  Thanks!

regards,
dan carpenter

--===============7199267595882004031==--

