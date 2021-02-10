Content-Type: multipart/mixed; boundary="===============3831397591140945930=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Date: Wed, 10 Feb 2021 22:05:29 +0300
Message-ID: <20210210190528.GE20820@kadam>
In-Reply-To: <CAMuHMdUTG-0PMsP--i4KE2RA_zOaQgpUDksvtU8dLPW9dSpoug@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3831397591140945930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 07:39:16PM +0100, Geert Uytterhoeven wrote:
> Hi Dan,
> =

> On Wed, Feb 10, 2021 at 7:21 PM Dan Carpenter <dan.carpenter@oracle.com=
> wrote:
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  694    buf =3D devm_kzalloc(pc=
tldev->dev, PINMUX_MAX_NAME * 2, GFP_KERNEL);
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  695    if (!buf)
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  696            return -ENOMEM;
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  697
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  698    fname =3D devm_kzalloc(=
pctldev->dev, PINMUX_MAX_NAME, GFP_KERNEL);
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  699    if (!fname) {
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  700            ret =3D -ENOMEM;
> > 99b2f99aa41aa7 Drew Fustini  2021-02-09  701            goto free_buf;
> >
> > The gotos are out of order.  They should be in mirror/reverse order of
> > the allocations:
> >
> > free_gmane:
> >         devm_kfree(pctldev->dev, gname);
> > free_fname:
> >         devm_kfree(pctldev->dev, fname);
> > free_buf:
> >         devm_kfree(pctldev->dev, buf);
> >
> > But also why do we need to use devm_kfree() at all?  I thought the whole
> > point of devm_ functions was that they are garbage collected
> > automatically for you.  Can we not just delete all error handling and
> > return -ENOMEM here?
> =

> No, because the lifetime of the objects allocated here does not match the
> lifetime of dev.  If they're not freed here, they will only be freed when=
 the
> device is unbound.  As the user can access the sysfs files at will, he can
> OOM the system.
> =


Then why not use vanilla kmalloc()?

regards,
dan carpenter

--===============3831397591140945930==--

