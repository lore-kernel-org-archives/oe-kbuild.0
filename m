Content-Type: multipart/mixed; boundary="===============4951856649738785721=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/usb/gadget/udc/fsl_udc_core.c:1055 fsl_ep_fifo_status() error: we previously assumed '_ep->desc' could be null (see line 1055)
Date: Tue, 23 Jun 2020 13:36:51 +0300
Message-ID: <20200623103651.GZ4282@kadam>
In-Reply-To: <AM6PR04MB54138B87957CFB06EC9DF351F1940@AM6PR04MB5413.eurprd04.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4951856649738785721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 02:22:18AM +0000, Ran Wang wrote:
> Hi Dan
> =

> On Tuesday, June 23, 2020 2:20 AM, Dan Carpenter wrote:
> =

> <snip>
> =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/usb/gadget/udc/fsl_udc_core.c:1055 fsl_ep_fifo_status() error: =
we
> > previously assumed '_ep->desc' could be null (see line 1055)
> > =

> =

> <snip>
> =

> > =

> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1047  static int fsl_ep_fifo_status(struct usb_ep *_ep)
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1048  {
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1049  	struct fsl_ep *ep;
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1050  	struct fsl_udc *udc;
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1051  	int size =3D 0;
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1052  	u32 bitmask;
> > 6414e94c203d92 drivers/usb/gadget/fsl_udc_core.c     Li Yang
> > 2011-11-23  1053  	struct ep_queue_head *qh;
> > 2ea6698d7b9266 drivers/usb/gadget/fsl_udc_core.c     Anatolij Gustschin
> > 2011-04-18  1054
> > 75eaa498c99eeb drivers/usb/gadget/udc/fsl_udc_core.c Nikhil Badola
> > 2019-10-21 @1055  	if (!_ep || _ep->desc || !(_ep->desc->bEndpointAddre=
ss&0xF))
> >                                          ^^^^^^^^^ Reversed NULL test. =
 This will always return -ENODEV.  (Or possibly crash.  But I suspect it al=
ways returns -ENODEV instead of crashing).
> =

> So the kernel test reports warning in case of '_ep->desc is null', right? =

> =

> My understanding is that this judgement would return -ENODEV when
> executing '... || _ep-desc ||..' and never execute '_ep->desc->bEndpointA=
ddress' part,
> so crash would not happen, am I right?

Yeah.  I can't imagine how _ep->desc is NULL.  It gets set to non-NULL
in fsl_ep_enable() and then set to NULL in fsl_ep_disable().

regards,
dan carpenter

--===============4951856649738785721==--

