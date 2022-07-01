Content-Type: multipart/mixed; boundary="===============2059896103172772601=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7 2/8] media: uvcvideo: Add support for per-device control mapping overrides
Date: Fri, 01 Jul 2022 10:26:25 +0300
Message-ID: <20220701072625.GQ11460@kadam>
In-Reply-To: <CANiDSCu1+0C7mfmm20ERVdvbzyJmoifnp6tcjEcd7EJfUAijSQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2059896103172772601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 01:16:23AM +0200, Ricardo Ribalda wrote:
> >
> > "mapping" uninitialized if chain->dev->info->mappings is NULL.
> >
> > 10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022=
-06-17  2457
> > 10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022=
-06-17  2458     /* Process common mappings next. */
> > 10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022=
-06-17 @2459     mend =3D mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> >                                                                        =
                        ^^^^^^^
> >
> > 10bdca4191d7a8 drivers/media/usb/uvc/uvc_ctrl.c   Ricardo Ribalda  2022=
-06-17  2460     for (mapping =3D uvc_ctrl_mappings; mapping < mend; ++mapp=
ing) {
> >
> > I'm surprised this made it through testing...  Anyway, the easier way to
> > to iterate through an array of structs is just say:
> =

> There is already a new version under review that fixes this:
> =

> https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.32=
1917-3-ribalda(a)chromium.org/ =

> =

> =

> >
> >         for (i =3D 0; i < ARRAY_SIZE(uvc_ctrl_mappings); i++) {
> >                 mapping =3D &uvc_ctrl_mappings[i];
> >
> =

> I agree, and that is what I normally used, but that driver iterate this w=
ay...

That's not really an excuse.  Imagine you were a lemming and Disney
employees were trying to chase you off a cliff!

> =

> Thanks again!
> =

> PS: Any idea why the test was triggered 14+ days after the patch was sent?

I don't know how kbuild works.  I run Smatch on linux-next so I would
have caught it eventually.  Plus the clang people would have caught it.

regards,
dan carpenter

--===============2059896103172772601==--

