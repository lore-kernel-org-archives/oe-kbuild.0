Content-Type: multipart/mixed; boundary="===============4789306914496408594=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [chrome-os:chromeos-5.10 99/235] drivers/usb/typec/port-mapper.c:168 typec_link_port() warn: missing error code 'ret'
Date: Wed, 08 Dec 2021 09:18:46 +0300
Message-ID: <20211208061846.GG1956@kadam>
In-Reply-To: <CABXOdTf1U5Jzjua6oU9RhBNMGxMGg_uEfs7CWCTnr3HFarp5AQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4789306914496408594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 08:26:09AM -0800, Guenter Roeck wrote:
> On Tue, Dec 7, 2021 at 2:58 AM Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > 98e43a40b551c9 Heikki Krogerus 2021-04-07  165
> > 98e43a40b551c9 Heikki Krogerus 2021-04-07  166          connector =3D f=
ind_connector(node);
> > 98e43a40b551c9 Heikki Krogerus 2021-04-07  167          if (!connector)
> > 98e43a40b551c9 Heikki Krogerus 2021-04-07 @168                  goto re=
move_node;
> >
> > Should there be an error code on this path?
> >
> =

> Apparently not. See your upstream commit 434438d8f9d3 ("usb: typec:
> silence a static checker warning") which silences this warning.
> =


Lol.  And my commit message was so useless as well...  How did past me
know it was intentional?  But Heikki says it's right so it must be.

regards,
dan carpenter

--===============4789306914496408594==--

