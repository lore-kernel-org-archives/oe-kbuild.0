Content-Type: multipart/mixed; boundary="===============5830191229385921834=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/can/usb/peak_usb/pcan_usb.c:523 pcan_usb_decode_error() error: we previously assumed 'cf' could be null (see line 503)
Date: Fri, 03 Dec 2021 18:14:44 +0300
Message-ID: <20211203151444.GK18178@kadam>
In-Reply-To: <20211203145851.nrgmnu7c56w4vecy@pengutronix.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5830191229385921834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 03:58:51PM +0100, Marc Kleine-Budde wrote:
> > =

> > 46be265d338833 Stephane Grosjean 2012-03-02  450  static int pcan_usb_d=
ecode_error(struct pcan_usb_msg_context *mc, u8 n,
> > 46be265d338833 Stephane Grosjean 2012-03-02  451  				 u8 status_len)
> > 46be265d338833 Stephane Grosjean 2012-03-02  452  {
> > 46be265d338833 Stephane Grosjean 2012-03-02  453  	struct sk_buff *skb;
> > 46be265d338833 Stephane Grosjean 2012-03-02  454  	struct can_frame *cf;
> > c11dcee7583027 Stephane Grosjean 2021-07-15  455  	enum can_state new_s=
tate =3D CAN_STATE_ERROR_ACTIVE;
> > 46be265d338833 Stephane Grosjean 2012-03-02  456  =

> > 46be265d338833 Stephane Grosjean 2012-03-02  457  	/* ignore this error=
 until 1st ts received */
> > 46be265d338833 Stephane Grosjean 2012-03-02  458  	if (n =3D=3D PCAN_US=
B_ERROR_QOVR)
> > 46be265d338833 Stephane Grosjean 2012-03-02  459  		if (!mc->pdev->time=
_ref.tick_count)
> > 46be265d338833 Stephane Grosjean 2012-03-02  460  			return 0;
> > 46be265d338833 Stephane Grosjean 2012-03-02  461  =

> > c11dcee7583027 Stephane Grosjean 2021-07-15  462  	/* allocate an skb t=
o store the error frame */
> > c11dcee7583027 Stephane Grosjean 2021-07-15  463  	skb =3D alloc_can_er=
r_skb(mc->netdev, &cf);
> =

> alloc_can_err_skb() ->
> alloc_canfd_skb()
> =

> https://elixir.bootlin.com/linux/v5.15/source/drivers/net/can/dev/skb.c#L=
210
> =

> If skb is NULL, cf is set to NULL, too.

Yeah.  Sorry about that.  The kbuild-bot doesn't do much cross function
analysis (none for functions that are not inline).  I saw that this
patch was old and could easily have checked it on my system which has
the cross function DB but I was in a rush.  :/  My bad.  Will try be a
more diligent person next time.

regards,
dan carpenter

--===============5830191229385921834==--

