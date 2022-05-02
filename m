Content-Type: multipart/mixed; boundary="===============0892497188495351817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/route.c:670:24: warning: The statement 'if (fnhe->fnhe_genid!=genid) fnhe->fnhe_genid=genid' is logically equivalent to 'fnhe->fnhe_genid=genid'. [duplicateConditionalAssign]
Date: Mon, 02 May 2022 20:06:57 +0800
Message-ID: <202205021935.b0teAqtP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0892497188495351817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: David Ahern <dsahern@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: 67d6d681e15b578c1725bad8ad079e05d1c48a8e ipv4: make exception cache=
 less predictible
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 67d6d681e15b578c1725bad8ad079e05d1c48a8e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ipv4/tcp_bpf.c:476:22: warning: Parameter 'base' can be declared wit=
h const [constParameter]
          struct proto *base)
                        ^
--
>> net/ipv4/route.c:670:24: warning: The statement 'if (fnhe->fnhe_genid!=
=3Dgenid) fnhe->fnhe_genid=3Dgenid' is logically equivalent to 'fnhe->fnhe_=
genid=3Dgenid'. [duplicateConditionalAssign]
     if (fnhe->fnhe_genid !=3D genid)
                          ^
   net/ipv4/route.c:671:21: note: Assignment 'fnhe->fnhe_genid=3Dgenid'
      fnhe->fnhe_genid =3D genid;
                       ^
   net/ipv4/route.c:670:24: note: Condition 'fnhe->fnhe_genid!=3Dgenid' is =
redundant
     if (fnhe->fnhe_genid !=3D genid)
                          ^
>> net/ipv4/route.c:592:40: warning: Found suspicious operator ',' [constSt=
atement]
    struct fib_nh_exception __rcu **fnhe_p, **oldest_p;
                                          ^
>> net/ipv4/route.c:3399:13: warning: Uninitialized variable: fa->fa_slen [=
uninitvar]
       if (fa->fa_slen =3D=3D slen &&
               ^
>> net/ipv4/route.c:221:58: warning: Parameter 'v' can be declared with con=
st [constParameter]
   static int rt_cache_seq_show(struct seq_file *seq, void *v)
                                                            ^

vim +670 net/ipv4/route.c

2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  589  =

67d6d681e15b57 Eric Dumazet           2021-08-29  590  static void fnhe_rem=
ove_oldest(struct fnhe_hash_bucket *hash)
4895c771c7f006 David S. Miller        2012-07-17  591  {
67d6d681e15b57 Eric Dumazet           2021-08-29 @592  	struct fib_nh_excep=
tion __rcu **fnhe_p, **oldest_p;
67d6d681e15b57 Eric Dumazet           2021-08-29  593  	struct fib_nh_excep=
tion *fnhe, *oldest =3D NULL;
4895c771c7f006 David S. Miller        2012-07-17  594  =

67d6d681e15b57 Eric Dumazet           2021-08-29  595  	for (fnhe_p =3D &ha=
sh->chain; ; fnhe_p =3D &fnhe->fnhe_next) {
67d6d681e15b57 Eric Dumazet           2021-08-29  596  		fnhe =3D rcu_deref=
erence_protected(*fnhe_p,
67d6d681e15b57 Eric Dumazet           2021-08-29  597  						 lockdep_is_he=
ld(&fnhe_lock));
67d6d681e15b57 Eric Dumazet           2021-08-29  598  		if (!fnhe)
67d6d681e15b57 Eric Dumazet           2021-08-29  599  			break;
67d6d681e15b57 Eric Dumazet           2021-08-29  600  		if (!oldest ||
67d6d681e15b57 Eric Dumazet           2021-08-29  601  		    time_before(fn=
he->fnhe_stamp, oldest->fnhe_stamp)) {
4895c771c7f006 David S. Miller        2012-07-17  602  			oldest =3D fnhe;
67d6d681e15b57 Eric Dumazet           2021-08-29  603  			oldest_p =3D fnhe=
_p;
67d6d681e15b57 Eric Dumazet           2021-08-29  604  		}
4895c771c7f006 David S. Miller        2012-07-17  605  	}
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  606  	fnhe_flush_rou=
tes(oldest);
67d6d681e15b57 Eric Dumazet           2021-08-29  607  	*oldest_p =3D oldes=
t->fnhe_next;
67d6d681e15b57 Eric Dumazet           2021-08-29  608  	kfree_rcu(oldest, r=
cu);
4895c771c7f006 David S. Miller        2012-07-17  609  }
4895c771c7f006 David S. Miller        2012-07-17  610  =

6457378fe79681 Eric Dumazet           2021-08-25  611  static u32 fnhe_hash=
fun(__be32 daddr)
d3a25c980fc231 David S. Miller        2012-07-17  612  {
6457378fe79681 Eric Dumazet           2021-08-25  613  	static siphash_key_=
t fnhe_hash_key __read_mostly;
6457378fe79681 Eric Dumazet           2021-08-25  614  	u64 hval;
d3a25c980fc231 David S. Miller        2012-07-17  615  =

6457378fe79681 Eric Dumazet           2021-08-25  616  	net_get_random_once=
(&fnhe_hash_key, sizeof(fnhe_hash_key));
6457378fe79681 Eric Dumazet           2021-08-25  617  	hval =3D siphash_1u=
32((__force u32)daddr, &fnhe_hash_key);
6457378fe79681 Eric Dumazet           2021-08-25  618  	return hash_64(hval=
, FNHE_HASH_SHIFT);
d3a25c980fc231 David S. Miller        2012-07-17  619  }
d3a25c980fc231 David S. Miller        2012-07-17  620  =

387aa65a89434a Timo Ter=C3=A4s             2013-05-27  621  static void fil=
l_route_from_fnhe(struct rtable *rt, struct fib_nh_exception *fnhe)
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  622  {
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  623  	rt->rt_pmtu =
=3D fnhe->fnhe_pmtu;
d52e5a7e7ca494 Sabrina Dubroca        2018-03-14  624  	rt->rt_mtu_locked =
=3D fnhe->fnhe_mtu_locked;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  625  	rt->dst.expire=
s =3D fnhe->fnhe_expires;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  626  =

387aa65a89434a Timo Ter=C3=A4s             2013-05-27  627  	if (fnhe->fnhe=
_gw) {
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  628  		rt->rt_flags =
|=3D RTCF_REDIRECTED;
77d5bc7e6a6cf8 David Ahern            2019-09-17  629  		rt->rt_uses_gatewa=
y =3D 1;
1550c171935d26 David Ahern            2019-04-05  630  		rt->rt_gw_family =
=3D AF_INET;
1550c171935d26 David Ahern            2019-04-05  631  		rt->rt_gw4 =3D fnh=
e->fnhe_gw;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  632  	}
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  633  }
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  634  =

a5995e7107eb3d David Ahern            2019-04-30  635  static void update_o=
r_create_fnhe(struct fib_nh_common *nhc, __be32 daddr,
a5995e7107eb3d David Ahern            2019-04-30  636  				  __be32 gw, u32=
 pmtu, bool lock,
a5995e7107eb3d David Ahern            2019-04-30  637  				  unsigned long =
expires)
4895c771c7f006 David S. Miller        2012-07-17  638  {
aee06da6726d49 Julian Anastasov       2012-07-18  639  	struct fnhe_hash_bu=
cket *hash;
4895c771c7f006 David S. Miller        2012-07-17  640  	struct fib_nh_excep=
tion *fnhe;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  641  	struct rtable =
*rt;
cebe84c6190d74 Xin Long               2017-11-17  642  	u32 genid, hval;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  643  	unsigned int i;
4895c771c7f006 David S. Miller        2012-07-17  644  	int depth;
cebe84c6190d74 Xin Long               2017-11-17  645  =

a5995e7107eb3d David Ahern            2019-04-30  646  	genid =3D fnhe_geni=
d(dev_net(nhc->nhc_dev));
cebe84c6190d74 Xin Long               2017-11-17  647  	hval =3D fnhe_hashf=
un(daddr);
4895c771c7f006 David S. Miller        2012-07-17  648  =

c5038a8327b980 David S. Miller        2012-07-31  649  	spin_lock_bh(&fnhe_=
lock);
aee06da6726d49 Julian Anastasov       2012-07-18  650  =

a5995e7107eb3d David Ahern            2019-04-30  651  	hash =3D rcu_derefe=
rence(nhc->nhc_exceptions);
4895c771c7f006 David S. Miller        2012-07-17  652  	if (!hash) {
6396bb221514d2 Kees Cook              2018-06-12  653  		hash =3D kcalloc(F=
NHE_HASH_SIZE, sizeof(*hash), GFP_ATOMIC);
4895c771c7f006 David S. Miller        2012-07-17  654  		if (!hash)
aee06da6726d49 Julian Anastasov       2012-07-18  655  			goto out_unlock;
a5995e7107eb3d David Ahern            2019-04-30  656  		rcu_assign_pointer=
(nhc->nhc_exceptions, hash);
4895c771c7f006 David S. Miller        2012-07-17  657  	}
4895c771c7f006 David S. Miller        2012-07-17  658  =

4895c771c7f006 David S. Miller        2012-07-17  659  	hash +=3D hval;
4895c771c7f006 David S. Miller        2012-07-17  660  =

4895c771c7f006 David S. Miller        2012-07-17  661  	depth =3D 0;
4895c771c7f006 David S. Miller        2012-07-17  662  	for (fnhe =3D rcu_d=
ereference(hash->chain); fnhe;
4895c771c7f006 David S. Miller        2012-07-17  663  	     fnhe =3D rcu_d=
ereference(fnhe->fnhe_next)) {
4895c771c7f006 David S. Miller        2012-07-17  664  		if (fnhe->fnhe_dad=
dr =3D=3D daddr)
aee06da6726d49 Julian Anastasov       2012-07-18  665  			break;
4895c771c7f006 David S. Miller        2012-07-17  666  		depth++;
4895c771c7f006 David S. Miller        2012-07-17  667  	}
4895c771c7f006 David S. Miller        2012-07-17  668  =

aee06da6726d49 Julian Anastasov       2012-07-18  669  	if (fnhe) {
cebe84c6190d74 Xin Long               2017-11-17 @670  		if (fnhe->fnhe_gen=
id !=3D genid)
cebe84c6190d74 Xin Long               2017-11-17  671  			fnhe->fnhe_genid =
=3D genid;
aee06da6726d49 Julian Anastasov       2012-07-18  672  		if (gw)
aee06da6726d49 Julian Anastasov       2012-07-18  673  			fnhe->fnhe_gw =3D=
 gw;
d52e5a7e7ca494 Sabrina Dubroca        2018-03-14  674  		if (pmtu) {
aee06da6726d49 Julian Anastasov       2012-07-18  675  			fnhe->fnhe_pmtu =
=3D pmtu;
d52e5a7e7ca494 Sabrina Dubroca        2018-03-14  676  			fnhe->fnhe_mtu_lo=
cked =3D lock;
d52e5a7e7ca494 Sabrina Dubroca        2018-03-14  677  		}
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  678  		fnhe->fnhe_ex=
pires =3D max(1UL, expires);
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  679  		/* Update all=
 cached dsts too */
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  680  		rt =3D rcu_de=
reference(fnhe->fnhe_rth_input);
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  681  		if (rt)
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  682  			fill_route_f=
rom_fnhe(rt, fnhe);
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  683  		rt =3D rcu_de=
reference(fnhe->fnhe_rth_output);
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  684  		if (rt)
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  685  			fill_route_f=
rom_fnhe(rt, fnhe);
aee06da6726d49 Julian Anastasov       2012-07-18  686  	} else {
67d6d681e15b57 Eric Dumazet           2021-08-29  687  		/* Randomize max d=
epth to avoid some side channels attacks. */
67d6d681e15b57 Eric Dumazet           2021-08-29  688  		int max_depth =3D =
FNHE_RECLAIM_DEPTH +
67d6d681e15b57 Eric Dumazet           2021-08-29  689  				prandom_u32_max(=
FNHE_RECLAIM_DEPTH);
67d6d681e15b57 Eric Dumazet           2021-08-29  690  =

67d6d681e15b57 Eric Dumazet           2021-08-29  691  		while (depth > max=
_depth) {
67d6d681e15b57 Eric Dumazet           2021-08-29  692  			fnhe_remove_oldes=
t(hash);
67d6d681e15b57 Eric Dumazet           2021-08-29  693  			depth--;
67d6d681e15b57 Eric Dumazet           2021-08-29  694  		}
67d6d681e15b57 Eric Dumazet           2021-08-29  695  =

4895c771c7f006 David S. Miller        2012-07-17  696  		fnhe =3D kzalloc(s=
izeof(*fnhe), GFP_ATOMIC);
4895c771c7f006 David S. Miller        2012-07-17  697  		if (!fnhe)
aee06da6726d49 Julian Anastasov       2012-07-18  698  			goto out_unlock;
4895c771c7f006 David S. Miller        2012-07-17  699  =

4895c771c7f006 David S. Miller        2012-07-17  700  		fnhe->fnhe_next =
=3D hash->chain;
67d6d681e15b57 Eric Dumazet           2021-08-29  701  =

cebe84c6190d74 Xin Long               2017-11-17  702  		fnhe->fnhe_genid =
=3D genid;
4895c771c7f006 David S. Miller        2012-07-17  703  		fnhe->fnhe_daddr =
=3D daddr;
aee06da6726d49 Julian Anastasov       2012-07-18  704  		fnhe->fnhe_gw =3D =
gw;
aee06da6726d49 Julian Anastasov       2012-07-18  705  		fnhe->fnhe_pmtu =
=3D pmtu;
d52e5a7e7ca494 Sabrina Dubroca        2018-03-14  706  		fnhe->fnhe_mtu_loc=
ked =3D lock;
94720e3aee6884 Julian Anastasov       2018-05-02  707  		fnhe->fnhe_expires=
 =3D max(1UL, expires);
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  708  =

67d6d681e15b57 Eric Dumazet           2021-08-29  709  		rcu_assign_pointer=
(hash->chain, fnhe);
67d6d681e15b57 Eric Dumazet           2021-08-29  710  =

387aa65a89434a Timo Ter=C3=A4s             2013-05-27  711  		/* Exception =
created; mark the cached routes for the nexthop
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  712  		 * stale, so =
anyone caching it rechecks if this exception
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  713  		 * applies to=
 them.
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  714  		 */
0f457a36626fa9 David Ahern            2019-04-30  715  		rt =3D rcu_derefer=
ence(nhc->nhc_rth_input);
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  716  		if (rt)
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  717  			rt->dst.obso=
lete =3D DST_OBSOLETE_KILL;
2ffae99d1fac27 Timo Ter=C3=A4s             2013-06-27  718  =

387aa65a89434a Timo Ter=C3=A4s             2013-05-27  719  		for_each_poss=
ible_cpu(i) {
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  720  			struct rtabl=
e __rcu **prt;
6ad086009f87f6 Shubhankar Kuranagatti 2021-03-12  721  =

0f457a36626fa9 David Ahern            2019-04-30  722  			prt =3D per_cpu_p=
tr(nhc->nhc_pcpu_rth_output, i);
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  723  			rt =3D rcu_d=
ereference(*prt);
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  724  			if (rt)
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  725  				rt->dst.obs=
olete =3D DST_OBSOLETE_KILL;
387aa65a89434a Timo Ter=C3=A4s             2013-05-27  726  		}
aee06da6726d49 Julian Anastasov       2012-07-18  727  	}
aee06da6726d49 Julian Anastasov       2012-07-18  728  =

4895c771c7f006 David S. Miller        2012-07-17  729  	fnhe->fnhe_stamp =
=3D jiffies;
aee06da6726d49 Julian Anastasov       2012-07-18  730  =

aee06da6726d49 Julian Anastasov       2012-07-18  731  out_unlock:
c5038a8327b980 David S. Miller        2012-07-31  732  	spin_unlock_bh(&fnh=
e_lock);
4895c771c7f006 David S. Miller        2012-07-17  733  }
4895c771c7f006 David S. Miller        2012-07-17  734  =


:::::: The code at line 670 was first introduced by commit
:::::: cebe84c6190d741045a322f5343f717139993c08 route: also update fnhe_gen=
id when updating a route cache

:::::: TO: Xin Long <lucien.xin@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0892497188495351817==--

