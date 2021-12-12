Content-Type: multipart/mixed; boundary="===============3253957463851200664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4829/6579] net/ipv6/route.c:661 rt6_probe() warn: sleeping in atomic context
Date: Sun, 12 Dec 2021 21:39:30 +0800
Message-ID: <202112122113.vbkR1Jss-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3253957463851200664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: fb67510ba9bd3ed1f8a2db4946e847ca0418f8dc [4829/6579] ipv6: add net =
device refcount tracker to rt6_probe_deferred()
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211212/202112122113.vbkR1Jss-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv6/route.c:661 rt6_probe() warn: sleeping in atomic context

Old smatch warnings:
net/ipv6/route.c:3424 ip6_route_check_nh() error: we previously assumed '_d=
ev' could be null (see line 3384)

vim +661 net/ipv6/route.c

c2f17e827b4199 Hannes Frederic Sowa         2013-10-21  610  =

cc3a86c802f0ba David Ahern                  2019-04-09  611  static void rt=
6_probe(struct fib6_nh *fib6_nh)
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  612  {
f547fac624be53 Sabrina Dubroca              2018-10-12  613  	struct __rt6_=
probe_work *work =3D NULL;
5e670d844b2a4e David Ahern                  2018-04-17  614  	const struct =
in6_addr *nh_gw;
1bef4c223b8588 Eric Dumazet                 2019-11-07  615  	unsigned long=
 last_probe;
f2c31e32b378a6 Eric Dumazet                 2011-07-29  616  	struct neighb=
our *neigh;
5e670d844b2a4e David Ahern                  2018-04-17  617  	struct net_de=
vice *dev;
f547fac624be53 Sabrina Dubroca              2018-10-12  618  	struct inet6_=
dev *idev;
5e670d844b2a4e David Ahern                  2018-04-17  619  =

270972554c91ac YOSHIFUJI Hideaki            2006-03-20  620  	/*
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  621  	 * Okay, this=
 does not seem to be appropriate
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  622  	 * for now, h=
owever, we need to check if it
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  623  	 * is really =
so; aka Router Reachability Probing.
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  624  	 *
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  625  	 * Router Rea=
chability Probe MUST be rate-limited
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  626  	 * to no more=
 than one per minute.
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  627  	 */
004b39427f9456 Hangbin Liu                  2019-11-20  628  	if (!fib6_nh-=
>fib_nh_gw_family)
7ff74a596b6aa4 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  629  		return;
5e670d844b2a4e David Ahern                  2018-04-17  630  =

cc3a86c802f0ba David Ahern                  2019-04-09  631  	nh_gw =3D &fi=
b6_nh->fib_nh_gw6;
cc3a86c802f0ba David Ahern                  2019-04-09  632  	dev =3D fib6_=
nh->fib_nh_dev;
2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  633  	rcu_read_lock_bh();
1bef4c223b8588 Eric Dumazet                 2019-11-07  634  	last_probe =
=3D READ_ONCE(fib6_nh->last_probe);
f547fac624be53 Sabrina Dubroca              2018-10-12  635  	idev =3D __in=
6_dev_get(dev);
5e670d844b2a4e David Ahern                  2018-04-17  636  	neigh =3D __i=
pv6_neigh_lookup_noref(dev, nh_gw);
2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  637  	if (neigh) {
8d6c31bf574177 Martin KaFai Lau             2015-07-24  638  		if (neigh->n=
ud_state & NUD_VALID)
8d6c31bf574177 Martin KaFai Lau             2015-07-24  639  			goto out;
8d6c31bf574177 Martin KaFai Lau             2015-07-24  640  =

2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  641  		write_lock(&neigh->lock);
990edb428c2c85 Martin KaFai Lau             2015-07-24  642  		if (!(neigh-=
>nud_state & NUD_VALID) &&
990edb428c2c85 Martin KaFai Lau             2015-07-24  643  		    time_aft=
er(jiffies,
dcd1f572954f9d David Ahern                  2018-04-18  644  			       neig=
h->updated + idev->cnf.rtr_probe_interval)) {
c2f17e827b4199 Hannes Frederic Sowa         2013-10-21  645  			work =3D km=
alloc(sizeof(*work), GFP_ATOMIC);
990edb428c2c85 Martin KaFai Lau             2015-07-24  646  			if (work)
7e980569642811 Jiri Benc                    2013-12-11  647  				__neigh_se=
t_probe_once(neigh);
990edb428c2c85 Martin KaFai Lau             2015-07-24  648  		}
2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  649  		write_unlock(&neigh->lock);
1bef4c223b8588 Eric Dumazet                 2019-11-07  650  	} else if (ti=
me_after(jiffies, last_probe +
f547fac624be53 Sabrina Dubroca              2018-10-12  651  				       ide=
v->cnf.rtr_probe_interval)) {
990edb428c2c85 Martin KaFai Lau             2015-07-24  652  		work =3D kma=
lloc(sizeof(*work), GFP_ATOMIC);
990edb428c2c85 Martin KaFai Lau             2015-07-24  653  	}
2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  654  =

1bef4c223b8588 Eric Dumazet                 2019-11-07  655  	if (!work || =
cmpxchg(&fib6_nh->last_probe,
1bef4c223b8588 Eric Dumazet                 2019-11-07  656  			     last_p=
robe, jiffies) !=3D last_probe) {
1bef4c223b8588 Eric Dumazet                 2019-11-07  657  		kfree(work);
1bef4c223b8588 Eric Dumazet                 2019-11-07  658  	} else {
c2f17e827b4199 Hannes Frederic Sowa         2013-10-21  659  		INIT_WORK(&w=
ork->work, rt6_probe_deferred);
5e670d844b2a4e David Ahern                  2018-04-17  660  		work->target=
 =3D *nh_gw;
fb67510ba9bd3e Eric Dumazet                 2021-12-04 @661  		dev_hold_tra=
ck(dev, &work->dev_tracker, GFP_KERNEL);
5e670d844b2a4e David Ahern                  2018-04-17  662  		work->dev =
=3D dev;
c2f17e827b4199 Hannes Frederic Sowa         2013-10-21  663  		schedule_wor=
k(&work->work);
c2f17e827b4199 Hannes Frederic Sowa         2013-10-21  664  	}
990edb428c2c85 Martin KaFai Lau             2015-07-24  665  =

8d6c31bf574177 Martin KaFai Lau             2015-07-24  666  out:
2152caea719657 YOSHIFUJI Hideaki / =E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E 201=
3-01-17  667  	rcu_read_unlock_bh();
f2c31e32b378a6 Eric Dumazet                 2011-07-29  668  }
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  669  #else
cc3a86c802f0ba David Ahern                  2019-04-09  670  static inline =
void rt6_probe(struct fib6_nh *fib6_nh)
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  671  {
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  672  }
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  673  #endif
270972554c91ac YOSHIFUJI Hideaki            2006-03-20  674  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3253957463851200664==--

