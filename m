Content-Type: multipart/mixed; boundary="===============6825677591494392425=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 8752/11953] sound/soc/codecs/lpass-macro-common.c:53 lpass_macro_pds_init() warn: passing zero to 'ERR_PTR'
Date: Tue, 22 Mar 2022 16:54:13 +0300
Message-ID: <20220322135413.GV336@kadam>
In-Reply-To: <c18b6297-b70c-6343-806c-e582f9423962@quicinc.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6825677591494392425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 07:03:23PM +0530, Srinivasa Rao Mandadapu wrote:
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  14  struct lpass_ma=
cro *lpass_macro_pds_init(struct device *dev)
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  15  {
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  16  	struct lpass_m=
acro *l_pds;
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  17  	int ret;
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  18
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  19  	if (!of_find_p=
roperty(dev->of_node, "power-domains", NULL))
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  20  		return NULL;
> > =

> > Returning NULL here will lead to a crash in tx_macro_runtime_resume()
> > =

> > When a function returns a mix of NULL and error pointers, then NULL
> > means the feature is deliberately disabled.  It's not an error, it's a
> > deliberate choice by the distro or sys admin.  The caller has to
> > be written to allow the feature to be disabled.
> > =

> > An example of this might be LEDs.  Maybe people don't want LEDs so code
> > has to asume that the led->ops pointer might be NULL and check for that
> > before dereferencing it.
> =

> Actually, it's optional here. For some targets, with lpass ADSP enabled,
> power domains are not required.
> =

> So is the reason, returning NULL Here.
> =


Unfortunately, the caller is not written to handle NULLs so it will
crash.

sound/soc/codecs/lpass-tx-macro.c
  1913  static int tx_macro_remove(struct platform_device *pdev)
  1914  {
  1915          struct tx_macro *tx =3D dev_get_drvdata(&pdev->dev);
  1916  =

  1917          clk_disable_unprepare(tx->macro);
  1918          clk_disable_unprepare(tx->dcodec);
  1919          clk_disable_unprepare(tx->mclk);
  1920          clk_disable_unprepare(tx->npl);
  1921          clk_disable_unprepare(tx->fsgen);
  1922  =

  1923          lpass_macro_pds_exit(tx->pds);
                                     ^^^^^^^
Boom.

  1924  =

  1925          return 0;
  1926  }


> > =

> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  21
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  22  	l_pds =3D devm=
_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  23  	if (!l_pds)
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  24  		return ERR_PT=
R(-ENOMEM);
> > =

> > Good.
> > =

> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  25
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  26  	l_pds->macro_p=
d =3D dev_pm_domain_attach_by_name(dev, "macro");
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  27  	if (IS_ERR_OR_=
NULL(l_pds->macro_pd))
> > 9e3d83c52844f95 Srinivasa Rao Mandadapu 2022-02-26  28  		return NULL;
> > =

> > If this feature is optional then it should be:
> > =

> > 	if (IS_ERR_OR_NULL(l_pds->macro_pd))
> > 		return ERR_CAST(l_pds->macro_pd);
> > =

> > The admin deliberately chose to enable the feature so we can't just
> > ignore errors and convert them to NULL.
> =

> Here it's not optional, if power domains feature is available then macro =
and
> dcodec power domains should be present.
> =

> So will update it like below.
> =

> 	if (IS_ERR_OR_NULL(l_pds->macro_pd)) {
> 		ret =3D PTR_ERR(l_pds->macro_pd);
> 		goto macro_err;
> 	}

I bet COMPILE_TEST allows this to compile without CONFIG_PM but there
isn't anything we can do about that...

regards,
dan carpenter

--===============6825677591494392425==--

