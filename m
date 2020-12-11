Content-Type: multipart/mixed; boundary="===============2359517149423230630=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next 3/4] sch_htb: Stats for offloaded HTB
Date: Fri, 11 Dec 2020 11:41:41 +0300
Message-ID: <20201211084141.GQ2789@kadam>
In-Reply-To: <7d1a6afe-d084-bdbd-168a-3bcb88910e2d@nvidia.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2359517149423230630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 05:07:28PM +0200, Maxim Mikityanskiy wrote:
> On 2020-12-10 10:28, Dan Carpenter wrote:
> > Hi Maxim,
> > =

> > =

> > url:    https://github.com/0day-ci/linux/commits/Maxim-Mikityanskiy/HTB=
-offload/20201210-000703
> > base:
> > https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> > afae3cc2da100ead3cd6ef4bb1fb8bc9d4b817c5
> > config: i386-randconfig-m021-20201209 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > net/sched/sch_htb.c:1310 htb_dump_class_stats() error: we previously as=
sumed 'cl->leaf.q' could be null (see line 1300)
> > =

> > vim +1310 net/sched/sch_htb.c
> > =

> > ^1da177e4c3f415 Linus Torvalds        2005-04-16  1289  static int
> > 87990467d387f92 Stephen Hemminger     2006-08-10  1290  htb_dump_class_=
stats(struct Qdisc *sch, unsigned long arg, struct gnet_dump *d)
> > ^1da177e4c3f415 Linus Torvalds        2005-04-16  1291  {
> > ^1da177e4c3f415 Linus Torvalds        2005-04-16  1292  	struct htb_cla=
ss *cl =3D (struct htb_class *)arg;
> > 1e0ac0107df684e Maxim Mikityanskiy    2020-12-09  1293  	struct htb_sch=
ed *q =3D qdisc_priv(sch);
> > 338ed9b4de57c4b Eric Dumazet          2016-06-21  1294  	struct gnet_st=
ats_queue qs =3D {
> > 338ed9b4de57c4b Eric Dumazet          2016-06-21  1295  		.drops =3D cl=
->drops,
> > 3c75f6ee139d464 Eric Dumazet          2017-09-18  1296  		.overlimits =
=3D cl->overlimits,
> > 338ed9b4de57c4b Eric Dumazet          2016-06-21  1297  	};
> > 6401585366326fc John Fastabend        2014-09-28  1298  	__u32 qlen =3D=
 0;
> > ^1da177e4c3f415 Linus Torvalds        2005-04-16  1299
> > 5dd431b6b92c0db Paolo Abeni           2019-03-28 @1300  	if (!cl->level=
 && cl->leaf.q)
> >                                                                        =
            ^^^^^^^^^^
> > Check for NULL
> =

> Well, I don't think this is real... I don't see any possibility how
> cl->leaf.q can be NULL for a leaf class. However, I'll add a similar check
> below anyway.
> =


Another option is to remove this check if it's really impossible.

regards,
dan carpenter

--===============2359517149423230630==--

