Content-Type: multipart/mixed; boundary="===============6717351859814198740=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitialized symbol 'nents'.
Date: Thu, 24 Oct 2019 22:45:00 +0300
Message-ID: <20191024194500.GD23523@kadam>
In-Reply-To: <20191023071120.GA3061@localhost.localdomain>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6717351859814198740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 04:11:20PM +0900, Suwan Kim wrote:
> On Tue, Oct 22, 2019 at 12:28:39PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   7d194c2100ad2a6dded545887d02754948ca5241
> > commit: ea44d190764b4422af4d1c29eaeb9e69e353b406 usbip: Implement SG su=
pport to vhci-hcd and stub driver
> > date:   7 weeks ago
> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitial=
ized symbol 'nents'.
> > =

> > Old smatch warnings:
> > drivers/usb/usbip/stub_rx.c:450 stub_recv_xbuff() error: uninitialized =
symbol 'ret'.
> > =

> > # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Dea44d190764b4422af4d1c29eaeb9e69e353b406
> > git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git
> > git remote update linus
> > git checkout ea44d190764b4422af4d1c29eaeb9e69e353b406
> > vim +/nents +505 drivers/usb/usbip/stub_rx.c
> > =

> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  453  static void stub_recv_cmd_submit(struct stub_device *sdev,
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  454  				 struct usbip_header *pdu)
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  455  {
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  456  	struct stub_priv *priv;
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  457  	struct usbip_device *ud =3D &sdev->ud;
> > 2d8f4595d1f275 drivers/staging/usbip/stub_rx.c Max Vozeler        2011-=
01-12  458  	struct usb_device *udev =3D sdev->udev;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  459  	struct scatterlist *sgl =3D NULL, *sg;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  460  	void *buffer =3D NULL;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  461  	unsigned long long buf_len;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  462  	int nents;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  463  	int num_urbs =3D 1;
> > c6688ef9f29762 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-=
12-07  464  	int pipe =3D get_pipe(sdev, pdu);
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  465  	int use_sg =3D pdu->u.cmd_submit.transfer_flags & URB_DMA_MAP_=
SG;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  466  	int support_sg =3D 1;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  467  	int np =3D 0;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  468  	int ret, i;
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  469  =

> > 635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-=
12-07  470  	if (pipe =3D=3D -1)
> > 635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-=
12-07  471  		return;
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  472  =

> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  473  	priv =3D stub_priv_alloc(sdev, pdu);
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  474  	if (!priv)
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  475  		return;
> > 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-=
07-09  476  =

> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  477  	buf_len =3D (unsigned long long)pdu->u.cmd_submit.transfer_buf=
fer_length;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  478  =

> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  479  	/* allocate urb transfer buffer, if needed */
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  480  	if (buf_len) {
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  481  		if (use_sg) {
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  482  			sgl =3D sgl_alloc(buf_len, GFP_KERNEL, &nents);
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  483  			if (!sgl)
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  484  				goto err_malloc;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  485  		} else {
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  486  			buffer =3D kzalloc(buf_len, GFP_KERNEL);
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  487  			if (!buffer)
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  488  				goto err_malloc;
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  489  		}
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  490  	}
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  491  =

> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  492  	/* Check if the server's HCD supports SG */
> > ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-=
08-28  493  	if (use_sg && !udev->bus->sg_tablesize) {
> > =

> > Smatch thinks "use_sg" can be true when "buf_len" is zero.  It's hard
> > to tell if Smatch is right or wrong without more context...
> =

> This is a bit strange. The meaning of "use_sg" is that client will
> use scatter-gather and client's urb->num_sgs is not zero. And buffer
> length should not be zero.
> =

> usb_sg and buf_len are both client-dependent variables, so I think
> if they have wrong value in the server side, the client must have
> sent use_sg and buf_len with incorrect values.
> =

> Did this error occur when compiling?

Smatch is doing static analysis, yes.

> If then, Did Smatch also consider vhci tx side?

I'm not really sure...  I can't reproduce the warning because on my
system Smatch doesn't parse usbip_recv() correctly so it ends up
silencing that warning.  :/

regards,
dan carpenter

--===============6717351859814198740==--

