Content-Type: multipart/mixed; boundary="===============8987244416514614423=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:458 lpi_config_set() error: uninitialized symbol 'strength'.
Date: Tue, 02 Mar 2021 20:01:49 +0300
Message-ID: <20210302170149.GX2222@kadam>
In-Reply-To: <CACRpkdbWtBA-ptCF7prizoP1D9cshWgpt8r4CGRRfxwcXiX61g@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8987244416514614423==
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
> =


We chould just initialize it to zero.  Eventually, (or maybe already???),
zero initializing stack variables will be the default for kernels built
with modern compilers.  So initializing it to zero in that case won't
change runtime at all.

regards,
dan carpenter

--===============8987244416514614423==--

