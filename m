Content-Type: multipart/mixed; boundary="===============7380345584405637449=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Date: Mon, 07 Oct 2019 16:17:17 +0300
Message-ID: <20191007131717.GJ21515@kadam>
In-Reply-To: <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7380345584405637449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 12:36:10PM +0000, Biju Das wrote:
> > err_unreg_port:
> > 	typec_unregister_port(hd3ss3220->port);
> > err_put_role:
> > 	usb_role_switch_put(hd3ss3220->role_sw);
> > err_put_handle:
> > 	fwnode_handle_put(foo bar);
> >
> > 	return ret;
> > The rule behind this style of error handling is that you just have to k=
eep track
> > of the most recently allocated resource and at the bottom you free them=
 in
> > the reverse order from how you allocated them.  Here we had allocated -
> > >role_sw but the typec_register_port() so we do goto free_role_sw;  Now
> > people can guess what the goto does because the name is descriptive and
> > since it matches the most recently allocated resource that means it's o=
kay.
> =

> Yes I agree. But In this case, only one error label is sufficient.

Yes.  You could fix the leak by passing an invalid pointer to
typec_unregister_port() but that way is asking for trouble in the
future...  These are the kinds of bugs I fix all the time because I'm
working with static analysis.  Clearly defined error labels are more
readable and less bug prone.

regards,
dan carpenter
--===============7380345584405637449==--

