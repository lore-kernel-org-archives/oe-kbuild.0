Content-Type: multipart/mixed; boundary="===============3343082222918769948=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 10/10] inet: add READ_ONCE(sk->sk_bound_dev_if) in INET_MATCH()
Date: Sat, 14 May 2022 05:30:14 +0800
Message-ID: <202205140547.cDVaemuQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3343082222918769948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220511233757.2001218-11-eric.dumazet@gmail.com>
References: <20220511233757.2001218-11-eric.dumazet@gmail.com>
TO: Eric Dumazet <eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-add=
-annotations-for-sk-sk_bound_dev_if/20220512-073914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
b57c7e8b76c646cf77ce4353a779a8b781592209
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
514/202205140547.cDVaemuQ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/inet_hashtables.c:413 __inet_lookup_established() error: uninitial=
ized symbol 'acookie'.
net/ipv4/inet_hashtables.c:468 __inet_check_established() error: uninitiali=
zed symbol 'acookie'.
net/ipv4/inet_hashtables.c:535 inet_ehash_lookup_by_sk() error: uninitializ=
ed symbol 'acookie'.
net/ipv4/udp.c:2566 __udp4_lib_demux_lookup() error: uninitialized symbol '=
acookie'.

Old smatch warnings:
net/ipv4/udp.c:496 __udp4_lib_lookup() warn: potential spectre issue 'udpta=
ble->hash2' [r]
net/ipv4/udp.c:2297 __udp4_lib_mcast_deliver() warn: potential spectre issu=
e 'udptable->hash2' [r]
net/ipv4/udp.c:2529 __udp4_lib_mcast_demux_lookup() warn: potential spectre=
 issue 'udp_table.hash' [r]
net/ipv4/udp.c:2560 __udp4_lib_demux_lookup() warn: potential spectre issue=
 'udp_table.hash2' [r]

vim +/acookie +413 net/ipv4/inet_hashtables.c

2c13270b441054 Eric Dumazet             2015-03-15  391  =

c67499c0e77206 Pavel Emelyanov          2008-01-31  392  struct sock *__ine=
t_lookup_established(struct net *net,
c67499c0e77206 Pavel Emelyanov          2008-01-31  393  				  struct inet_=
hashinfo *hashinfo,
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  394  				  const __be32=
 saddr, const __be16 sport,
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  395  				  const __be32=
 daddr, const u16 hnum,
3fa6f616a7a4d0 David Ahern              2017-08-07  396  				  const int di=
f, const int sdif)
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  397  {
c7228317441f4d Joe Perches              2014-05-13  398  	INET_ADDR_COOKIE(=
acookie, saddr, daddr);
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  399  	const __portpair =
ports =3D INET_COMBINED_PORTS(sport, hnum);
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  400  	struct sock *sk;
3ab5aee7fe840b Eric Dumazet             2008-11-16  401  	const struct hlis=
t_nulls_node *node;
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  402  	/* Optimize here =
for direct hit, only listening connections can
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  403  	 * have wildcards=
 anyways.
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  404  	 */
9f26b3add3783c Pavel Emelyanov          2008-06-16  405  	unsigned int hash=
 =3D inet_ehashfn(net, daddr, hnum, saddr, sport);
f373b53b5fe67a Eric Dumazet             2009-10-09  406  	unsigned int slot=
 =3D hash & hashinfo->ehash_mask;
3ab5aee7fe840b Eric Dumazet             2008-11-16  407  	struct inet_ehash=
_bucket *head =3D &hashinfo->ehash[slot];
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  408  =

3ab5aee7fe840b Eric Dumazet             2008-11-16  409  begin:
3ab5aee7fe840b Eric Dumazet             2008-11-16  410  	sk_nulls_for_each=
_rcu(sk, node, &head->chain) {
ce43b03e888947 Eric Dumazet             2012-11-30  411  		if (sk->sk_hash =
!=3D hash)
ce43b03e888947 Eric Dumazet             2012-11-30  412  			continue;
ce43b03e888947 Eric Dumazet             2012-11-30 @413  		if (likely(INET_=
MATCH(sk, net, acookie,
3fa6f616a7a4d0 David Ahern              2017-08-07  414  				      saddr, d=
addr, ports, dif, sdif))) {
41c6d650f6537e Reshetova, Elena         2017-06-30  415  			if (unlikely(!r=
efcount_inc_not_zero(&sk->sk_refcnt)))
05dbc7b59481ca Eric Dumazet             2013-10-03  416  				goto out;
ce43b03e888947 Eric Dumazet             2012-11-30  417  			if (unlikely(!I=
NET_MATCH(sk, net, acookie,
3fa6f616a7a4d0 David Ahern              2017-08-07  418  						 saddr, dadd=
r, ports,
3fa6f616a7a4d0 David Ahern              2017-08-07  419  						 dif, sdif))=
) {
05dbc7b59481ca Eric Dumazet             2013-10-03  420  				sock_gen_put(s=
k);
3ab5aee7fe840b Eric Dumazet             2008-11-16  421  				goto begin;
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  422  			}
05dbc7b59481ca Eric Dumazet             2013-10-03  423  			goto found;
3ab5aee7fe840b Eric Dumazet             2008-11-16  424  		}
3ab5aee7fe840b Eric Dumazet             2008-11-16  425  	}
3ab5aee7fe840b Eric Dumazet             2008-11-16  426  	/*
3ab5aee7fe840b Eric Dumazet             2008-11-16  427  	 * if the nulls v=
alue we got at the end of this lookup is
3ab5aee7fe840b Eric Dumazet             2008-11-16  428  	 * not the expect=
ed one, we must restart lookup.
3ab5aee7fe840b Eric Dumazet             2008-11-16  429  	 * We probably me=
t an item that was moved to another chain.
3ab5aee7fe840b Eric Dumazet             2008-11-16  430  	 */
3ab5aee7fe840b Eric Dumazet             2008-11-16  431  	if (get_nulls_val=
ue(node) !=3D slot)
3ab5aee7fe840b Eric Dumazet             2008-11-16  432  		goto begin;
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  433  out:
05dbc7b59481ca Eric Dumazet             2013-10-03  434  	sk =3D NULL;
05dbc7b59481ca Eric Dumazet             2013-10-03  435  found:
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  436  	return sk;
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  437  }
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  438  EXPORT_SYMBOL_GPL(=
__inet_lookup_established);
77a5ba55dab7b4 Pavel Emelyanov          2007-12-20  439  =

a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  440  /* called with loc=
al bh disabled */
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  441  static int __inet_=
check_established(struct inet_timewait_death_row *death_row,
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  442  				    struct soc=
k *sk, __u16 lport,
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  443  				    struct ine=
t_timewait_sock **twp)
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  444  {
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  445  	struct inet_hashi=
nfo *hinfo =3D death_row->hashinfo;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  446  	struct inet_sock =
*inet =3D inet_sk(sk);
c720c7e8383aff Eric Dumazet             2009-10-15  447  	__be32 daddr =3D =
inet->inet_rcv_saddr;
c720c7e8383aff Eric Dumazet             2009-10-15  448  	__be32 saddr =3D =
inet->inet_daddr;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  449  	int dif =3D sk->s=
k_bound_dev_if;
3fa6f616a7a4d0 David Ahern              2017-08-07  450  	struct net *net =
=3D sock_net(sk);
3fa6f616a7a4d0 David Ahern              2017-08-07  451  	int sdif =3D l3md=
ev_master_ifindex_by_index(net, dif);
c7228317441f4d Joe Perches              2014-05-13  452  	INET_ADDR_COOKIE(=
acookie, saddr, daddr);
c720c7e8383aff Eric Dumazet             2009-10-15  453  	const __portpair =
ports =3D INET_COMBINED_PORTS(inet->inet_dport, lport);
c720c7e8383aff Eric Dumazet             2009-10-15  454  	unsigned int hash=
 =3D inet_ehashfn(net, daddr, lport,
c720c7e8383aff Eric Dumazet             2009-10-15  455  					 saddr, inet-=
>inet_dport);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  456  	struct inet_ehash=
_bucket *head =3D inet_ehash_bucket(hinfo, hash);
9db66bdcc83749 Eric Dumazet             2008-11-20  457  	spinlock_t *lock =
=3D inet_ehash_lockp(hinfo, hash);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  458  	struct sock *sk2;
3ab5aee7fe840b Eric Dumazet             2008-11-16  459  	const struct hlis=
t_nulls_node *node;
05dbc7b59481ca Eric Dumazet             2013-10-03  460  	struct inet_timew=
ait_sock *tw =3D NULL;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  461  =

9db66bdcc83749 Eric Dumazet             2008-11-20  462  	spin_lock(lock);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  463  =

05dbc7b59481ca Eric Dumazet             2013-10-03  464  	sk_nulls_for_each=
(sk2, node, &head->chain) {
ce43b03e888947 Eric Dumazet             2012-11-30  465  		if (sk2->sk_hash=
 !=3D hash)
ce43b03e888947 Eric Dumazet             2012-11-30  466  			continue;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  467  =

05dbc7b59481ca Eric Dumazet             2013-10-03 @468  		if (likely(INET_=
MATCH(sk2, net, acookie,
3fa6f616a7a4d0 David Ahern              2017-08-07  469  					 saddr, daddr=
, ports, dif, sdif))) {
05dbc7b59481ca Eric Dumazet             2013-10-03  470  			if (sk2->sk_sta=
te =3D=3D TCP_TIME_WAIT) {
ce43b03e888947 Eric Dumazet             2012-11-30  471  				tw =3D inet_tw=
sk(sk2);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  472  				if (twsk_uniqu=
e(sk, sk2, twp))
05dbc7b59481ca Eric Dumazet             2013-10-03  473  					break;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  474  			}
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  475  			goto not_unique;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  476  		}
05dbc7b59481ca Eric Dumazet             2013-10-03  477  	}
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  478  =

a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  479  	/* Must record nu=
m and sport now. Otherwise we will see
05dbc7b59481ca Eric Dumazet             2013-10-03  480  	 * in hash table =
socket with a funny identity.
05dbc7b59481ca Eric Dumazet             2013-10-03  481  	 */
c720c7e8383aff Eric Dumazet             2009-10-15  482  	inet->inet_num =
=3D lport;
c720c7e8383aff Eric Dumazet             2009-10-15  483  	inet->inet_sport =
=3D htons(lport);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  484  	sk->sk_hash =3D h=
ash;
547b792cac0a03 Ilpo J=C3=A4rvinen            2008-07-25  485  	WARN_ON(!sk_=
unhashed(sk));
3ab5aee7fe840b Eric Dumazet             2008-11-16  486  	__sk_nulls_add_no=
de_rcu(sk, &head->chain);
13475a30b66cdb Eric Dumazet             2009-12-02  487  	if (tw) {
fc01538f9fb755 Eric Dumazet             2015-07-08  488  		sk_nulls_del_nod=
e_init_rcu((struct sock *)tw);
02a1d6e7a6bb02 Eric Dumazet             2016-04-27  489  		__NET_INC_STATS(=
net, LINUX_MIB_TIMEWAITRECYCLED);
13475a30b66cdb Eric Dumazet             2009-12-02  490  	}
9db66bdcc83749 Eric Dumazet             2008-11-20  491  	spin_unlock(lock);
c29a0bc4dfc4d8 Pavel Emelyanov          2008-03-31  492  	sock_prot_inuse_a=
dd(sock_net(sk), sk->sk_prot, 1);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  493  =

a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  494  	if (twp) {
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  495  		*twp =3D tw;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  496  	} else if (tw) {
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  497  		/* Silly. Should=
 hash-dance instead... */
dbe7faa4045ea8 Eric Dumazet             2015-07-08  498  		inet_twsk_desche=
dule_put(tw);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  499  	}
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  500  	return 0;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  501  =

a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  502  not_unique:
9db66bdcc83749 Eric Dumazet             2008-11-20  503  	spin_unlock(lock);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  504  	return -EADDRNOTA=
VAIL;
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  505  }
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  506  =

b2d057560b8107 Willy Tarreau            2022-05-02  507  static u64 inet_sk=
_port_offset(const struct sock *sk)
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  508  {
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  509  	const struct inet=
_sock *inet =3D inet_sk(sk);
e2baad9e4b153c Eric Dumazet             2015-05-27  510  =

c720c7e8383aff Eric Dumazet             2009-10-15  511  	return secure_ipv=
4_port_ephemeral(inet->inet_rcv_saddr,
c720c7e8383aff Eric Dumazet             2009-10-15  512  					  inet->inet_=
daddr,
c720c7e8383aff Eric Dumazet             2009-10-15  513  					  inet->inet_=
dport);
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  514  }
a7f5e7f164788a Arnaldo Carvalho de Melo 2005-12-13  515  =

01770a16616573 Ricardo Dias             2020-11-20  516  /* Searches for an=
 exsiting socket in the ehash bucket list.
01770a16616573 Ricardo Dias             2020-11-20  517   * Returns true if=
 found, false otherwise.
01770a16616573 Ricardo Dias             2020-11-20  518   */
01770a16616573 Ricardo Dias             2020-11-20  519  static bool inet_e=
hash_lookup_by_sk(struct sock *sk,
01770a16616573 Ricardo Dias             2020-11-20  520  				    struct hli=
st_nulls_head *list)
01770a16616573 Ricardo Dias             2020-11-20  521  {
01770a16616573 Ricardo Dias             2020-11-20  522  	const __portpair =
ports =3D INET_COMBINED_PORTS(sk->sk_dport, sk->sk_num);
01770a16616573 Ricardo Dias             2020-11-20  523  	const int sdif =
=3D sk->sk_bound_dev_if;
01770a16616573 Ricardo Dias             2020-11-20  524  	const int dif =3D=
 sk->sk_bound_dev_if;
01770a16616573 Ricardo Dias             2020-11-20  525  	const struct hlis=
t_nulls_node *node;
01770a16616573 Ricardo Dias             2020-11-20  526  	struct net *net =
=3D sock_net(sk);
01770a16616573 Ricardo Dias             2020-11-20  527  	struct sock *esk;
01770a16616573 Ricardo Dias             2020-11-20  528  =

01770a16616573 Ricardo Dias             2020-11-20  529  	INET_ADDR_COOKIE(=
acookie, sk->sk_daddr, sk->sk_rcv_saddr);
01770a16616573 Ricardo Dias             2020-11-20  530  =

01770a16616573 Ricardo Dias             2020-11-20  531  	sk_nulls_for_each=
_rcu(esk, node, list) {
01770a16616573 Ricardo Dias             2020-11-20  532  		if (esk->sk_hash=
 !=3D sk->sk_hash)
01770a16616573 Ricardo Dias             2020-11-20  533  			continue;
01770a16616573 Ricardo Dias             2020-11-20  534  		if (sk->sk_famil=
y =3D=3D AF_INET) {
01770a16616573 Ricardo Dias             2020-11-20 @535  			if (unlikely(IN=
ET_MATCH(esk, net, acookie,
01770a16616573 Ricardo Dias             2020-11-20  536  						sk->sk_daddr,
01770a16616573 Ricardo Dias             2020-11-20  537  						sk->sk_rcv_s=
addr,
01770a16616573 Ricardo Dias             2020-11-20  538  						ports, dif, =
sdif))) {
01770a16616573 Ricardo Dias             2020-11-20  539  				return true;
01770a16616573 Ricardo Dias             2020-11-20  540  			}
01770a16616573 Ricardo Dias             2020-11-20  541  		}
01770a16616573 Ricardo Dias             2020-11-20  542  #if IS_ENABLED(CON=
FIG_IPV6)
01770a16616573 Ricardo Dias             2020-11-20  543  		else if (sk->sk_=
family =3D=3D AF_INET6) {
01770a16616573 Ricardo Dias             2020-11-20  544  			if (unlikely(IN=
ET6_MATCH(esk, net,
01770a16616573 Ricardo Dias             2020-11-20  545  						 &sk->sk_v6_=
daddr,
01770a16616573 Ricardo Dias             2020-11-20  546  						 &sk->sk_v6_=
rcv_saddr,
01770a16616573 Ricardo Dias             2020-11-20  547  						 ports, dif,=
 sdif))) {
01770a16616573 Ricardo Dias             2020-11-20  548  				return true;
01770a16616573 Ricardo Dias             2020-11-20  549  			}
01770a16616573 Ricardo Dias             2020-11-20  550  		}
01770a16616573 Ricardo Dias             2020-11-20  551  #endif
01770a16616573 Ricardo Dias             2020-11-20  552  	}
01770a16616573 Ricardo Dias             2020-11-20  553  	return false;
01770a16616573 Ricardo Dias             2020-11-20  554  }
01770a16616573 Ricardo Dias             2020-11-20  555  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3343082222918769948==--

