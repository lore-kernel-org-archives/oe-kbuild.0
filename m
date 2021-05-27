Content-Type: multipart/mixed; boundary="===============2132545534742235988=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [input:next 2732/2735] drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
Date: Thu, 27 May 2021 13:41:57 +0300
Message-ID: <20210527104157.GK24442@kadam>
In-Reply-To: <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2132545534742235988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 12:19:51PM +0200, Oleksij Rempel wrote:
> Hi,
> =

> On Thu, May 27, 2021 at 12:30:00PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git =
 next
> > head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
> > commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: res=
istive-adc-touch - add support for z1 and z2 channels
> > config: x86_64-randconfig-m001-20210526 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uni=
nitialized symbol 'z2'.
> > drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uni=
nitialized symbol 'x'.
> > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: un=
initialized symbol 'y'.
> > =

> > Old smatch warnings:
> > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: un=
initialized symbol 'x'.
> > drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: un=
initialized symbol 'y'.
> > =

> > vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c
> > =

> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const=
 void *data, void *private)
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info =
=3D data;
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st =
=3D private;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, pres=
s =3D 0, z1 =3D 0, z2;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  =

> > fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i =3D 0; i < ARRAY=
_SIZE(st->ch) && st->ch[i] !=3D GRTS_CH_NONE; i++) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x =3D touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y =3D touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press =3D touch_info[=
i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 =3D touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 =3D touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   82  =

> > fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt =3D z2;
> > =

> > It's likely this is a false positive, but we can see why the static
> > checker would complain.
> =

> The presence of this values was validated on probe. Do we really need
> extra set them to 0?

You don't need to do anything.  ;)  These are a one time email.  I just
look it over and hit forward.

Currently GCC's uninitialized variable checking is disabled in the
kernel otherwise there would be more presure to silence the checker
warning.

regards,
dan carpenter

--===============2132545534742235988==--

