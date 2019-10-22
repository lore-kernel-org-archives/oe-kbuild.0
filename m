Content-Type: multipart/mixed; boundary="===============7298599876560662908=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitialized symbol 'nents'.
Date: Tue, 22 Oct 2019 12:28:39 +0300
Message-ID: <20191022092839.GD10833@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7298599876560662908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7d194c2100ad2a6dded545887d02754948ca5241
commit: ea44d190764b4422af4d1c29eaeb9e69e353b406 usbip: Implement SG suppor=
t to vhci-hcd and stub driver
date:   7 weeks ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitialized=
 symbol 'nents'.

Old smatch warnings:
drivers/usb/usbip/stub_rx.c:450 stub_recv_xbuff() error: uninitialized symb=
ol 'ret'.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dea44d190764b4422af4d1c29eaeb9e69e353b406
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout ea44d190764b4422af4d1c29eaeb9e69e353b406
vim +/nents +505 drivers/usb/usbip/stub_rx.c

4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  453  static void stub_recv_cmd_submit(struct stub_device *sdev,
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  454  				 struct usbip_header *pdu)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  455  {
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  456  	struct stub_priv *priv;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  457  	struct usbip_device *ud =3D &sdev->ud;
2d8f4595d1f275 drivers/staging/usbip/stub_rx.c Max Vozeler        2011-01-1=
2  458  	struct usb_device *udev =3D sdev->udev;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  459  	struct scatterlist *sgl =3D NULL, *sg;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  460  	void *buffer =3D NULL;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  461  	unsigned long long buf_len;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  462  	int nents;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  463  	int num_urbs =3D 1;
c6688ef9f29762 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-0=
7  464  	int pipe =3D get_pipe(sdev, pdu);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  465  	int use_sg =3D pdu->u.cmd_submit.transfer_flags & URB_DMA_MAP_SG;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  466  	int support_sg =3D 1;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  467  	int np =3D 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  468  	int ret, i;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  469  =

635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-0=
7  470  	if (pipe =3D=3D -1)
635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-0=
7  471  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  472  =

4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  473  	priv =3D stub_priv_alloc(sdev, pdu);
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  474  	if (!priv)
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  475  		return;
4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-0=
9  476  =

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  477  	buf_len =3D (unsigned long long)pdu->u.cmd_submit.transfer_buffer_=
length;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  478  =

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  479  	/* allocate urb transfer buffer, if needed */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  480  	if (buf_len) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  481  		if (use_sg) {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  482  			sgl =3D sgl_alloc(buf_len, GFP_KERNEL, &nents);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  483  			if (!sgl)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  484  				goto err_malloc;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  485  		} else {
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  486  			buffer =3D kzalloc(buf_len, GFP_KERNEL);
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  487  			if (!buffer)
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  488  				goto err_malloc;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  489  		}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  490  	}
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  491  =

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  492  	/* Check if the server's HCD supports SG */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  493  	if (use_sg && !udev->bus->sg_tablesize) {

Smatch thinks "use_sg" can be true when "buf_len" is zero.  It's hard
to tell if Smatch is right or wrong without more context...

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  494  		/*
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  495  		 * If the server's HCD doesn't support SG, break a single SG
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  496  		 * request into several URBs and map each SG list entry to
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  497  		 * corresponding URB buffer. The previously allocated SG
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  498  		 * list is stored in priv->sgl (If the server's HCD support SG,
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  499  		 * SG list is stored only in urb->sg) and it is used as an
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  500  		 * indicator that the server split single SG request into
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  501  		 * several URBs. Later, priv->sgl is used by stub_complete() and
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  502  		 * stub_send_ret_submit() to reassemble the divied URBs.
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  503  		 */
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  504  		support_sg =3D 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8 @505  		num_urbs =3D nents;
                                                                           =
                     ^^^^^^^^^^^^^^^^

ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  506  		priv->completed_urbs =3D 0;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  507  		pdu->u.cmd_submit.transfer_flags &=3D ~URB_DMA_MAP_SG;
ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-2=
8  508  	}

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============7298599876560662908==--

