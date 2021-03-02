Content-Type: multipart/mixed; boundary="===============6806815286183392672=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:458 lpi_config_set() error: uninitialized symbol 'strength'.
Date: Tue, 02 Mar 2021 19:32:11 +0300
Message-ID: <20210302163211.GW2222@kadam>
In-Reply-To: <20210302162805.GV2222@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6806815286183392672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 07:28:05PM +0300, Dan Carpenter wrote:
> On Tue, Mar 02, 2021 at 04:47:01PM +0100, Linus Walleij wrote:
> > On Sat, Feb 27, 2021 at 10:22 AM Dan Carpenter <dan.carpenter@oracle.=
com> wrote:
> > =

> > > New smatch warnings:
> > > drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:458 lpi_config_set() error: =
uninitialized symbol 'strength'.
> > >
> > > Old smatch warnings:
> > > drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:457 lpi_config_set() error: =
uninitialized symbol 'pullup'.
> > =

> > I don't think these are real problems, but maybe there is some way to e=
xplicitly
> > express that so that smatch knows as well?
> =

> They will call syzbot warning at runtime as well.  Syzbot complains
> about the read, and not that the value is important for flow analysis.

s/flow analysis/flow control/...  Syzbot doesn't care if the
uninitialized value affects runtime.

regards,
dan carpenter

--===============6806815286183392672==--

