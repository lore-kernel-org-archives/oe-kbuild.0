Content-Type: multipart/mixed; boundary="===============6825043022288964566=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a3xx_gpu.c:600 a3xx_gpu_init() error: passing non negative 1 to ERR_PTR
Date: Fri, 16 Apr 2021 07:33:36 +0300
Message-ID: <20210416043336.GM6048@kadam>
In-Reply-To: <CAJs_Fx7fgeURHzm2k-Bb8h_xy1=-5vrbt+jt5J=vEzr1rEd8Cw@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6825043022288964566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:21:01PM -0700, Rob Clark wrote:
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  571         icc_path =3D de=
vm_of_icc_get(&pdev->dev, "gfx-mem");
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  572         ret =3D IS_ERR(=
icc_path);
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  573         if (ret)
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  574                 goto fa=
il;
> > >
> > > IS_ERR() returns/true false so this will lead to an Oops in the calle=
r.
> > >
> > >       icc_path =3D devm_of_icc_get(&pdev->dev, "gfx-mem");
> > >       if (IS_ERR(icc_path)) {
> > >               ret =3D PTR_ERR(icc_path);
> > >               goto fail;
> > >       }
> > Agree.
> >
> > >
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  575
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  576         ocmem_icc_path =
=3D devm_of_icc_get(&pdev->dev, "ocmem");
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  577         ret =3D IS_ERR(=
ocmem_icc_path);
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  578         if (ret) {
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  579                 /* allo=
w -ENODATA, ocmem icc is optional */
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  580                 if (ret=
 !=3D -ENODATA)
> > > 5785dd7a8ef0de Akhil P Oommen 2020-10-28  581                        =
 goto fail;
> > >
> > > Same.  ret is true/false so it can't be equal to -ENODATA, plus the
> > > caller will Oops.
> > >
> > > Btw, this patch removed the assignments:
> > >
> > >               gpu->icc_path =3D of_icc_get(dev, "gfx-mem");
> > >               gpu->ocmem_icc_path =3D of_icc_get(dev, "ocmem");
> > >
> > > So I think "gpu->icc_path" and "gpu->ocmem_icc_path" are always
> > > NULL/unused and they should be removed.
> > >
> > Agree. Will share a fix.
> > Thanks, Dan.
> =

> gpu->ocmem_icc_path/icc_path is used on older devices.. it sounds like
> we broke some older devices and no one has noticed yet?

This is error paths and dead code.  Probably no one is affected in
real life.

regards,
dan carpenter
--===============6825043022288964566==--

