Content-Type: multipart/mixed; boundary="===============5047216804690166328=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ipv4: fix lock leaks
Date: Sat, 22 Jan 2022 06:57:55 +0800
Message-ID: <202201220630.r90cJXB8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5047216804690166328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220121031108.4813-1-ycaibb@gmail.com>
References: <20220121031108.4813-1-ycaibb@gmail.com>
TO: ycaibb <ycaibb@gmail.com>
TO: edumazet(a)google.com
TO: davem(a)davemloft.net
TO: yoshfuji(a)linux-ipv6.org
TO: dsahern(a)kernel.org
TO: kuba(a)kernel.org
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andrii(a)kernel.org
TO: kafai(a)fb.com
TO: songliubraving(a)fb.com

Hi ycaibb,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16=
 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ycaibb/ipv4-fix-lock-leaks=
/20220121-111241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
8aaaf2f3af2ae212428f4db1af34214225f5cec3
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201220630.r90cJXB8-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/tcp_ipv4.c:2344 listening_get_first() warn: curly braces intended?
net/ipv4/tcp_ipv4.c:2340 listening_get_first() warn: ignoring unreachable c=
ode.
net/ipv4/tcp_ipv4.c:2423 established_get_first() warn: curly braces intende=
d?

Old smatch warnings:
net/ipv4/tcp_ipv4.c:2965 bpf_iter_tcp_seq_show() error: uninitialized symbo=
l 'slow'.

vim +2344 net/ipv4/tcp_ipv4.c

ad2d61376a0517 Martin KaFai Lau 2021-07-01  2321  =

b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2322  /* Find a non empty bucke=
t (starting from st->bucket)
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2323   * and return the first s=
k from it.
a8b690f98baf9f Tom Herbert      2010-06-07  2324   */
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2325  static void *listening_ge=
t_first(struct seq_file *seq)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2326  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2327  	struct tcp_iter_state *s=
t =3D seq->private;
b08d4d3b6c0460 Yonghong Song    2020-06-23  2328  =

a8b690f98baf9f Tom Herbert      2010-06-07  2329  	st->offset =3D 0;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2330  	for (; st->bucket <=3D t=
cp_hashinfo.lhash2_mask; st->bucket++) {
05c0b35709c58b Martin KaFai Lau 2021-07-01  2331  		struct inet_listen_hash=
bucket *ilb2;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2332  		struct inet_connection_=
sock *icsk;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2333  		struct sock *sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2334  =

05c0b35709c58b Martin KaFai Lau 2021-07-01  2335  		ilb2 =3D &tcp_hashinfo.=
lhash2[st->bucket];
05c0b35709c58b Martin KaFai Lau 2021-07-01  2336  		if (hlist_empty(&ilb2->=
head))
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2337  			continue;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2338  =

05c0b35709c58b Martin KaFai Lau 2021-07-01  2339  		spin_lock(&ilb2->lock);
05c0b35709c58b Martin KaFai Lau 2021-07-01 @2340  		inet_lhash2_for_each_ic=
sk(icsk, &ilb2->head) {
05c0b35709c58b Martin KaFai Lau 2021-07-01  2341  			sk =3D (struct sock *)=
icsk;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2342  			if (seq_sk_match(seq, =
sk))
604258c8f5a979 Ryan Cai         2022-01-21  2343  				spin_unlock(&ilb2->lo=
ck);
b72acf4501d7c3 Martin KaFai Lau 2021-07-01 @2344  				return sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2345  		}
05c0b35709c58b Martin KaFai Lau 2021-07-01  2346  		spin_unlock(&ilb2->lock=
);
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2347  	}
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2348  =

b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2349  	return NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2350  }
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2351  =

b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2352  /* Find the next sk of "c=
ur" within the same bucket (i.e. st->bucket).
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2353   * If "cur" is the last o=
ne in the st->bucket,
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2354   * call listening_get_fir=
st() to return the first sk of the next
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2355   * non empty bucket.
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2356   */
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2357  static void *listening_ge=
t_next(struct seq_file *seq, void *cur)
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2358  {
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2359  	struct tcp_iter_state *s=
t =3D seq->private;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2360  	struct inet_listen_hashb=
ucket *ilb2;
05c0b35709c58b Martin KaFai Lau 2021-07-01  2361  	struct inet_connection_s=
ock *icsk;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2362  	struct sock *sk =3D cur;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2363  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  2364  	++st->num;
a8b690f98baf9f Tom Herbert      2010-06-07  2365  	++st->offset;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2366  =

05c0b35709c58b Martin KaFai Lau 2021-07-01  2367  	icsk =3D inet_csk(sk);
05c0b35709c58b Martin KaFai Lau 2021-07-01  2368  	inet_lhash2_for_each_ics=
k_continue(icsk) {
05c0b35709c58b Martin KaFai Lau 2021-07-01  2369  		sk =3D (struct sock *)i=
csk;
ad2d61376a0517 Martin KaFai Lau 2021-07-01  2370  		if (seq_sk_match(seq, s=
k))
3b24d854cb3538 Eric Dumazet     2016-04-01  2371  			return sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2372  	}
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2373  =

05c0b35709c58b Martin KaFai Lau 2021-07-01  2374  	ilb2 =3D &tcp_hashinfo.l=
hash2[st->bucket];
05c0b35709c58b Martin KaFai Lau 2021-07-01  2375  	spin_unlock(&ilb2->lock);
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2376  	++st->bucket;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2377  	return listening_get_fir=
st(seq);
^1da177e4c3f41 Linus Torvalds   2005-04-16  2378  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  2379  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  2380  static void *listening_ge=
t_idx(struct seq_file *seq, loff_t *pos)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2381  {
a8b690f98baf9f Tom Herbert      2010-06-07  2382  	struct tcp_iter_state *s=
t =3D seq->private;
a8b690f98baf9f Tom Herbert      2010-06-07  2383  	void *rc;
a8b690f98baf9f Tom Herbert      2010-06-07  2384  =

a8b690f98baf9f Tom Herbert      2010-06-07  2385  	st->bucket =3D 0;
a8b690f98baf9f Tom Herbert      2010-06-07  2386  	st->offset =3D 0;
b72acf4501d7c3 Martin KaFai Lau 2021-07-01  2387  	rc =3D listening_get_fir=
st(seq);
^1da177e4c3f41 Linus Torvalds   2005-04-16  2388  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  2389  	while (rc && *pos) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2390  		rc =3D listening_get_ne=
xt(seq, rc);
^1da177e4c3f41 Linus Torvalds   2005-04-16  2391  		--*pos;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2392  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  2393  	return rc;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2394  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  2395  =

05dbc7b59481ca Eric Dumazet     2013-10-03  2396  static inline bool empty_=
bucket(const struct tcp_iter_state *st)
6eac56040787c3 Andi Kleen       2008-08-28  2397  {
05dbc7b59481ca Eric Dumazet     2013-10-03  2398  	return hlist_nulls_empty=
(&tcp_hashinfo.ehash[st->bucket].chain);
6eac56040787c3 Andi Kleen       2008-08-28  2399  }
6eac56040787c3 Andi Kleen       2008-08-28  2400  =

a8b690f98baf9f Tom Herbert      2010-06-07  2401  /*
a8b690f98baf9f Tom Herbert      2010-06-07  2402   * Get first established =
socket starting from bucket given in st->bucket.
a8b690f98baf9f Tom Herbert      2010-06-07  2403   * If st->bucket is zero,=
 the very first socket in the hash is returned.
a8b690f98baf9f Tom Herbert      2010-06-07  2404   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  2405  static void *established_=
get_first(struct seq_file *seq)
^1da177e4c3f41 Linus Torvalds   2005-04-16  2406  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2407  	struct tcp_iter_state *s=
t =3D seq->private;
b08d4d3b6c0460 Yonghong Song    2020-06-23  2408  =

a8b690f98baf9f Tom Herbert      2010-06-07  2409  	st->offset =3D 0;
a8b690f98baf9f Tom Herbert      2010-06-07  2410  	for (; st->bucket <=3D t=
cp_hashinfo.ehash_mask; ++st->bucket) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  2411  		struct sock *sk;
3ab5aee7fe840b Eric Dumazet     2008-11-16  2412  		struct hlist_nulls_node=
 *node;
9db66bdcc83749 Eric Dumazet     2008-11-20  2413  		spinlock_t *lock =3D in=
et_ehash_lockp(&tcp_hashinfo, st->bucket);
^1da177e4c3f41 Linus Torvalds   2005-04-16  2414  =

6eac56040787c3 Andi Kleen       2008-08-28  2415  		/* Lockless fast path f=
or the common case of empty buckets */
6eac56040787c3 Andi Kleen       2008-08-28  2416  		if (empty_bucket(st))
6eac56040787c3 Andi Kleen       2008-08-28  2417  			continue;
6eac56040787c3 Andi Kleen       2008-08-28  2418  =

9db66bdcc83749 Eric Dumazet     2008-11-20  2419  		spin_lock_bh(lock);
3ab5aee7fe840b Eric Dumazet     2008-11-16  2420  		sk_nulls_for_each(sk, n=
ode, &tcp_hashinfo.ehash[st->bucket].chain) {
ad2d61376a0517 Martin KaFai Lau 2021-07-01  2421  			if (seq_sk_match(seq, =
sk))
604258c8f5a979 Ryan Cai         2022-01-21  2422  				spin_unlock_bh(lock);
ad2d61376a0517 Martin KaFai Lau 2021-07-01 @2423  				return sk;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2424  		}
9db66bdcc83749 Eric Dumazet     2008-11-20  2425  		spin_unlock_bh(lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  2426  	}
ad2d61376a0517 Martin KaFai Lau 2021-07-01  2427  =

ad2d61376a0517 Martin KaFai Lau 2021-07-01  2428  	return NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  2429  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  2430  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5047216804690166328==--

