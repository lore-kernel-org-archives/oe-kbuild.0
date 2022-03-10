Content-Type: multipart/mixed; boundary="===============2865162771535130363=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/ethernet/chelsio/cxgb4/sge.c:2571 cxgb4_ethofld_send_flowc() warn: missing error code 'ret'
Date: Thu, 10 Mar 2022 12:32:30 +0300
Message-ID: <20220310093230.GC3315@kadam>
In-Reply-To: <CACT4ouey2QXf=PJThXG8adrLmCet4Ptu+VDDKBy2hOARqsghXQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2865162771535130363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 09:00:58AM +0100, =C3=8D=C3=B1igo Huguet wrote:
> On Wed, Jul 7, 2021 at 9:37 AM Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   79160a603bdb51916226caf4a6616cc4e1c58a58
> > commit: 52bfcdd87e83d9e69d22da5f26b1512ffc81deed net:CXGB4: fix leak if=
 sk_buff is not used
> > config: x86_64-randconfig-m001-20210706 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/net/ethernet/chelsio/cxgb4/sge.c:2571 cxgb4_ethofld_send_flowc(=
) warn: missing error code 'ret'
> =

> This was already reported here:
> https://lore.kernel.org/all/202107070458.FO35EqwU-lkp(a)intel.com/ =


To be honest, I saw that it was old, and I did wonder why the kbuild bot
was sending warnings from ancient code.

But at the same time, the code looked suspicious enough that I just
resent instead of investigating.  :P

With kbuild warnings, I always solemnly promise everyone that "These are
a one time email.  Feel free to ignore false positives."  Unfortunately
those promises are just lies to make people happy.

regards,
dan carpenter

--===============2865162771535130363==--

