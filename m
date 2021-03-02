Content-Type: multipart/mixed; boundary="===============2364222555456502538=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:458 lpi_config_set() error: uninitialized symbol 'strength'.
Date: Tue, 02 Mar 2021 19:28:05 +0300
Message-ID: <20210302162805.GV2222@kadam>
In-Reply-To: <CACRpkdbWtBA-ptCF7prizoP1D9cshWgpt8r4CGRRfxwcXiX61g@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2364222555456502538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 04:47:01PM +0100, Linus Walleij wrote:
> On Sat, Feb 27, 2021 at 10:22 AM Dan Carpenter <dan.carpenter@oracle.co=
m> wrote:
> =

> > New smatch warnings:
> > drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:458 lpi_config_set() error: un=
initialized symbol 'strength'.
> >
> > Old smatch warnings:
> > drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:457 lpi_config_set() error: un=
initialized symbol 'pullup'.
> =

> I don't think these are real problems, but maybe there is some way to exp=
licitly
> express that so that smatch knows as well?

They will call syzbot warning at runtime as well.  Syzbot complains
about the read, and not that the value is important for flow analysis.

regards,
dan carpenter

--===============2364222555456502538==--

