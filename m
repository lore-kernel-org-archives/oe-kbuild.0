Content-Type: multipart/mixed; boundary="===============2121485811079366883=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/pinctrl/pinctrl-k210.c:970 k210_fpioa_probe() warn: 'pdata->clk' not released on lines: 962, 968.
Date: Mon, 02 Aug 2021 15:55:07 +0300
Message-ID: <20210802125507.GJ25548@kadam>
In-Reply-To: <DM6PR04MB708187FE0B622791011BEEB7E7EE9@DM6PR04MB7081.namprd04.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2121485811079366883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 01, 2021 at 10:50:51PM +0000, Damien Le Moal wrote:
> =

> I can add the clk_unprepare_disable() call to avoid the warning, but that=
 is
> rather pointless as the system will not boot at all if there is an error =
here.
> Thoughts ?

These static checker warnings just a one time email service.  If you
don't want to free resources then that's fine.  If people run Smatch
manually then they'll still see the warnings but the kbuild bot won't
email about it again.


regards,
dan carpenter
--===============2121485811079366883==--

